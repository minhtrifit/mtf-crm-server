import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { AddToCartSchema, UpdateCartItemQuantitySchema } from '@/dtos/cart.dto';
import { validateBody } from '@/middlewares/validate.middleware';
import { addToCart, clearCart, getCart, updateCartItemQuantity } from '@/controllers/cart.controller';

const router = Router();

router.get('/', authenticateHandler, getCart);
router.post('/add', authenticateHandler, validateBody(AddToCartSchema), addToCart);
router.patch(
  '/update-item-quantity',
  authenticateHandler,
  validateBody(UpdateCartItemQuantitySchema),
  updateCartItemQuantity
);
router.post('/clear', authenticateHandler, clearCart);

export default router;
