import Joi from 'joi';

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  isActive: Joi.string().allow('').valid('true', 'false').optional()
});

export const GetParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const CreateSchema = Joi.object({
  name: Joi.string().required(),
  address: Joi.string().required(),
  hotline: Joi.string().required(),
  email: Joi.string().required(),
  taxCode: Joi.string().required(),
  image: Joi.string().allow('', null).optional(),
  mapLocation: Joi.string().allow('', null).optional()
});

export const UpdateSchema = Joi.object({
  name: Joi.string().min(1).optional(),
  address: Joi.string().min(1).optional(),
  hotline: Joi.string().min(1).optional(),
  email: Joi.string().min(1).optional(),
  taxCode: Joi.string().min(1).optional(),
  image: Joi.string().allow('', null).optional(),
  mapLocation: Joi.string().allow('', null).optional(),
  isActive: Joi.boolean().optional()
});
