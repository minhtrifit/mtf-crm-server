import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { StoreError, storeService } from '@/services/store.service';

export const getStores = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await storeService.getList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('store.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getSearchStores = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await storeService.getSearchList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('store.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getStore = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const store = await storeService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: store,
      message: t('store.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === StoreError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('store.not_found')
      });
    }

    next(error);
  }
};

export const createStore = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const category = await storeService.create(req.validatedBody);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: category,
      message: t('store.create_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};

export const updateStore = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('store.id_required')
      });
    }

    const updatedStore = await storeService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedStore,
      message: t('store.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case StoreError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('store.not_found')
        });

      default:
        next(error);
    }
  }
};
