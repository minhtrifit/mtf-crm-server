import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { GetQuerySchema, UpdateSchema } from '@/dtos/notification.dto';
import { getNotifications, updateNotification } from '@/controllers/notification.controller';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getNotifications);
router.patch('/edit/:id', authenticateHandler, validateBody(UpdateSchema), updateNotification);

export default router;
