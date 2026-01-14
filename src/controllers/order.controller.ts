import { Request, Response, NextFunction } from 'express';
import { OrderBody } from '@/models/Order';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { OrderError, orderService } from '@/services/order.service';

export const getOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const order = await orderService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: order,
      message: t('order.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createCodOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const { userId, deliveryAddress, note, items } = req.body;

    const payload: OrderBody = { userId, deliveryAddress, note, items };

    const result = await orderService.createCod(payload);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: result,
      message: t('order.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case OrderError.USER_NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('user.user_not_found')
        });

      case OrderError.PRODUCT_NOT_FOUND: {
        const invalidProductIds = error.data.invalidProductIds ?? [];

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: invalidProductIds.map((id: string) => {
            return t('order.product_id_not_found', { productId: id });
          })
        });
      }

      case OrderError.CREATED_FAILED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('order.create_failed')
        });

      default:
        next(error);
    }
  }
};

export const createVNPayOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const ipAddr = (req.headers['x-forwarded-for'] as string)?.split(',')[0] || req.socket.remoteAddress || '';

    const { userId, deliveryAddress, note, items } = req.body;

    const payload: OrderBody = { userId, deliveryAddress, note, items };

    const paymentUrl = await orderService.createVnPay(t, ipAddr, payload);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: paymentUrl,
      message: t('order.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case OrderError.USER_NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('user.user_not_found')
        });

      case OrderError.PRODUCT_NOT_FOUND: {
        const invalidProductIds = error.data.invalidProductIds ?? [];

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: invalidProductIds.map((id: string) => {
            return t('order.product_id_not_found', { productId: id });
          })
        });
      }

      case OrderError.CREATED_FAILED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('order.create_failed')
        });

      default:
        next(error);
    }
  }
};

export const handleVNpayReturn = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const vnpParams = { ...req.query };

    const redirectUrl = await orderService.handleVnPayReturn(vnpParams);

    return res.redirect(redirectUrl);
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case OrderError.PAYMENT_NOT_FOUND:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.payment_not_found')
        });

      case OrderError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          data: null,
          message: t('order.not_found')
        });

      case OrderError.CREATED_FAILED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.create_failed')
        });

      default:
        next(error);
    }
  }
};

export const updateOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('order.is_required')
      });
    }

    const updatedOrder = orderService.update(id, req.body);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedOrder,
      message: t('order.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case OrderError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          data: null,
          message: t('order.not_found')
        });

      default:
        next(error);
    }
  }
};
