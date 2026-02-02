import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { FaqError, faqService } from '@/services/faq.service';

export const getFaqs = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await faqService.getList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('faq.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcaseFaqs = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await faqService.getShowcase();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('faq.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getFaq = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const faq = await faqService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: faq,
      message: t('faq.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === FaqError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('faq.not_found')
      });
    }

    next(error);
  }
};

export const createFaq = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const faq = await faqService.create(req.validatedBody);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: faq,
      message: t('faq.create_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};

export const updateFaq = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    const updatedFaq = await faqService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedFaq,
      message: t('faq.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case FaqError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('faq.not_found')
        });

      default:
        next(error);
    }
  }
};

export const deleteFaq = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const faq = await faqService.delete(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: faq,
      message: t('faq.delete_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case FaqError.NOT_FOUND: {
        const faqId = error.data.faqId ?? '';

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('faq.not_found', { faqId: faqId })
        });
      }

      default:
        next(error);
    }
  }
};
