export enum DiscountType {
  PERCENTAGE = 'PERCENTAGE',
  FIXED = 'FIXED'
}

export interface GetCouponsParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string | boolean;
}

export interface CouponPayload {
  code: string;
  description?: string | null;
  type: DiscountType;
  value: number;
  minOrderAmount?: number;
  maxDiscountAmount?: number | null;
  startsAt: Date;
  expiresAt: Date;
  usageLimit?: number | null;
  perUserLimit?: number;
  isActive?: boolean;
}

export interface ApplyCouponPayload {
  code: string;
  items: {
    productId: string;
    quantity: number;
  }[];
}
