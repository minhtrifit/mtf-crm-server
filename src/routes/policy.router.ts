import { Router } from 'express';
import { Role } from '@/models/User';
import {
  CreateSchema,
  GetPolicyParamsSchema,
  GetPolicyShowcaseParamsSchema,
  GetQuerySchema,
  UpdateSchema
} from '@/dtos/policy.dto';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { validateBody } from '@/middlewares/validate.middleware';
import { authenticateHandler, authorizeHandler } from '@/middlewares/auth';
import {
  createPolicy,
  deletePolicy,
  getPolicies,
  getPolicy,
  getPolicyBySlug,
  getShowcasePolicies,
  updatePolicy
} from '@/controllers/policy.controller';

const router = Router();

router.get('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateQuery(GetQuerySchema), getPolicies);
router.get('/showcase', getShowcasePolicies);
router.get(
  '/detail/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetPolicyParamsSchema),
  getPolicy
);
router.get('/detail-by-slug/:slug', validateParams(GetPolicyShowcaseParamsSchema), getPolicyBySlug);
router.post('/', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(CreateSchema), createPolicy);
router.patch('/edit/:id', authenticateHandler, authorizeHandler(Role.ADMIN), validateBody(UpdateSchema), updatePolicy);
router.delete(
  '/delete/:id',
  authenticateHandler,
  authorizeHandler(Role.ADMIN),
  validateParams(GetPolicyParamsSchema),
  deletePolicy
);

export default router;
