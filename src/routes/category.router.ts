import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { createCategory, getCategories, getCategory, updateCategory } from '@/controllers/category.controller';

const router = Router();

router.get('/', authenticateHandler, getCategories);
router.get('/:id', authenticateHandler, getCategory);
router.post('/', authenticateHandler, createCategory);
router.patch('/:id', authenticateHandler, updateCategory);

export default router;
