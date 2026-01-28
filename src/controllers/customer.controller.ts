import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { CustomerError, customerService } from '@/services/customer.service';

export const getCustomers = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const result = await customerService.getCustomers(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('customer.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getCustomer = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    const customer = await customerService.getCustomer(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: customer,
      message: t('customer.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === CustomerError.ID_NOT_FOUND) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('customer.is_required')
      });
    }

    if (error.message === CustomerError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('customer.not_found')
      });
    }

    next(error);
  }
};

export const createCustomer = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const customer = await customerService.create(req.validatedBody);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: customer,
      message: t('customer.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case CustomerError.PHONE_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('customer.phone_existed')
        });

      default:
        next(error);
    }
  }
};

export const updateCustomer = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    const updatedCustomer = await customerService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedCustomer,
      message: t('customer.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case CustomerError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('customer.not_found')
        });
      case CustomerError.PHONE_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('customer.phone_existed')
        });

      default:
        next(error);
    }
  }
};
