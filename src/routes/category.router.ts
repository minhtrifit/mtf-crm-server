import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import {
  createCategory,
  getCategories,
  getCategory,
  getShowcaseCategories,
  updateCategory
} from '@/controllers/category.controller';

const router = Router();

router.get('/', getCategories);
router.get('/showcase', getShowcaseCategories);
router.get('/detail/:id', getCategory);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), createCategory);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateCategory);

export default router;
