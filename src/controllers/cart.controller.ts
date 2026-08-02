import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { AuthError } from '@/services/auth.service';
import { ProductError } from '@/services/product.service';
import { CartError, cartService } from '@/services/cart.service';

export const getCart = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const jwtPayload = req.user;

    const result = await cartService.getCartByUserId(jwtPayload?.userId as string);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('cart.get_list_successfully')
    });
  } catch (error: any) {
    if (error.message === AuthError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('auth.user_not_found')
      });
    }

    next(error);
  }
};

export const addToCart = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const jwtPayload = req.user;

    const result = await cartService.addToCart(jwtPayload?.userId as string, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('cart.add_successfully')
    });
  } catch (error: any) {
    if (error.message === ProductError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    if (error.message === CartError.INVALID_QUANTITY) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('cart.invalid_quantity')
      });
    }

    next(error);
  }
};

export const updateCartItemQuantity = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const jwtPayload = req.user;

    const result = await cartService.updateCartItemQuantity(jwtPayload?.userId as string, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('cart.update_item_quantity_successfully')
    });
  } catch (error: any) {
    if (error.message === CartError.ITEM_NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    if (error.message === ProductError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    if (error.message === CartError.INVALID_QUANTITY) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('cart.invalid_quantity')
      });
    }

    next(error);
  }
};

export const removeCartItem = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const jwtPayload = req.user;

    const result = await cartService.removeCartItem(jwtPayload?.userId as string, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('cart.remove_item_successfully')
    });
  } catch (error: any) {
    if (error.message === CartError.ITEM_NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    next(error);
  }
};

export const clearCart = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const jwtPayload = req.user;

    const result = await cartService.clearCart(jwtPayload?.userId as string);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('cart.clear_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};
