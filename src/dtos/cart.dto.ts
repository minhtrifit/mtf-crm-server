import Joi from 'joi';

export const AddToCartSchema = Joi.object({
  productId: Joi.string().required(),
  quantity: Joi.number().integer().min(1).required()
});

export const UpdateCartItemQuantitySchema = Joi.object({
  cartItemId: Joi.string().required(),
  quantity: Joi.number().integer().min(0).required()
});
