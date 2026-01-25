import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { Role } from '@/models/User';
import { CreateSchema, GetQuerySchema, UpdateSchema } from '@/dtos/payment.dto';
import { createPayment, getPayments, updatePayment } from '@/controllers/payment.controller';
import { validateBody } from '@/middlewares/validate.middleware';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getPayments);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createPayment);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updatePayment);

export default router;
