import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { statsService } from '@/services/stats.service';

export const getTotal = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const total = await statsService.getTotal();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: total,
      message: t('stats.get_total_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};

export const getOverview = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await statsService.getOverview(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('stats.get_overview_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};
