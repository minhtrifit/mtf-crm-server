import { Router } from 'express';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { authenticateAdminHandler, authenticateHandler } from '@/middlewares/auth';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { CreateSchema, GetQuerySchema, GetUserParamsSchema, UpdateSchema } from '@/dtos/user.dto';
import {
  getUsers,
  getUserById,
  createUser,
  updateUser,
  getUserProfile,
  getSearchUsers
} from '@/controllers/user.controler';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getUsers);
router.get('/search', authenticateHandler, validateQuery(GetQuerySchema), getSearchUsers);
router.get('/detail/:id', authenticateHandler, validateParams(GetUserParamsSchema), getUserById);
router.get('/profile/:id', authenticateHandler, validateParams(GetUserParamsSchema), getUserProfile);
router.post('/', authenticateAdminHandler, validateBody(CreateSchema), createUser);
router.patch('/edit/:id', authenticateHandler, validateBody(UpdateSchema), updateUser);

export default router;
