import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { CreateSchema, GetParamsSchema, GetQuerySchema, UpdateSchema } from '@/dtos/website_template.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import {
  createTemplate,
  getShowcaseTemplate,
  getTemplate,
  getTemplates,
  updateTemplate
} from '@/controllers/website_template.controller';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getTemplates);
router.get('/detail/:id', validateParams(GetParamsSchema), getTemplate);
router.get('/showcase', getShowcaseTemplate);
router.post('/', authenticateHandler, validateBody(CreateSchema), createTemplate);
router.patch('/edit/:id', authenticateHandler, validateBody(UpdateSchema), updateTemplate);

export default router;
