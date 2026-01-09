import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { getOrder, createCodOrder, handleVNPayPayment, handleVNpayReturn } from '@/controllers/order.controller';

const router = Router();

router.get('/detail/:id', authenticateHandler, getOrder);
router.post('/create-cod-order', authenticateHandler, createCodOrder);
router.post('/create-vnpay-order', authenticateHandler, handleVNPayPayment);
router.get('/result/vnpay', handleVNpayReturn);

export default router;
