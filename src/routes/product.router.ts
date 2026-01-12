import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import {
  getProducts,
  getProduct,
  createProduct,
  updateProduct,
  getShowcaseProductsByCategorySlug,
  getProductBySlug
} from '@/controllers/product.controller';

const router = Router();

router.get('/', getProducts);
router.get('/detail/:id', getProduct);
router.get('/detail-by-slug/:slug', getProductBySlug);
router.get('/showcase-by-category-slug/:slug', getShowcaseProductsByCategorySlug);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), createProduct);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateProduct);

export default router;
