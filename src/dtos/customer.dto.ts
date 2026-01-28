import Joi from 'joi';

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  isActive: Joi.string().allow('').valid('true', 'false').optional()
});

export const GetCustomerParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const CreateSchema = Joi.object({
  fullName: Joi.string().required(),
  phone: Joi.string().required(),
  email: Joi.string().allow('', null),
  address: Joi.string().required()
});

export const UpdateSchema = Joi.object({
  fullName: Joi.string().min(1).optional(),
  phone: Joi.string().min(1).optional(),
  email: Joi.string().allow('').optional(),
  address: Joi.string().min(1).optional()
});
