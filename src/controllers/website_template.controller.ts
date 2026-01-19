import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { WebsiteTemplateError, websiteTemplateService } from '@/services/website_template.service';

export const getTemplates = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await websiteTemplateService.getList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('website_template.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getTemplate = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const product = await websiteTemplateService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: product,
      message: t('website_template.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === WebsiteTemplateError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('website_template.not_found')
      });
    }

    next(error);
  }
};

export const getShowcaseTemplate = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await websiteTemplateService.getShowcase();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('website_template.get_list_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case WebsiteTemplateError.NOT_FOUND:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('website_template.not_found')
        });

      default:
        next(error);
    }
  }
};

export const createTemplate = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { name, primaryColor, logoUrl, isActive } = req.validatedBody;

    const result = await websiteTemplateService.create({
      name,
      primaryColor,
      logoUrl,
      isActive
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: result,
      message: t('website_template.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case WebsiteTemplateError.WEBSITE_TEMPLATE_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('website_template.is_existed')
        });

      default:
        next(error);
    }
  }
};

export const updateTemplate = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('website_template.id_required')
      });
    }

    const updatedTemplate = await websiteTemplateService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedTemplate,
      message: t('website_template.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case WebsiteTemplateError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('website_template.not_found')
        });

      case WebsiteTemplateError.NAME_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('website_template.name_existed')
        });

      default:
        next(error);
    }
  }
};
