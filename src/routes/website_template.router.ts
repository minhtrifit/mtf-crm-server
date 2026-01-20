import { Router } from 'express';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import { CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/website_template.dto';
import { Role } from '@/models/User';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import {
  createTemplate,
  getShowcaseTemplate,
  getTemplate,
  getTemplates,
  getTemplateSections,
  updateTemplate
} from '@/controllers/website_template.controller';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getTemplates);
router.get('/detail/:id', validateParams(GetParamsSchema), getTemplate);
router.get('/showcase', getShowcaseTemplate);
router.get('/sections/:id', validateParams(GetParamsSchema), getTemplateSections);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createTemplate);
router.patch(
  '/edit/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateBody(UpdateSchema),
  updateTemplate
);

export default router;
