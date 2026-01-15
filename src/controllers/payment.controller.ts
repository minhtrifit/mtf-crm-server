import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { paymentService } from '@/services/payment.service';

export const getPayments = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await paymentService.getList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('payment.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};
