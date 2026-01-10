import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { login, register, getProfile } from '@/controllers/auth.controller';

const router = Router();

router.post('/register', register);
router.post('/login', login);
router.get('/verify', authenticateHandler, getProfile);

export default router;
