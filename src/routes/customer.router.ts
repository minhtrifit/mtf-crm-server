import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { getCustomers, createCustomer, getCustomer, updateCustomer } from '@/controllers/customer.controller';

const router = Router();

router.get('/', authenticateHandler, getCustomers);
router.get('/:id', authenticateHandler, getCustomer);
router.post('/', authenticateHandler, createCustomer);
router.patch('/:id', authenticateHandler, updateCustomer);

export default router;
