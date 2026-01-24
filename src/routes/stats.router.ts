import { Router } from 'express';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { GetOverviewSchema } from '@/dtos/stats.dto';
import { Role } from '@/models/User';
import { getOverview, getTotal } from '@/controllers/stats.controller';

const router = Router();

router.get('/total', authenticateHandler, authorizeHandler(Role.ADMIN), getTotal);
router.get(
  '/overview',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateQuery(GetOverviewSchema),
  getOverview
);

export default router;
