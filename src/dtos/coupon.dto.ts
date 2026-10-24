import Joi from 'joi';
import { DiscountType } from '@/models/Coupon';

const discountTypes = Object.values(DiscountType);

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  isActive: Joi.boolean().optional()
});

export const GetParamsSchema = Joi.object({
  id: Joi.string().uuid().required()
});

const couponFields = {
  code: Joi.string().trim().uppercase().max(50),
  description: Joi.string().trim().allow('', null),
  type: Joi.string().valid(...discountTypes),
  value: Joi.number().positive(),
  minOrderAmount: Joi.number().min(0),
  maxDiscountAmount: Joi.number().positive().allow(null),
  startsAt: Joi.date().iso(),
  expiresAt: Joi.date().iso(),
  usageLimit: Joi.number().integer().positive().allow(null),
  perUserLimit: Joi.number().integer().positive(),
  isActive: Joi.boolean(),
  isPublic: Joi.boolean()
};

export const CreateSchema = Joi.object({
  ...couponFields,
  code: couponFields.code.required(),
  type: couponFields.type.required(),
  value: couponFields.value.required(),
  startsAt: couponFields.startsAt.required(),
  expiresAt: couponFields.expiresAt.required()
}).custom((coupon, helpers) => {
  if (coupon.startsAt >= coupon.expiresAt) {
    return helpers.error('date.order');
  }

  if (coupon.type === DiscountType.PERCENTAGE && coupon.value > 100) {
    return helpers.error('number.max');
  }

  return coupon;
});

export const UpdateSchema = Joi.object(couponFields)
  .min(1)
  .custom((coupon, helpers) => {
    if (coupon.startsAt && coupon.expiresAt && coupon.startsAt >= coupon.expiresAt) {
      return helpers.error('date.order');
    }

    if (coupon.type === DiscountType.PERCENTAGE && coupon.value > 100) {
      return helpers.error('number.max');
    }

    return coupon;
  });

export const ApplySchema = Joi.object({
  code: Joi.string().trim().uppercase().max(50).required(),
  items: Joi.array()
    .items(
      Joi.object({
        productId: Joi.string().uuid().required(),
        quantity: Joi.number().integer().min(1).required()
      }).required()
    )
    .min(1)
    .required()
});
