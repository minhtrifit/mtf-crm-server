import Joi from 'joi';
import { PaymentMethod } from '@/models/Payment';

const paymentMethodValues = Object.values(PaymentMethod);

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  method: Joi.string()
    .valid(...paymentMethodValues)
    .allow('')
    .optional(),
  orderId: Joi.string().trim().allow('').optional(),
  fromAmount: Joi.number().integer().optional(),
  toAmount: Joi.number().integer().optional(),
  fromPaidTime: Joi.string().trim().allow('').optional(),
  toPaidTime: Joi.string().trim().allow('').optional()
});
