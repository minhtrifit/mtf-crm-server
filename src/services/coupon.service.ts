import { prisma } from '@/libs/prisma';
import { HttpError, PagingType } from '@/models';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { ApplyCouponPayload, CouponPayload, DiscountType, GetCouponsParams } from '@/models/Coupon';
import { normalizeCode, validateDateRange, validateDiscountValue } from '@/helpers/coupon.helper';

export enum CouponError {
  NOT_FOUND = 'COUPON_NOT_FOUND',
  CODE_EXISTS = 'COUPON_CODE_EXISTS',
  INACTIVE = 'COUPON_INACTIVE',
  NOT_STARTED = 'COUPON_NOT_STARTED',
  EXPIRED = 'COUPON_EXPIRED',
  MIN_ORDER_NOT_MET = 'COUPON_MIN_ORDER_NOT_MET',
  USAGE_LIMIT_REACHED = 'COUPON_USAGE_LIMIT_REACHED',
  USER_LIMIT_REACHED = 'COUPON_USER_LIMIT_REACHED',
  INVALID_DATE_RANGE = 'COUPON_INVALID_DATE_RANGE',
  INVALID_DISCOUNT_VALUE = 'COUPON_INVALID_DISCOUNT_VALUE',
  INVALID_CART = 'COUPON_INVALID_CART'
}

