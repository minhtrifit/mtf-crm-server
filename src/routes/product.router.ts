import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { Role } from '@/models/User';
import {
  CreateSchema,
  GetBySlugParamsSchema,
  GetParamsSchema,
  GetQuerySchema,
  GetShowcaseByCategorySlugParamsSchema,
  GetShowcaseByCategorySlugQuerySchema,
  UpdateSchema
} from '@/dtos/product.dto';
import {
  getProducts,
  getProduct,
  createProduct,
  updateProduct,
  getShowcaseProductsByCategorySlug,
  getProductBySlug,
  getAllProducts
} from '@/controllers/product.controller';
import { validateBody } from '@/middlewares/validate.middleware';

const router = Router();

router.get('/', validateQuery(GetQuerySchema), getProducts);
router.get('/detail/:id', validateParams(GetParamsSchema), getProduct);
router.get('/detail-by-slug/:slug', validateParams(GetBySlugParamsSchema), getProductBySlug);
router.get(
  '/showcase-by-category-slug/:categorySlug',
  validateParams(GetShowcaseByCategorySlugParamsSchema),
  validateQuery(GetShowcaseByCategorySlugQuerySchema),
  getShowcaseProductsByCategorySlug
);
router.get('/all', authenticateHandler, authorizeHandler(Role.ADMIN), getAllProducts);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createProduct);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updateProduct);

export default router;
