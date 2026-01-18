import { Router } from 'express';
import { authenticateHandler } from '@/middlewares/auth';
import { CreateSchema, GetQuerySchema } from '@/dtos/website_template.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { createTemplate, getShowcaseTemplate, getTemplates } from '@/controllers/website_template.controller';

const router = Router();

router.get('/', authenticateHandler, validateQuery(GetQuerySchema), getTemplates);
router.get('/showcase', getShowcaseTemplate);
router.post('/', authenticateHandler, validateBody(CreateSchema), createTemplate);

export default router;
