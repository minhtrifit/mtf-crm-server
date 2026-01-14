import Joi from 'joi';
import { DeliveryStatus, OrderStatus } from '@/models/Order';

const orderStatusValues = Object.values(OrderStatus);
const deliveryStatusValues = Object.values(DeliveryStatus);

export const GetParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

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
