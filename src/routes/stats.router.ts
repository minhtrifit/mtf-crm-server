import { Router } from 'express';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { GetOverviewSchema, GetTopSellingProductsSchema } from '@/dtos/stats.dto';
import { Role } from '@/models/User';
import {
  getDeliveryStatus,
  getOverview,
  getRecentOrders,
  getTopSellingProducts,
  getTotal
} from '@/controllers/stats.controller';

const router = Router();

router.get('/total', authenticateHandler, authorizeHandler(Role.ADMIN), getTotal);
router.get(
  '/overview',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateQuery(GetOverviewSchema),
  getOverview
);
router.get('/delivery-status', authenticateHandler, authorizeHandler(Role.ADMIN), getDeliveryStatus);
router.get(
  '/top-selling-products',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateQuery(GetTopSellingProductsSchema),
  getTopSellingProducts
);
router.get('/recent-orders', authenticateHandler, authorizeHandler(Role.ADMIN), getRecentOrders);

export default router;
