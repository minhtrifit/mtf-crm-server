import { prisma } from '@/libs/prisma';
import { GetPaymentParams, PaymentMethod, PaymentPayload, UpdatePaymentPayload } from '@/models/Payment';
import { PagingType } from '@/models';
import { buildPaidTimeWhere } from '@/helpers/order.helper';
import { buildAmountRangeWhere } from '@/helpers/payment.helper';

export enum PaymentError {
  NOT_FOUND = 'PAYMENT_NOT_FOUND',
  ORDER_NOT_FOUND = 'ORDER_NOT_FOUND'
}

export const paymentService = {
  async getList(params: GetPaymentParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();
    const orderId = params.orderId;
    const fromAmount = params.fromAmount;
    const toAmount = params.toAmount;
    const fromPaidTime = params.fromPaidTime;
    const toPaidTime = params.toPaidTime;

    // Format: method
    let method: PaymentMethod | undefined = undefined;
    if (params.method === PaymentMethod.COD) method = PaymentMethod.COD;
    if (params.method === PaymentMethod.VNPAY) method = PaymentMethod.VNPAY;

    // Format: fromAmount && toAmount
    const amountWhere = buildAmountRangeWhere(toAmount, fromAmount);

    // Format: fromPaidTime && toPaidTime
    const paidTimeWhere = buildPaidTimeWhere(fromPaidTime, toPaidTime);

    const where: any = {
      ...(q && {
        OR: [
          { id: { contains: q, mode: 'insensitive' } },
          { orderId: { contains: q, mode: 'insensitive' } },
          {
            order: {
              orderCode: { contains: q, mode: 'insensitive' }
            }
          }
        ]
      }),
      ...(orderId !== undefined && { orderId }),
      ...(method !== undefined && { method }),
      ...(amountWhere && { amount: amountWhere }),
      ...(paidTimeWhere && { paidAt: paidTimeWhere })
    };

    const [data, total] = await Promise.all([
      prisma.payment.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ paidAt: 'desc' }, { id: 'desc' }],
        include: {
          order: {
            include: {
              user: true,
              payments: true
            }
          }
        }
      }),
      prisma.payment.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async getById(id: string) {
    const payment = await prisma.payment.findUnique({
      where: { id },
      include: {
        order: {
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
            }
          }
        }
      }
    });

    if (!payment) throw new Error(PaymentError.NOT_FOUND);

    return payment;
  },

  async create(payload: PaymentPayload) {
    const { orderId, amount, method } = payload;

    const payment = await prisma.payment.create({
      data: {
        orderId,
        amount,
        method
      }
    });

    return payment;
  },

  async update(id: string, payload: UpdatePaymentPayload) {
    const { orderId, amount, method } = payload;

    // Check payment by ID
    const payment = await prisma.payment.findUnique({
      where: { id }
    });

    if (!payment) throw new Error(PaymentError.NOT_FOUND);

    // Check payment by ID
    const order = await prisma.order.findUnique({
      where: { id: orderId }
    });

    if (!order) throw new Error(PaymentError.ORDER_NOT_FOUND);

    const data: any = {};

    if (amount !== undefined) data.amount = amount;
    if (method !== undefined) data.method = method;

    const result = await prisma.payment.update({
      where: { id },
      data
    });

    return result;
  }
};
