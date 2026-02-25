import Joi from 'joi';

export const ProvinceSearchQuerySchema = Joi.object({
  search: Joi.string().optional().allow('').description('Tìm kiếm theo tên tỉnh/thành phố'),
  region: Joi.string().valid('north', 'central', 'south').optional().description('Lọc theo vùng miền')
});

export const ProvinceCodeParamsSchema = Joi.object({
  code: Joi.string().required().description('Mã tỉnh/thành phố')
});
