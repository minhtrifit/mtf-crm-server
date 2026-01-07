import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { getProducts, getProduct, createProduct, updateProduct } from '@/controllers/product.controller';

const router = Router();

router.get('/', getProducts);
router.get('/:id', getProduct);
router.post('/', authenticateHandler, createProduct);
router.patch('/:id', authenticateHandler, updateProduct);

export default router;
