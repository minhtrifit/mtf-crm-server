import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { prisma } from '@/libs/prisma';
import { DeliveryStatus, OrderItemPayload, OrderPayload, OrderStatus } from '@/models/Order';
import { PaymentMethod, PaymentPayload } from '@/models/PaymentMethod';
import { HTTP_STATUS } from '@/constants/http-status-code';

const orderStatusValues = Object.values(OrderStatus);
const deliveryStatusValues = Object.values(DeliveryStatus);
const paymentMethodValues = Object.values(PaymentMethod);

export const CreateCodSchema = Joi.object({
  userId: Joi.string().uuid().required(),

  deliveryAddress: Joi.string().required(),
  note: Joi.string().allow('', null),

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

    const { error, value } = CreateCodSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

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

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: order,
      message: t('order.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};
