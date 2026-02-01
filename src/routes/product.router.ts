import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { Role } from '@/models/User';
import {
  CreateReviewSchema,
  CreateSchema,
  CreateSearchKeywordSchema,
  DeleteReviewParamsSchema,
  GetBySlugParamsSchema,
  GetCheckIsReviewedQuerySchema,
  GetParamsSchema,
  GetQuerySchema,
  GetReviewQuerySchema,
  GetReviewsQuerySchema,
  GetSearchKeywordQuerySchema,
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
  getAllProducts,
  createReview,
  getWebsiteSearchProducts,
  createSearchKeyword,
  getSearchKeywords,
  checkIsReviewd,
  getReviewsByProductId,
  getReviews,
  deleteReview
} from '@/controllers/product.controller';
import { validateBody } from '@/middlewares/validate.middleware';

const router = Router();

router.get('/', validateQuery(GetQuerySchema), getProducts);
router.get('/website-search', validateQuery(GetQuerySchema), getWebsiteSearchProducts);
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
router.get('/reviews', validateQuery(GetReviewsQuerySchema), getReviews);
router.get(
  '/reviews/detail/:id',
  validateQuery(GetReviewQuerySchema),
  validateParams(GetParamsSchema),
  getReviewsByProductId
);
router.get(
  '/reviews/check-is-reviewed/:id',
  validateQuery(GetCheckIsReviewedQuerySchema),
  validateParams(GetParamsSchema),
  checkIsReviewd
);
router.post('/reviews/create', authenticateHandler, validateBody(CreateReviewSchema), createReview);
router.delete(
  '/reviews/delete/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(DeleteReviewParamsSchema),
  deleteReview
);
router.get('/search-keywords', validateQuery(GetSearchKeywordQuerySchema), getSearchKeywords);
router.post('/create-search-keyword', validateBody(CreateSearchKeywordSchema), createSearchKeyword);

export default router;
