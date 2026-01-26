import { Request, Response, NextFunction } from 'express';
import { AdminOrderBody, OrderBody } from '@/models/Order';
import { JwtPayload } from '@/libs/auth';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { OrderError, orderService } from '@/services/order.service';

export const getOrders = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await orderService.getList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('order.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getSearchOrders = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await orderService.getSearchList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('order.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

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

export const getOrdersByUserId = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;
    const jwtPayload = req.user;

    const result = await orderService.getListByUserId(id, req.validatedQuery, jwtPayload as JwtPayload);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('order.get_list_successfully')
    });
  } catch (error: any) {
    if (error.message === OrderError.NO_ACCESS_PERMISSION) {
      return res.status(HTTP_STATUS.FORBIDDEN).json({
        success: false,
        data: null,
        message: req.t('auth.no_permission')
      });
    }

    next(error);
  }
};

export const createCodOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const { userId, deliveryAddress, note, items } = req.validatedBody;

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

      case OrderError.PRODUCT_STOCK_NOT_ENOUGH: {
        const productId = error.data.productId ?? [];

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.product_stock_not_enough', { productId: productId })
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

    const { userId, deliveryAddress, note, items } = req.validatedBody;

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

export const createAdminOrder = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await orderService.createAdmin(req.validatedBody);

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

      case OrderError.PRODUCT_STOCK_NOT_ENOUGH: {
        const productId = error.data.productId ?? [];

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.product_stock_not_enough', { productId: productId })
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

    const updatedOrder = await orderService.update(id, req.validatedBody);

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
