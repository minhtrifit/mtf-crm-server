import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import {
  CreateSchema,
  GetCategoryBySlugParamsSchema,
  GetCategoryParamsSchema,
  GetQuerySchema,
  UpdateSchema
} from '@/dtos/category.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import {
  createCategory,
  getAllCategories,
  getCategories,
  getCategory,
  getCategoryBySlug,
  getShowcaseCategories,
  updateCategory
} from '@/controllers/category.controller';

const router = Router();

router.get('/', validateQuery(GetQuerySchema), getCategories);
router.get('/showcase', getShowcaseCategories);
router.get('/all', authenticateHandler, authorizeHandler(Role.ADMIN), getAllCategories);
router.get('/detail/:id', validateParams(GetCategoryParamsSchema), getCategory);
router.get('/detail-by-slug/:slug', validateParams(GetCategoryBySlugParamsSchema), getCategoryBySlug);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createCategory);
router.patch(
  '/edit/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateBody(UpdateSchema),
  updateCategory
);

export default router;
