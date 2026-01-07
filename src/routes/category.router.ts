import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { createCategory, getCategories, getCategory, updateCategory } from '@/controllers/category.controller';

const router = Router();

router.get('/', getCategories);
router.get('/:id', getCategory);
router.post('/', authenticateHandler, createCategory);
router.patch('/:id', authenticateHandler, updateCategory);

export default router;
