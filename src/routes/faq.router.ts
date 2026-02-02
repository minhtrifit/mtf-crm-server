import { Router } from 'express';
import { Role } from '@/models/User';
import { CreateSchema, GetFaqParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/faq.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { createFaq, deleteFaq, getFaq, getFaqs, getShowcaseFaqs, updateFaq } from '@/controllers/faq.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getFaqs);
router.get('/showcase', getShowcaseFaqs);
router.get(
  '/detail/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetFaqParamsSchema),
  getFaq
);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createFaq);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updateFaq);
router.delete(
  '/delete/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetFaqParamsSchema),
  deleteFaq
);

export default router;
