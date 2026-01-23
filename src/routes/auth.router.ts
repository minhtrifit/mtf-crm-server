import { Router } from 'express';
import { LoginSchema, RegisterSchema } from '@/dtos/user.dto';
import { authenticateHandler } from '@/middlewares/auth';
import { validateBody } from '@/middlewares/validate.middleware';
import { login, register, getProfile } from '@/controllers/auth.controller';

const router = Router();

router.post('/register', validateBody(RegisterSchema), register);
router.post('/login', validateBody(LoginSchema), login);
router.get('/verify', authenticateHandler, getProfile);

export default router;
