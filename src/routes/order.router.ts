import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import {
  getOrder,
  createCodOrder,
  createVNPayOrder,
  handleVNpayReturn,
  updateOrder
} from '@/controllers/order.controller';

const router = Router();

router.get('/detail/:id', authenticateHandler, getOrder);
router.post('/create-cod-order', authenticateHandler, createCodOrder);
router.post('/create-vnpay-order', authenticateHandler, createVNPayOrder);
router.get('/result/vnpay', handleVNpayReturn);
router.patch('/update-order/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateOrder);

export default router;
