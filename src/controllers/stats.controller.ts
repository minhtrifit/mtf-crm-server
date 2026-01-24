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

export const getDeliveryStatus = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await statsService.getDeliveryStatus();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('stats.get_delivery_status')
    });
  } catch (error: any) {
    next(error);
  }
};

export const getTopSellingProducts = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await statsService.getTopSellingProducts(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('stats.get_top_selling_product')
    });
  } catch (error: any) {
    next(error);
  }
};

export const getRecentOrders = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await statsService.getRecentOrders();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('stats.get_recent_order_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};
