import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { NotificationError, notificationService } from '@/services/notification.service';

export const getNotifications = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const result = await notificationService.getList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('notification.get_list_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};

export const updateNotification = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('notification.id_required')
      });
    }

    const updatedNotification = await notificationService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedNotification,
      message: t('update_successfully.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case NotificationError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('notification.not_found')
        });
      case NotificationError.EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('notification.is_existed')
        });

      default:
        next(error);
    }
  }
};
