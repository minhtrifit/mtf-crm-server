import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import { CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/store.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { createStore, getSearchStores, getStore, getStores, updateStore } from '@/controllers/store.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getStores);
router.get(
  '/search',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateQuery(GetQuerySchema),
  getSearchStores
);
router.get('/detail/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateParams(GetParamsSchema), getStore);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createStore);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updateStore);

export default router;
