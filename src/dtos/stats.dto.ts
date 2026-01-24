import Joi from 'joi';

export const GetOverviewSchema = Joi.object({
  type: Joi.string().valid('year', 'quarter').required(),
  year: Joi.number().integer().required()
});

export const GetTopSellingProductsSchema = Joi.object({
  type: Joi.string().valid('week', 'month', 'year').required()
});
