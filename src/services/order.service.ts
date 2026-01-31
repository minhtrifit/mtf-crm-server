import { HashAlgorithm, VNPay } from 'vnpay';
import { TFunction } from 'i18next';
import logger from '@/configs/logger';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { prisma } from '@/libs/prisma';
import { JwtPayload } from '@/libs/auth';
import { Role } from '@/models/User';
import { HttpError, PagingType } from '@/models';
import {
  AdminOrderBody,
  AdminOrderPayload,
  DeliveryStatus,
  GetOrdersParams,
  OrderBody,
  OrderItemPayload,
  OrderPayload,
  OrderStatus,
  UpdateOrderBody
} from '@/models/Order';
import { buildPaidTimeWhere } from '@/helpers/order.helper';
import { PaymentMethod, PaymentPayload } from '@/models/Payment';
import { socketEmit } from '@/sockets/socket.emitter';
import { NotificationType } from '@/models/Notification';

export enum OrderError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'ORDER_NOT_FOUND',
  USER_NOT_FOUND = 'USER_NOT_FOUND',
  CREATED_FAILED = 'CREATED_FAILED',
  PRODUCT_NOT_FOUND = 'PRODUCT_NOT_FOUND',
  PAYMENT_NOT_FOUND = 'PAYMENT_NOT_FOUND',
  PRODUCT_STOCK_NOT_ENOUGH = 'PRODUCT_STOCK_NOT_ENOUGH',
  NO_ACCESS_PERMISSION = 'NO_ACCESS_PERMISSION'
}

