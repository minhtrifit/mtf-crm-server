import { Router } from 'express';
import { getProvincesHandler, getProvinceByCodeHandler, getDistrictsHandler } from '@/controllers/province.controller';
import { validateQuery } from '@/middlewares/validate-query.middleware';
import { validateParams } from '@/middlewares/validate-params.middleware';
import { ProvinceSearchQuerySchema, ProvinceCodeParamsSchema } from '@/dtos/province.dto';

const router = Router();

// GET /api/provinces - List all provinces (optional: search, region filter)
router.get('/', validateQuery(ProvinceSearchQuerySchema), getProvincesHandler);

// GET /api/provinces/:code - Get province by code
router.get('/:code', validateParams(ProvinceCodeParamsSchema), getProvinceByCodeHandler);

// GET /api/provinces/:code/districts - Get districts by province code
router.get('/:code/districts', validateParams(ProvinceCodeParamsSchema), getDistrictsHandler);

export default router;
