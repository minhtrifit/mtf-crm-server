import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { Role } from '@/models/User';
import { createCategory, getCategories, getCategory, updateCategory } from '@/controllers/category.controller';

const router = Router();

router.get('/', getCategories);
router.get('/:id', getCategory);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), createCategory);
router.patch('/:id', authenticateHandler, authorizeHandler(Role.ADMIN), updateCategory);

export default router;
