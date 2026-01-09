import { Router } from 'express';
import { getOrder, createCodOrder } from '@/controllers/order.controller';

const router = Router();

router.get('/:id', getOrder);
router.post('/cod-order', createCodOrder);

export default router;
