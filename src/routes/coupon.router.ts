import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateBody } from '@/middlewares/validate.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { Role } from '@/models/User';
import { ApplySchema, CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/coupon.dto';
import {
  applyCoupon,
  createCoupon,
  deleteCoupon,
  getCoupon,
  getCoupons,
  getPublicCoupons,
  updateCoupon
} from '@/controllers/coupon.controller';

const router = Router();

router.post('/apply', authenticateHandler, authorizeHandler(Role.USER), validateBody(ApplySchema), applyCoupon);
router.get('/public', getPublicCoupons);
router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getCoupons);
router.get(
  '/detail/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetParamsSchema),
  getCoupon
);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createCoupon);
router.patch(
  '/edit/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetParamsSchema),
  validateBody(UpdateSchema),
  updateCoupon
);
router.delete(
  '/delete/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetParamsSchema),
  deleteCoupon
);

export default router;
