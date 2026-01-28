import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { getCustomers, createCustomer, getCustomer, updateCustomer } from '@/controllers/customer.controller';
import { CreateSchema, GetCustomerParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/customer.dto';
import { validateBody } from '@/middlewares/validate.middleware';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getCustomers);
router.get(
  '/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetCustomerParamsSchema),
  getCustomer
);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createCustomer);
router.patch('/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updateCustomer);

export default router;
