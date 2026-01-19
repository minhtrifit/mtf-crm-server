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
  primaryColor: Joi.string().required(),
  logoUrl: Joi.string().required(),
  isActive: Joi.boolean().required()
});

export const UpdateSchema = Joi.object({
  name: Joi.string().allow('').optional(),
  primaryColor: Joi.string().allow('').optional(),
  logoUrl: Joi.string().allow('').optional(),
  isActive: Joi.boolean().optional()
});
