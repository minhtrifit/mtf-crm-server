import Joi from 'joi';
import { DeliveryStatus, OrderStatus } from '@/models/Order';
import { PaymentMethod } from '@/models/Payment';

const orderStatusValues = Object.values(OrderStatus);
const deliveryStatusValues = Object.values(DeliveryStatus);
const paymentMethodValues = Object.values(PaymentMethod);

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  status: Joi.string()
    .valid(...orderStatusValues)
    .allow('')
    .optional(),
  deliveryStatus: Joi.string()
    .valid(...deliveryStatusValues)
    .allow('')
    .optional(),
  buyerQ: Joi.string().trim().allow('').optional(),
  fromPaidTime: Joi.string().trim().allow('').optional(),
  toPaidTime: Joi.string().trim().allow('').optional()
});

export const GetParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const CreateSchema = Joi.object({
  userId: Joi.string().uuid().required(),

  fullName: Joi.string().required(),
  phone: Joi.string().required(),
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

export const CreateAdminSchema = Joi.object({
  userId: Joi.string().uuid().required(),
  amount: Joi.number().positive().required(),
  method: Joi.string()
    .valid(...paymentMethodValues)
    .required(),
  fullName: Joi.string().required(),
  phone: Joi.string().required(),
  deliveryAddress: Joi.string().required(),
  note: Joi.string().allow(''),
  status: Joi.string()
    .valid(...orderStatusValues)
    .required(),
  deliveryStatus: Joi.string()
    .valid(...deliveryStatusValues)
    .required(),
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
  fullName: Joi.string().allow('').optional(),
  phone: Joi.string().allow('').optional(),
  deliveryAddress: Joi.string().allow('').optional(),

  status: Joi.string()
    .valid(...orderStatusValues)
    .optional(),

  deliveryStatus: Joi.string()
    .valid(...deliveryStatusValues)
    .optional()
});
