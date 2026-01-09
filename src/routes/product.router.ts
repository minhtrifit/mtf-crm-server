import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import { getProducts, getProduct, createProduct, updateProduct } from '@/controllers/product.controller';

const router = Router();

router.get('/', getProducts);
router.get('/:id', getProduct);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), createProduct);
router.patch('/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateProduct);

export default router;
