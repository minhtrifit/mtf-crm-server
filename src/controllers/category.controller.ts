import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { CategoryError, categoryService } from '@/services/category.service';

export const getCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await categoryService.getList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('category.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcaseCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const data = await categoryService.getShowcase();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: {
        data
      },
      message: t('category.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getAllCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const data = await categoryService.getAllCategories();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: {
        data
      },
      message: t('category.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const category = await categoryService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: category,
      message: t('category.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === CategoryError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('category.not_found')
      });
    }

    next(error);
  }
};

export const getCategoryBySlug = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { slug } = req.validatedParams;

    const category = await categoryService.getBySlug(slug);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: category,
      message: t('category.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === CategoryError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('category.not_found')
      });
    }

    next(error);
  }
};

export const createCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { name, slug, imageUrl } = req.validatedBody;

    const category = await categoryService.create({
      name,
      slug,
      imageUrl
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: category,
      message: t('category.create_successfully')
    });
  } catch (error: any) {
    if (error.message === CategoryError.EXISTED) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: req.t('category.is_existed')
      });
    }

    next(error);
  }
};

export const updateCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('category.id_required')
      });
    }

    const updatedCategory = await categoryService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedCategory,
      message: t('category.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case CategoryError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('category.not_found')
        });

      case CategoryError.NAME_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('category.name_existed')
        });

      case CategoryError.SLUG_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('category.slug_existed')
        });

      default:
        next(error);
    }
  }
};
