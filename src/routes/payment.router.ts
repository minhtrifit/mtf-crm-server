import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { Role } from '@/models/User';
import { CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/payment.dto';
import { createPayment, getPayment, getPayments, updatePayment } from '@/controllers/payment.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getPayments);
router.get(
  '/detail/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetParamsSchema),
  getPayment
);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createPayment);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updatePayment);

export default router;
