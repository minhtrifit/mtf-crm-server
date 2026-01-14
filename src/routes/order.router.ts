import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { Role } from '@/models/User';
import { CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/order.dto';
import {
  getOrder,
  createCodOrder,
  createVNPayOrder,
  handleVNpayReturn,
  updateOrder,
  getOrders
} from '@/controllers/order.controller';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getOrders);
router.get('/detail/:id', authenticateHandler, validateParams(GetParamsSchema), getOrder);
router.post('/create-cod-order', authenticateHandler, validateBody(CreateSchema), createCodOrder);
router.post('/create-vnpay-order', authenticateHandler, validateBody(CreateSchema), createVNPayOrder);
router.get('/result/vnpay', handleVNpayReturn);
router.patch(
  '/update-order/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateBody(UpdateSchema),
  updateOrder
);

export default router;
