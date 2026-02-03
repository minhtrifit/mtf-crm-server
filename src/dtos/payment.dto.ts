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

export const GetParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const CreateSchema = Joi.object({
  orderId: Joi.string().required(),
  amount: Joi.number().positive().required(),
  method: Joi.string()
    .valid(...paymentMethodValues)
    .required()
});

export const UpdateSchema = Joi.object({
  orderId: Joi.string().required(),
  amount: Joi.number().positive().optional(),
  method: Joi.string()
    .valid(...paymentMethodValues)
    .optional()
});
