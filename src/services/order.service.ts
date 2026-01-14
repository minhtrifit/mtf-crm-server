import { HashAlgorithm, VNPay } from 'vnpay';
import { TFunction } from 'i18next';
import logger from '@/configs/logger';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { prisma } from '@/libs/prisma';
import { HttpError } from '@/models';
import { OrderBody, OrderItemPayload, OrderPayload, OrderStatus, UpdateOrderBody } from '@/models/Order';
import { PaymentMethod, PaymentPayload } from '@/models/PaymentMethod';

export enum OrderError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'ORDER_NOT_FOUND',
  USER_NOT_FOUND = 'USER_NOT_FOUND',
  CREATED_FAILED = 'CREATED_FAILED',
  PRODUCT_NOT_FOUND = 'PRODUCT_NOT_FOUND',
  PAYMENT_NOT_FOUND = 'PAYMENT_NOT_FOUND'
}

export const orderService = {
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

  async createCod(payload: OrderBody) {
    const { userId, deliveryAddress, note, items } = payload;

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
        orderCode: `USER-ORDER-${Date.now()}`,
        userId,
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

    return {
      order,
      redirect_payment_url: `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${order.id}&method=${PaymentMethod.COD}`
    };
  },

  async createVnPay(t: TFunction<'translation', undefined>, ipAddr: string, payload: OrderBody) {
    const { userId, deliveryAddress, note, items } = payload;

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
        orderCode: `USER-ORDER-${Date.now()}`,
        userId,
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

    return `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${vnpParams.vnp_TxnRef}&method=${PaymentMethod.VNPAY}&vnpResponseCode=${vnpResponseCode}`;
  },

  async update(id: string, payload: Partial<UpdateOrderBody>) {
    const { note, deliveryAddress, status, deliveryStatus } = payload;

    // Find Order with ID
    const order = await prisma.order.findUnique({
      where: { id: id }
    });

    if (!order) {
      throw new Error(OrderError.NOT_FOUND);
    }

    const data: any = {};

    if (note !== undefined) data.note = note;
    if (deliveryAddress !== undefined) data.deliveryAddress = deliveryAddress;
    if (status !== undefined) data.status = status;
    if (deliveryStatus !== undefined) data.deliveryStatus = deliveryStatus;

    return prisma.order.update({
      where: { id },
      data
    });
  }
};
