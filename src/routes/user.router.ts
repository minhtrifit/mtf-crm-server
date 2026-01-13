import { Router } from 'express';
import { getUsers, getUserById, createUser, updateUser } from '@/controllers/user.controler';
import { authenticateHandler } from '@/middlewares/auth';

const router = Router();

router.get('/', authenticateHandler, getUsers);
router.get('/:id', authenticateHandler, getUserById);
router.post('/', createUser);
router.patch('/:id', authenticateHandler, updateUser);

export default router;
