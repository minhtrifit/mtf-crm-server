import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { UserError, userService } from '@/services/user.service';
import { JwtPayload } from '@/libs/auth';

export const getUsers = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await userService.getList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('user.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getSearchUsers = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await userService.getSearchList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('user.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getUserById = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    const user = await userService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: user,
      message: t('user.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === UserError.ID_NOT_FOUND) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('user.user_id_not_found')
      });
    }

    if (error.message === UserError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('user.user_not_found')
      });
    }

    next(error);
  }
};

export const getUserProfile = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;
    const jwtPayload = req.user;

    const user = await userService.getProfile(id, jwtPayload as JwtPayload);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: user,
      message: t('user.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === UserError.ID_NOT_FOUND) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('user.user_id_not_found')
      });
    }

    if (error.message === UserError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('user.user_not_found')
      });
    }

    if (error.message === UserError.NO_ACCESS_PERMISSION) {
      return res.status(HTTP_STATUS.FORBIDDEN).json({
        success: false,
        data: null,
        message: req.t('auth.no_permission')
      });
    }

    next(error);
  }
};

export const createUser = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const { email, password, fullName, phone, address, role } = req.validatedBody;

    const user = await userService.create({ email, password, fullName, phone, address, role });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: user,
      message: t('user.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case UserError.EMAIL_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_email_existed')
        });

      case UserError.PHONE_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_phone_existed')
        });

      default:
        next(error);
    }
  }
};

export const updateUser = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;
    const jwtPayload = req.user;

    const updatedUser = await userService.update(id, req.validatedBody, jwtPayload as JwtPayload);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedUser,
      message: t('user.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case UserError.NO_ACCESS_PERMISSION:
        return res.status(HTTP_STATUS.FORBIDDEN).json({
          success: false,
          data: null,
          message: req.t('auth.no_permission')
        });

      case UserError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('user.user_not_found')
        });

      case UserError.EMAIL_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_email_existed')
        });

      case UserError.PHONE_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_phone_existed')
        });

      default:
        next(error);
    }
  }
};
