import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { HashAlgorithm, VNPay } from 'vnpay';
import { prisma } from '@/libs/prisma';
import logger from '@/configs/logger';
import { DeliveryStatus, OrderItemPayload, OrderPayload, OrderStatus } from '@/models/Order';
import { PaymentMethod, PaymentPayload } from '@/models/PaymentMethod';
import { HTTP_STATUS } from '@/constants/http-status-code';

const orderStatusValues = Object.values(OrderStatus);
const deliveryStatusValues = Object.values(DeliveryStatus);
const paymentMethodValues = Object.values(PaymentMethod);

export const CreateSchema = Joi.object({
  userId: Joi.string().uuid().required(),

  deliveryAddress: Joi.string().required(),
  note: Joi.string().allow(''),

  items: Joi.array()
    .items(
      Joi.object({
        productId: Joi.string().uuid().required(),
        quantity: Joi.number().integer().min(1).required()
      })
    )
    .min(1)
    .required()
});

export const UpdateSchema = Joi.object({
  note: Joi.string().allow('').optional(),
  deliveryAddress: Joi.string().allow('').optional(),

  status: Joi.string()
    .valid(...orderStatusValues)
    .optional(),

  deliveryStatus: Joi.string()
    .valid(...deliveryStatusValues)
    .optional()
});

export const getOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.is_required')
      });
    }

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
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('order.not_found')
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: order,
      message: t('order.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createCodOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const clientUrl = process.env.CLIENT_URL!;
    const clientCheckoutReturnPathname = process.env.CLIENT_CHECKOUT_RETURN_PATHNAME!;

    const { error, value } = CreateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

    if (!value) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('invalid_payload')
      });
    }

    if (error) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: error.details.map((err) => ({
          field: err.path.join('.'),
          message: err.message
        }))
      });
    }

    const { userId, deliveryAddress, note, items } = value;

    // Find user with userId
    const existedUser = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!existedUser) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('user.user_not_found')
      });
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
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: invalidProductIds.map((id: string) => {
          return t('order.product_id_not_found', { productId: id });
        })
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
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.create_failed')
      });
    }

    // logger
    logger.info('[CREATED COD ORDER]', order);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: {
        order,
        redirect_payment_url: `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${order.id}&method=${PaymentMethod.COD}`
      },
      message: t('order.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createVNPayOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    // VNPay Config
    const tmnCode = process.env.VNP_TMNCODE!;
    const secretKey = process.env.VNP_HASHSECRET!;
    const returnUrl = process.env.VNP_RETURN_URL!;
    const ipAddr = (req.headers['x-forwarded-for'] as string)?.split(',')[0] || req.socket.remoteAddress || '';

    const { error, value } = CreateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

    if (!value) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('invalid_payload')
      });
    }

    if (error) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: error.details.map((err) => ({
          field: err.path.join('.'),
          message: err.message
        }))
      });
    }

    const { userId, deliveryAddress, note, items } = value;

    // Find user with userId
    const existedUser = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!existedUser) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('user.user_not_found')
      });
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
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: invalidProductIds.map((id: string) => {
          return t('order.product_id_not_found', { productId: id });
        })
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
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.create_failed')
      });
    }

    console.log('[VNPAY HANDLE ORDER]', order);

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

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: paymentUrl,
      message: t('order.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const handleVNpayReturn = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const vnpParams = { ...req.query };

    const clientUrl = process.env.CLIENT_URL!;
    const clientCheckoutReturnPathname = process.env.CLIENT_CHECKOUT_RETURN_PATHNAME!;

    console.log('[VNP Params]', vnpParams);

    if (Object.keys(vnpParams).length === 0) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.payment_not_found')
      });
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
          return res.status(HTTP_STATUS.NOT_FOUND).json({
            success: false,
            data: null,
            message: t('order.not_found')
          });
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

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.create_failed')
        });
      }

      // logger
      logger.info('[CREATED VNPAY ORDER]', orderResult);
    }

    return res.redirect(
      `${clientUrl}/${clientCheckoutReturnPathname}&order_id=${vnpParams.vnp_TxnRef}&method=${PaymentMethod.VNPAY}&vnpResponseCode=${vnpResponseCode}`
    );
  } catch (error) {
    next(error);
  }
};

export const updateOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.is_required')
      });
    }

    const { error, value } = UpdateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

    if (!value) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('invalid_payload')
      });
    }

    if (error) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: error.details.map((err) => ({
          field: err.path.join('.'),
          message: err.message
        }))
      });
    }

    // Find Order with ID
    const order = await prisma.order.findUnique({
      where: { id: id }
    });

    if (!order) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('order.not_found')
      });
    }

    const { note, deliveryAddress, status, deliveryStatus } = value;

    // Build data update
    const data: any = {};

    if (note !== undefined) data.note = note;
    if (deliveryAddress !== undefined) data.deliveryAddress = deliveryAddress;
    if (status !== undefined) data.status = status;
    if (deliveryStatus !== undefined) data.deliveryStatus = deliveryStatus;

    const updatedOrder = await prisma.order.update({
      where: { id },
      data
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedOrder,
      message: t('order.update_successfully')
    });
  } catch (error) {
    next(error);
  }
};