export const couponService = {
  async getPublicList() {
    const now = new Date();
    const coupons = await prisma.coupon.findMany({
      where: {
        isPublic: true,
        isActive: true,
        startsAt: { lte: now },
        expiresAt: { gte: now }
      },
      orderBy: [{ expiresAt: 'asc' }, { createdAt: 'desc' }],
      select: {
        id: true,
        code: true,
        description: true,
        type: true,
        value: true,
        minOrderAmount: true,
        maxDiscountAmount: true,
        startsAt: true,
        expiresAt: true,
        usageLimit: true
      }
    });
    const couponIds = coupons.map((coupon) => coupon.id);
    const usageCounts = couponIds.length
      ? await prisma.order.groupBy({
          by: ['couponId'],
          where: {
            couponId: { in: couponIds },
            status: { not: 'CANCELLED' }
          },
          _count: { _all: true }
        })
      : [];
    const usageCountByCouponId = new Map(usageCounts.map((usage) => [usage.couponId, usage._count._all]));

    return coupons
      .filter((coupon) => coupon.usageLimit === null || (usageCountByCouponId.get(coupon.id) ?? 0) < coupon.usageLimit)
      .map(({ usageLimit, ...coupon }) => coupon);
  },

  async getList(params: GetCouponsParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;
    const q = params.q?.trim();
    const isActive =
      params.isActive === true || params.isActive === 'true'
        ? true
        : params.isActive === false || params.isActive === 'false'
          ? false
          : undefined;

    const where: Record<string, any> = {
      ...(q && { code: { contains: q, mode: 'insensitive' } }),
      ...(isActive !== undefined && { isActive })
    };

    const [coupons, total] = await Promise.all([
      prisma.coupon.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.coupon.count({ where })
    ]);

    const couponIds = coupons.map((coupon) => coupon.id);
    const usageCounts = couponIds.length
      ? await prisma.order.groupBy({
          by: ['couponId'],
          where: {
            couponId: { in: couponIds },
            status: { not: 'CANCELLED' }
          },
          _count: { _all: true }
        })
      : [];
    const usageCountByCouponId = new Map(usageCounts.map((usage) => [usage.couponId, usage._count._all]));
    const data = coupons.map((coupon) => ({
      ...coupon,
      usedCount: usageCountByCouponId.get(coupon.id) ?? 0
    }));

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async getById(id: string) {
    const coupon = await prisma.coupon.findUnique({ where: { id } });
    if (!coupon) throw new HttpError(CouponError.NOT_FOUND, HTTP_STATUS.NOT_FOUND);
    return coupon;
  },

  async create(payload: CouponPayload) {
    const code = normalizeCode(payload.code);
    validateDateRange(payload.startsAt, payload.expiresAt);
    validateDiscountValue(payload.type, payload.value);

    const existingCoupon = await prisma.coupon.findUnique({ where: { code } });
    if (existingCoupon) throw new HttpError(CouponError.CODE_EXISTS, HTTP_STATUS.CONFLICT);

    return prisma.coupon.create({
      data: {
        ...payload,
        code
      }
    });
  },

  async update(id: string, payload: Partial<CouponPayload>) {
    const coupon = await prisma.coupon.findUnique({ where: { id } });
    if (!coupon) throw new HttpError(CouponError.NOT_FOUND, HTTP_STATUS.NOT_FOUND);

    const code = payload.code === undefined ? undefined : normalizeCode(payload.code);
    if (code && code !== coupon.code) {
      const existingCoupon = await prisma.coupon.findUnique({ where: { code } });
      if (existingCoupon) throw new HttpError(CouponError.CODE_EXISTS, HTTP_STATUS.CONFLICT);
    }

    validateDateRange(payload.startsAt ?? coupon.startsAt, payload.expiresAt ?? coupon.expiresAt);
    validateDiscountValue(payload.type ?? (coupon.type as DiscountType), payload.value ?? coupon.value);

    return prisma.coupon.update({
      where: { id },
      data: {
        ...payload,
        ...(code && { code })
      }
    });
  },

  async delete(id: string) {
    const coupon = await prisma.coupon.findUnique({ where: { id } });
    if (!coupon) throw new HttpError(CouponError.NOT_FOUND, HTTP_STATUS.NOT_FOUND);

    return prisma.coupon.delete({ where: { id } });
  },

  async applyCodeForItems(userId: string, payload: ApplyCouponPayload) {
    const productIds = [...new Set(payload.items.map((item) => item.productId))];
    const products = await prisma.product.findMany({
      where: { id: { in: productIds }, isActive: true }
    });
    const productMap = new Map(products.map((product) => [product.id, product]));

    if (products.length !== productIds.length || payload.items.some((item) => !productMap.has(item.productId))) {
      throw new HttpError(CouponError.INVALID_CART, HTTP_STATUS.BAD_REQUEST);
    }

    const subtotalAmount = payload.items.reduce((sum, item) => {
      return sum + productMap.get(item.productId)!.price * item.quantity;
    }, 0);

    return this.applyCode(userId, payload.code, subtotalAmount);
  },

  async applyCode(userId: string, inputCode: string, subtotalAmount: number) {
    const code = normalizeCode(inputCode);
    const coupon = await prisma.coupon.findUnique({ where: { code } });

    if (!coupon) throw new HttpError(CouponError.NOT_FOUND, HTTP_STATUS.NOT_FOUND);
    if (!coupon.isActive) throw new HttpError(CouponError.INACTIVE, HTTP_STATUS.BAD_REQUEST);

    const now = new Date();
    if (coupon.startsAt > now) throw new HttpError(CouponError.NOT_STARTED, HTTP_STATUS.BAD_REQUEST);
    if (coupon.expiresAt < now) throw new HttpError(CouponError.EXPIRED, HTTP_STATUS.BAD_REQUEST);
    if (subtotalAmount < coupon.minOrderAmount) {
      throw new HttpError(CouponError.MIN_ORDER_NOT_MET, HTTP_STATUS.BAD_REQUEST);
    }

    const usageWhere: Record<string, any> = {
      couponId: coupon.id,
      status: { not: 'CANCELLED' }
    };
    const [totalUsage, userUsage] = await Promise.all([
      prisma.order.count({ where: usageWhere }),
      prisma.order.count({ where: { ...usageWhere, userId } })
    ]);

    if (coupon.usageLimit !== null && totalUsage >= coupon.usageLimit) {
      throw new HttpError(CouponError.USAGE_LIMIT_REACHED, HTTP_STATUS.BAD_REQUEST);
    }
    if (userUsage >= coupon.perUserLimit) {
      throw new HttpError(CouponError.USER_LIMIT_REACHED, HTTP_STATUS.BAD_REQUEST);
    }

    let discountAmount = coupon.type === DiscountType.PERCENTAGE ? (subtotalAmount * coupon.value) / 100 : coupon.value;

    if (coupon.maxDiscountAmount !== null) {
      discountAmount = Math.min(discountAmount, coupon.maxDiscountAmount);
    }

    discountAmount = Math.round(Math.min(discountAmount, subtotalAmount) * 100) / 100;

    return {
      coupon: {
        id: coupon.id,
        code: coupon.code,
        description: coupon.description,
        type: coupon.type,
        value: coupon.value
      },
      subtotalAmount,
      discountAmount,
      totalAmount: Math.round((subtotalAmount - discountAmount) * 100) / 100
    };
  }
};
