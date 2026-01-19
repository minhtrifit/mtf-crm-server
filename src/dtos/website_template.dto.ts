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

const SectionSchema = Joi.object({
  id: Joi.string().uuid().optional(),
  title: Joi.string().allow('').optional(),
  position: Joi.number().integer().min(1).required(),
  isActive: Joi.boolean().optional(),
  items: Joi.array()
    .items(
      Joi.object({
        id: Joi.string().uuid().optional(),
        productId: Joi.string().uuid().required(),
        position: Joi.number().integer().min(1).required()
      })
    )
    .default([])
});

export const CreateSchema = Joi.object({
  name: Joi.string().required(),
  primaryColor: Joi.string().required(),
  logoUrl: Joi.string().required(),
  isActive: Joi.boolean().required(),
  sections: Joi.array().items(SectionSchema)
});

export const UpdateSchema = Joi.object({
  name: Joi.string().allow('').optional(),
  primaryColor: Joi.string().allow('').optional(),
  logoUrl: Joi.string().allow('').optional(),
  isActive: Joi.boolean().optional(),
  sections: Joi.array().items(SectionSchema)
});
