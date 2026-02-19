import Joi from 'joi';

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional()
});

export const GetPolicyParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const GetPolicyShowcaseParamsSchema = Joi.object({
  slug: Joi.string().trim().required()
});

export const CreateSchema = Joi.object({
  title: Joi.string().required(),
  slug: Joi.string().required(),
  content: Joi.string().required()
});

export const UpdateSchema = Joi.object({
  title: Joi.string().min(1).optional(),
  slug: Joi.string().min(1).optional(),
  content: Joi.string().min(1).optional()
});
