import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { AddToCartSchema } from '@/dtos/cart.dto';
import { validateBody } from '@/middlewares/validate.middleware';
import { addToCart, clearCart, getCart } from '@/controllers/cart.controller';

const router = Router();

router.get('/', authenticateHandler, getCart);
router.post('/add', authenticateHandler, validateBody(AddToCartSchema), addToCart);
router.post('/clear', authenticateHandler, clearCart);

export default router;
