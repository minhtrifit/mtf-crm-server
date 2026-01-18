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
    const { name, primaryColor, logoUrl, isActive } = req.body;

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
