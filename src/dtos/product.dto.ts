import Joi from 'joi';

export const GetQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional(),
  q: Joi.string().trim().allow('').optional(),
  categoryId: Joi.string().trim().allow('').optional(),
  categorySlug: Joi.string().trim().allow('').optional(),
  isActive: Joi.string().allow('').valid('true', 'false').optional()
});

export const GetParamsSchema = Joi.object({
  id: Joi.string().trim().required()
});

export const GetBySlugParamsSchema = Joi.object({
  slug: Joi.string().trim().required()
});

export const GetShowcaseByCategorySlugParamsSchema = Joi.object({
  categorySlug: Joi.string().trim().required()
});

export const GetShowcaseByCategorySlugQuerySchema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  limit: Joi.number().integer().min(1).max(100).optional()
});

export const CreateSchema = Joi.object({
  name: Joi.string().required(),
  slug: Joi.string()
    .pattern(/^[a-z0-9-]+$/)
    .required(),
  sku: Joi.string().required(),
  price: Joi.number().positive().required(),
  stock: Joi.number().positive().required(),
  imagesUrl: Joi.array().items(Joi.string().uri()).min(1).required(),
  description: Joi.string().allow('').required(),
  categoryId: Joi.string().required()
});

export const UpdateSchema = Joi.object({
  name: Joi.string().min(1).optional(),
  slug: Joi.string()
    .pattern(/^[a-z0-9-]+$/)
    .min(1)
    .optional(),
  sku: Joi.string().min(1).optional(),
  price: Joi.number().positive().optional(),
  stock: Joi.number().positive().optional(),
  imagesUrl: Joi.array().items(Joi.string().uri()).min(1).optional(),
  description: Joi.string().allow('').optional(),
  isActive: Joi.boolean().optional(),
  categoryId: Joi.string().min(1).optional()
});
