import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import { getCustomers, createCustomer, getCustomer, updateCustomer } from '@/controllers/customer.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), getCustomers);
router.get('/:id', authenticateHandler, authorizeHandler(Role.ADMIN), getCustomer);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), createCustomer);
router.patch('/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateCustomer);

export default router;
