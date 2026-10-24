import { HttpError } from '@/models';
import { DiscountType } from '@/models/Coupon';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { CouponError } from '@/services/coupon.service';

export const normalizeCode = (code: string) => code.trim().toUpperCase();

export const validateDateRange = (startsAt: Date, expiresAt: Date) => {
  if (startsAt >= expiresAt) throw new HttpError(CouponError.INVALID_DATE_RANGE, HTTP_STATUS.BAD_REQUEST);
};

export const validateDiscountValue = (type: DiscountType, value: number) => {
  if (value <= 0 || (type === DiscountType.PERCENTAGE && value > 100))
    throw new HttpError(CouponError.INVALID_DISCOUNT_VALUE, HTTP_STATUS.BAD_REQUEST);
};
