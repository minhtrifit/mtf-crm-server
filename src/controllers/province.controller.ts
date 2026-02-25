import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import * as provinceService from '@/services/province.service';
import { ProvinceError } from '@/services/province.service';

export async function getProvincesHandler(req: Request, res: Response, next: NextFunction): Promise<void> {
  try {
    const { t } = req;
    const { search, region } = req.query as { search?: string; region?: string };

    const provinces = await provinceService.getAllProvinces(search, region);

    res.status(HTTP_STATUS.OK).json({
      success: true,
      data: provinces,
      message: t('province.list_success')
    });
  } catch (error) {
    next(error);
  }
}

export async function getProvinceByCodeHandler(req: Request, res: Response, next: NextFunction): Promise<void> {
  try {
    const { t } = req;
    const { code } = req.params;

    const province = await provinceService.getProvinceByCode(code);

    res.status(HTTP_STATUS.OK).json({
      success: true,
      data: province,
      message: t('province.detail_success')
    });
  } catch (error: any) {
    if (error.message === ProvinceError.NOT_FOUND) {
      res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('province.not_found')
      });
      return;
    }
    next(error);
  }
}

export async function getDistrictsHandler(req: Request, res: Response, next: NextFunction): Promise<void> {
  try {
    const { t } = req;
    const { code } = req.params;

    const districts = await provinceService.getDistrictsByProvinceCode(code);

    res.status(HTTP_STATUS.OK).json({
      success: true,
      data: districts,
      message: t('province.districts_success')
    });
  } catch (error: any) {
    if (error.message === ProvinceError.NOT_FOUND) {
      res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('province.not_found')
      });
      return;
    }
    next(error);
  }
}
