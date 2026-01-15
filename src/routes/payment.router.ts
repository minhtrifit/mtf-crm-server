import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { Role } from '@/models/User';
import { GetQuerySchema } from '@/dtos/payment.dto';
import { getPayments } from '@/controllers/payment.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getPayments);

export default router;
