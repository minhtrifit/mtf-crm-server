import { NextFunction, Request, Response } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { CouponError, couponService } from '@/services/coupon.service';

const handleCouponError = (error: any, req: Request, res: Response, next: NextFunction) => {
  const { t } = req;
  const status = error.status;

  switch (error.message) {
    case CouponError.NOT_FOUND:
    case CouponError.CODE_EXISTS:
    case CouponError.INACTIVE:
    case CouponError.NOT_STARTED:
    case CouponError.EXPIRED:
    case CouponError.MIN_ORDER_NOT_MET:
    case CouponError.USAGE_LIMIT_REACHED:
    case CouponError.USER_LIMIT_REACHED:
    case CouponError.INVALID_DATE_RANGE:
    case CouponError.INVALID_DISCOUNT_VALUE:
    case CouponError.INVALID_CART:
      return res.status(status ?? HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t(`coupon.${error.message}`)
      });
    default:
      return next(error);
  }
};

export const getCoupons = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const result = await couponService.getList(req.validatedQuery);
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: req.t('coupon.get_list_successfully')
    });
  } catch (error) {
    return next(error);
  }
};

export const getPublicCoupons = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const coupons = await couponService.getPublicList();
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: coupons,
      message: req.t('coupon.get_public_list_successfully')
    });
  } catch (error) {
    return next(error);
  }
};

export const getCoupon = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const coupon = await couponService.getById(req.validatedParams.id);
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: coupon,
      message: req.t('coupon.get_detail_successfully')
    });
  } catch (error) {
    return handleCouponError(error, req, res, next);
  }
};

export const createCoupon = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const coupon = await couponService.create(req.validatedBody);
    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: coupon,
      message: req.t('coupon.create_successfully')
    });
  } catch (error) {
    return handleCouponError(error, req, res, next);
  }
};

export const updateCoupon = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const coupon = await couponService.update(req.validatedParams.id, req.validatedBody);
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: coupon,
      message: req.t('coupon.update_successfully')
    });
  } catch (error) {
    return handleCouponError(error, req, res, next);
  }
};

export const deleteCoupon = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const coupon = await couponService.delete(req.validatedParams.id);
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: coupon,
      message: req.t('coupon.delete_successfully')
    });
  } catch (error) {
    return handleCouponError(error, req, res, next);
  }
};

export const applyCoupon = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const result = await couponService.applyCodeForItems(req.user!.userId, req.validatedBody);
    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: req.t('coupon.apply_successfully')
    });
  } catch (error) {
    return handleCouponError(error, req, res, next);
  }
};
