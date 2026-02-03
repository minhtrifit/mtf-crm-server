import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { PaymentError, paymentService } from '@/services/payment.service';

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

export const getPayment = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const payment = await paymentService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: payment,
      message: t('payment.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === PaymentError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('payment.not_found')
      });
    }

    next(error);
  }
};

export const createPayment = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await paymentService.create(req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('payment.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const updatePayment = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('payment.is_required')
      });
    }

    const result = await paymentService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('payment.update_successfully')
    });
  } catch (error: any) {
    switch (error.message) {
      case PaymentError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: req.t('payment.not_found')
        });

      case PaymentError.ORDER_NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: req.t('order.not_found')
        });

      default:
        next(error);
    }
  }
};