export const orderService = {
  async getList(params: GetOrdersParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();
    const buyerQ = params.buyerQ;
    const fromPaidTime = params.fromPaidTime;
    const toPaidTime = params.toPaidTime;

    // Format: status
    let status: OrderStatus | undefined = undefined;
    if (params.status === OrderStatus.PENDING) status = OrderStatus.PENDING;
    if (params.status === OrderStatus.PAID) status = OrderStatus.PAID;
    if (params.status === OrderStatus.CANCELLED) status = OrderStatus.CANCELLED;

    // Format: deliveryStatus
    let deliveryStatus: DeliveryStatus | undefined = undefined;
    if (params.deliveryStatus === DeliveryStatus.ORDERED) deliveryStatus = DeliveryStatus.ORDERED;
    if (params.deliveryStatus === DeliveryStatus.CONFIRMED) deliveryStatus = DeliveryStatus.CONFIRMED;
    if (params.deliveryStatus === DeliveryStatus.PREPARING) deliveryStatus = DeliveryStatus.PREPARING;
    if (params.deliveryStatus === DeliveryStatus.SHIPPING) deliveryStatus = DeliveryStatus.SHIPPING;
    if (params.deliveryStatus === DeliveryStatus.DELIVERED) deliveryStatus = DeliveryStatus.DELIVERED;

    // Format: fromPaidTime && toPaidTime
    const paidTimeWhere = buildPaidTimeWhere(fromPaidTime, toPaidTime);

    const where: any = {
      ...(status !== undefined && { status }),
      ...(deliveryStatus !== undefined && { deliveryStatus }),
      ...(q && {
        OR: [
          { orderCode: { contains: q, mode: 'insensitive' } },
          { deliveryAddress: { contains: q, mode: 'insensitive' } },
          { note: { contains: q, mode: 'insensitive' } },
          {
            user: {
              OR: [
                { fullName: { contains: q, mode: 'insensitive' } },
                { phone: { contains: q, mode: 'insensitive' } },
                { email: { contains: q, mode: 'insensitive' } }
              ]
            }
          }
        ]
      }),
      ...(buyerQ && {
        OR: [
          {
            user: {
              OR: [
                { fullName: { contains: buyerQ, mode: 'insensitive' } },
                { phone: { contains: buyerQ, mode: 'insensitive' } },
                { email: { contains: buyerQ, mode: 'insensitive' } }
              ]
            }
          }
        ]
      }),
      ...(paidTimeWhere && {
        createdAt: paidTimeWhere
      })
    };

    const [data, total] = await Promise.all([
      prisma.order.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          user: {
            select: {
              email: true,
              fullName: true,
              avatar: true,
              phone: true,
              address: true
            }
          }
        }
      }),
      prisma.order.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async getSearchList(params: GetOrdersParams) {
    const q = params.q?.trim();

    const where: any = {
      ...(q && {
        OR: [
          { orderCode: { contains: q, mode: 'insensitive' } },
          { deliveryAddress: { contains: q, mode: 'insensitive' } },
          { note: { contains: q, mode: 'insensitive' } },
          {
            user: {
              OR: [
                { fullName: { contains: q, mode: 'insensitive' } },
                { phone: { contains: q, mode: 'insensitive' } },
                { email: { contains: q, mode: 'insensitive' } }
              ]
            }
          }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.order.findMany({
        where,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          user: {
            select: {
              email: true,
              fullName: true,
              avatar: true,
              phone: true,
              address: true
            }
          },
          payments: true
        }
      }),
      prisma.order.count({ where })
    ]);

    return { data, total };
  },

  async getById(id: string) {
    // Find Order with ID
    const order = await prisma.order.findUnique({
      where: { id: id },
      include: {
        user: {
          select: {
            id: true,
            fullName: true,
            email: true,
            phone: true,
            address: true
          }
        },
        items: {
          include: {
            product: true
          }
        },
        payments: true
      }
    });

    if (!order) {
      throw new Error(OrderError.NOT_FOUND);
    }

    return order;
  },

  async getListByUserId(id: string, params: GetOrdersParams, jwtPayload: JwtPayload) {
    if (jwtPayload.role === Role.USER && jwtPayload.userId !== id) {
      throw new Error(OrderError.NO_ACCESS_PERMISSION);
    }

    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();
    const buyerQ = params.buyerQ;
    const fromPaidTime = params.fromPaidTime;
    const toPaidTime = params.toPaidTime;

    // Format: status
    let status: OrderStatus | undefined = undefined;
    if (params.status === OrderStatus.PENDING) status = OrderStatus.PENDING;
    if (params.status === OrderStatus.PAID) status = OrderStatus.PAID;
    if (params.status === OrderStatus.CANCELLED) status = OrderStatus.CANCELLED;

    // Format: deliveryStatus
    let deliveryStatus: DeliveryStatus | undefined = undefined;
    if (params.deliveryStatus === DeliveryStatus.ORDERED) deliveryStatus = DeliveryStatus.ORDERED;
    if (params.deliveryStatus === DeliveryStatus.CONFIRMED) deliveryStatus = DeliveryStatus.CONFIRMED;
    if (params.deliveryStatus === DeliveryStatus.PREPARING) deliveryStatus = DeliveryStatus.PREPARING;
    if (params.deliveryStatus === DeliveryStatus.SHIPPING) deliveryStatus = DeliveryStatus.SHIPPING;
    if (params.deliveryStatus === DeliveryStatus.DELIVERED) deliveryStatus = DeliveryStatus.DELIVERED;

    // Format: fromPaidTime && toPaidTime
    const paidTimeWhere = buildPaidTimeWhere(fromPaidTime, toPaidTime);

    const where: any = {
      ...{ userId: id },
      ...(status !== undefined && { status }),
      ...(deliveryStatus !== undefined && { deliveryStatus }),
      ...(q && {
        OR: [
          { orderCode: { contains: q, mode: 'insensitive' } },
          { deliveryAddress: { contains: q, mode: 'insensitive' } },
          { note: { contains: q, mode: 'insensitive' } }
        ]
      }),
      ...(buyerQ && {
        OR: [
          {
            user: {
              OR: [
                { fullName: { contains: buyerQ, mode: 'insensitive' } },
                { phone: { contains: buyerQ, mode: 'insensitive' } },
                { email: { contains: buyerQ, mode: 'insensitive' } }
              ]
            }
          }
        ]
      }),
      ...(paidTimeWhere && {
        createdAt: paidTimeWhere
      })
    };

    const [data, total] = await Promise.all([
      prisma.order.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          user: {
            select: {
              email: true,
              fullName: true,
              phone: true,
              address: true
            }
          }
        }
      }),
      prisma.order.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async createCod(payload: OrderBody) {
    const { userId, phone, deliveryAddress, note, items } = payload;

    const clientUrl = process.env.CLIENT_URL!;
    const clientCheckoutReturnPathname = process.env.CLIENT_CHECKOUT_RETURN_PATHNAME!;

    // Find user with userId
    const existedUser = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!existedUser) {
      throw new Error(OrderError.USER_NOT_FOUND);
    }

    // Find products with productId
    const productIds = items.map((i: { productId: string; quantity: number }) => i.productId);

    const products = await prisma.product.findMany({
      where: {
        id: { in: productIds },
        isActive: true
      }
    });

    // Map product theo id
    const productMap = new Map(products.map((p) => [p.id, p]));

    // Lấy danh sách productId không hợp lệ
    const invalidProductIds = productIds.filter((id: string) => !productMap.has(id));

    if (invalidProductIds.length > 0) {
      throw new HttpError(OrderError.PRODUCT_NOT_FOUND, HTTP_STATUS.NOT_FOUND, {
        invalidProductIds: invalidProductIds
      });
    }

    // Map order items + calculate total
    const orderItems: OrderItemPayload[] = items.map((item: { productId: string; quantity: number }) => {
      const product = products.find((p) => p.id === item.productId)!;

      return {
        productId: product.id,
        quantity: item.quantity,
        price: product.price
      };
    });

    const totalAmount = orderItems.reduce((sum: number, i: OrderItemPayload) => sum + i.quantity * i.price, 0);

    // Transaction

    // prisma.$transaction => hoặc là full success hoặc là all rollback
    // * Không bao giờ có trạng thái:
    //    có Order ❌ nhưng không có Payment
    //    có Payment ❌ nhưng không có OrderItems

    const order = await prisma.$transaction(async (tx) => {
      // Create order
      const newOrder: OrderPayload = {
        orderCode: `${Date.now()}`,
        userId,
        phone,
        deliveryAddress,
        note,
        totalAmount,
        items: {
          create: orderItems
        }
      };

      const createdOrder = await tx.order.create({
        data: newOrder
      });

      // Update product stock
      for (const item of orderItems) {
        const product = await tx.product.findUnique({
          where: { id: item.productId },
          select: { stock: true }
        });

        if (!product || product.stock < item.quantity) {
          throw new HttpError(OrderError.PRODUCT_STOCK_NOT_ENOUGH, HTTP_STATUS.BAD_REQUEST, {
            productId: item.productId
          });
        }

        await tx.product.update({
          where: { id: item.productId },
          data: {
            stock: {
              decrement: item.quantity
            }
          }
        });
      }

      // Create payment
      const newPayment: PaymentPayload = {
        orderId: createdOrder.id,
        amount: totalAmount,
        method: PaymentMethod.COD
      };

      await tx.payment.create({
        data: newPayment
      });

      const result = await tx.order.findUnique({
        where: { id: createdOrder.id },
        include: {
          user: {
            select: {
              id: true,
              fullName: true,
              email: true,
              phone: true,
              address: true
            }
          },
          items: {
            include: {
              product: true
            }
          },
          payments: true
        }
      });

      return result;
    });

    if (!order) {
      throw new Error(OrderError.CREATED_FAILED);
    }

    // logger
    logger.info('[CREATED COD ORDER]', order);

    // Create notification
    const notification = await prisma.notification.create({
      data: {
        type: NotificationType.ORDER,
        itemId: order?.id,
        message_vi: 'Bạn có đơn hàng mới',
        message_en: 'You have new order'
      }
    });

    // Send order event
    socketEmit.toAdmin('order:new', {
      message_vi: 'Bạn có đơn hàng mới',
      message_en: 'You have new order',
      data: notification
    });

    return {
      order,
      redirect_payment_url: `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${order.id}&method=${PaymentMethod.COD}`
    };
  },

  async createVnPay(t: TFunction<'translation', undefined>, ipAddr: string, payload: OrderBody) {
    const { userId, phone, deliveryAddress, note, items } = payload;

    // Find user with userId
    const existedUser = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!existedUser) {
      throw new Error(OrderError.USER_NOT_FOUND);
    }

    // Find products with productId
    const productIds = items.map((i: { productId: string; quantity: number }) => i.productId);

    const products = await prisma.product.findMany({
      where: {
        id: { in: productIds },
        isActive: true
      }
    });

    // Map product theo id
    const productMap = new Map(products.map((p) => [p.id, p]));

    // Lấy danh sách productId không hợp lệ
    const invalidProductIds = productIds.filter((id: string) => !productMap.has(id));

    if (invalidProductIds.length > 0) {
      throw new HttpError(OrderError.PRODUCT_NOT_FOUND, HTTP_STATUS.NOT_FOUND, {
        invalidProductIds: invalidProductIds
      });
    }

    // Map order items + calculate total
    const orderItems: OrderItemPayload[] = items.map((item: { productId: string; quantity: number }) => {
      const product = products.find((p) => p.id === item.productId)!;

      return {
        productId: product.id,
        quantity: item.quantity,
        price: product.price
      };
    });

    const totalAmount = orderItems.reduce((sum: number, i: OrderItemPayload) => sum + i.quantity * i.price, 0);

    // Transaction
    const order = await prisma.$transaction(async (tx) => {
      // Create order
      const newOrder: OrderPayload = {
        orderCode: `${Date.now()}`,
        userId,
        phone,
        deliveryAddress,
        note,
        totalAmount,
        items: {
          create: orderItems
        }
      };

      const createdOrder = await tx.order.create({
        data: newOrder
      });

      // Update product stock
      for (const item of orderItems) {
        const product = await tx.product.findUnique({
          where: { id: item.productId },
          select: { stock: true }
        });

        if (!product || product.stock < item.quantity) {
          throw new HttpError(OrderError.PRODUCT_STOCK_NOT_ENOUGH, HTTP_STATUS.BAD_REQUEST, {
            productId: item.productId
          });
        }

        await tx.product.update({
          where: { id: item.productId },
          data: {
            stock: {
              decrement: item.quantity
            }
          }
        });
      }

      return createdOrder;
    });

    if (!order) {
      throw new Error(OrderError.CREATED_FAILED);
    }

    console.log('[VNPAY HANDLE ORDER]', order);

    // VNPay Config
    const tmnCode = process.env.VNP_TMNCODE!;
    const secretKey = process.env.VNP_HASHSECRET!;
    const returnUrl = process.env.VNP_RETURN_URL!;

    // Create VNPay payment
    const vnpay = new VNPay({
      tmnCode,
      secureSecret: secretKey,
      vnpayHost: 'https://sandbox.vnpayment.vn',
      testMode: true,
      hashAlgorithm: 'SHA512' as HashAlgorithm,
      enableLog: true,
      loggerFn: console.log,
      endpoints: {
        paymentEndpoint: 'paymentv2/vpcpay.html',
        queryDrRefundEndpoint: 'merchant_webapi/api/transaction',
        getBankListEndpoint: 'qrpayauth/api/merchant/get_bank_list'
      }
    });

    const paymentUrl = await vnpay.buildPaymentUrl({
      vnp_Amount: totalAmount,
      vnp_IpAddr: ipAddr,
      vnp_ReturnUrl: returnUrl,
      vnp_TxnRef: order.id,
      vnp_OrderInfo: t('order.order_payment_id', {
        orderId: order.id
      })
    });

    return paymentUrl;
  },

  async handleVnPayReturn(vnpParams: any) {
    const clientUrl = process.env.CLIENT_URL!;
    const clientCheckoutReturnPathname = process.env.CLIENT_CHECKOUT_RETURN_PATHNAME!;

    console.log('[VNP Params]', vnpParams);

    if (Object.keys(vnpParams).length === 0) {
      throw new Error(OrderError.PAYMENT_NOT_FOUND);
    }

    const orderId = vnpParams.vnp_TxnRef;
    const vnpResponseCode = vnpParams.vnp_ResponseCode;

    // Thanh toán thành công => Tạo payment
    if (vnpResponseCode === '00' && orderId) {
      // Find Order with ID
      const orderResult = await prisma.$transaction(async (tx) => {
        const order = await tx.order.findUnique({
          where: { id: orderId as string }
        });

        if (!order) {
          throw new Error(OrderError.NOT_FOUND);
        }

        // Update order status to PAID
        await tx.order.update({
          where: { id: order.id },
          data: {
            status: OrderStatus.PAID
          }
        });

        // Create payment
        const newPayment: PaymentPayload = {
          orderId: order.id,
          amount: order.totalAmount,
          method: PaymentMethod.VNPAY
        };

        await tx.payment.create({
          data: newPayment
        });

        const result = await tx.order.findUnique({
          where: { id: order.id },
          include: {
            user: {
              select: {
                id: true,
                fullName: true,
                email: true,
                phone: true,
                address: true
              }
            },
            items: {
              include: {
                product: true
              }
            },
            payments: true
          }
        });

        return result;
      });

      if (!orderResult) {
        logger.error('[CREATED VNPAY PAYMENT FAILED]');

        throw new Error(OrderError.CREATED_FAILED);
      }

      // logger
      logger.info('[CREATED VNPAY ORDER]', orderResult);
    }

    // Create notification
    const notification = await prisma.notification.create({
      data: {
        type: NotificationType.ORDER,
        itemId: orderId,
        message_vi: 'Bạn có đơn hàng mới',
        message_en: 'You have new order'
      }
    });

    // Send order event
    socketEmit.toAdmin('order:new', {
      message_vi: 'Bạn có đơn hàng mới',
      message_en: 'You have new order',
      data: notification
    });

    return `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${vnpParams.vnp_TxnRef}&method=${PaymentMethod.VNPAY}&vnpResponseCode=${vnpResponseCode}`;
  },

  async createAdmin(payload: AdminOrderBody) {
    const { userId, amount, phone, deliveryAddress, note, method, status, deliveryStatus, items } = payload;

    // Find user with userId
    const existedUser = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!existedUser) {
      throw new Error(OrderError.USER_NOT_FOUND);
    }

    // Find products with productId
    const productIds = items.map((i: { productId: string; quantity: number }) => i.productId);

    const products = await prisma.product.findMany({
      where: {
        id: { in: productIds },
        isActive: true
      }
    });

    // Map product theo id
    const productMap = new Map(products.map((p) => [p.id, p]));

    // Lấy danh sách productId không hợp lệ
    const invalidProductIds = productIds.filter((id: string) => !productMap.has(id));

    if (invalidProductIds.length > 0) {
      throw new HttpError(OrderError.PRODUCT_NOT_FOUND, HTTP_STATUS.NOT_FOUND, {
        invalidProductIds: invalidProductIds
      });
    }

    // Map order items + calculate total
    const orderItems: OrderItemPayload[] = items.map((item: { productId: string; quantity: number }) => {
      const product = products.find((p) => p.id === item.productId)!;

      return {
        productId: product.id,
        quantity: item.quantity,
        price: product.price
      };
    });

    const totalAmount = orderItems.reduce((sum: number, i: OrderItemPayload) => sum + i.quantity * i.price, 0);

    // Transaction

    // prisma.$transaction => hoặc là full success hoặc là all rollback
    // * Không bao giờ có trạng thái:
    //    có Order ❌ nhưng không có Payment
    //    có Payment ❌ nhưng không có OrderItems

    const order = await prisma.$transaction(async (tx) => {
      // Create order
      const newOrder: AdminOrderPayload = {
        orderCode: `${Date.now()}`,
        userId,
        phone,
        deliveryAddress,
        note,
        totalAmount,
        status,
        deliveryStatus,
        items: {
          create: orderItems
        }
      };

      const createdOrder = await tx.order.create({
        data: newOrder
      });

      // Update product stock
      for (const item of orderItems) {
        const product = await tx.product.findUnique({
          where: { id: item.productId },
          select: { stock: true }
        });

        if (!product || product.stock < item.quantity) {
          throw new HttpError(OrderError.PRODUCT_STOCK_NOT_ENOUGH, HTTP_STATUS.BAD_REQUEST, {
            productId: item.productId
          });
        }

        await tx.product.update({
          where: { id: item.productId },
          data: {
            stock: {
              decrement: item.quantity
            }
          }
        });
      }

      // Create payment
      const newPayment: PaymentPayload = {
        orderId: createdOrder.id,
        amount: amount,
        method: method
      };

      await tx.payment.create({
        data: newPayment
      });

      const result = await tx.order.findUnique({
        where: { id: createdOrder.id },
        include: {
          user: {
            select: {
              id: true,
              fullName: true,
              email: true,
              phone: true,
              address: true
            }
          },
          items: {
            include: {
              product: true
            }
          },
          payments: true
        }
      });

      return result;
    });

    if (!order) {
      throw new Error(OrderError.CREATED_FAILED);
    }

    // logger
    logger.info('[CREATED ADMIN ORDER]', order);

    return order;
  },

  async update(id: string, payload: Partial<UpdateOrderBody>) {
    return prisma.$transaction(async (tx) => {
      const order = await tx.order.findUnique({
        where: { id },
        include: {
          items: true
        }
      });

      if (!order) throw new Error(OrderError.NOT_FOUND);

      const data: any = {};

      if (payload.note !== undefined) data.note = payload.note;
      if (payload.phone !== undefined) data.phone = payload.phone;
      if (payload.deliveryAddress !== undefined) data.deliveryAddress = payload.deliveryAddress;
      if (payload.status !== undefined) data.status = payload.status;
      if (payload.deliveryStatus !== undefined) data.deliveryStatus = payload.deliveryStatus;

      // Tính toán điều kiện để cập nhập soldCount
      const wasDelivered = order.deliveryStatus === DeliveryStatus.DELIVERED; // Đã được giao hay chưa
      const willBeDelivered = payload.deliveryStatus === DeliveryStatus.DELIVERED; // Giờ được đánh dấu là đã giao
      // const isPaid = payload.status === OrderStatus.PAID; // Giờ được đánh dấu là đã thanh toán

      // const isDeliveredNow = !wasDelivered && willBeDelivered && isPaid;
      const isDeliveredNow = !wasDelivered && willBeDelivered;
      const isCancelledNow = order.status !== OrderStatus.CANCELLED && payload.status === OrderStatus.CANCELLED;

      // Update order trước
      const updatedOrder = await tx.order.update({
        where: { id },
        data
      });

      // Chỉ tăng soldCount KHI CHUYỂN SANG DELIVERED
      if (isDeliveredNow) {
        for (const item of order.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: {
              soldCount: {
                increment: item.quantity
              }
            }
          });
        }
      }

      // Trả stock khi CANCELLED (nếu trước đó chưa delivered)
      if (isCancelledNow && order.deliveryStatus !== DeliveryStatus.DELIVERED) {
        for (const item of order.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: {
              stock: {
                increment: item.quantity
              }
            }
          });
        }
      }

      return updatedOrder;
    });
  }
};
