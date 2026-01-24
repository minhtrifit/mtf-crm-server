import Joi from 'joi';

export const GetOverviewSchema = Joi.object({
  type: Joi.string().valid('year', 'quarter').required(),
  year: Joi.number().integer().required()
});
