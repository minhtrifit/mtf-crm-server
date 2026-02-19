import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { PolicyError, policyService } from '@/services/policy.service';

export const getPolicies = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await policyService.getList(req.query);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('policy.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcasePolicies = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await policyService.getShowcase();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('policy.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getPolicy = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const policy = await policyService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: policy,
      message: t('policy.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === PolicyError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('policy.not_found')
      });
    }

    next(error);
  }
};

export const getPolicyBySlug = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { slug } = req.validatedParams;

    const policy = await policyService.getBySlug(slug);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: policy,
      message: t('policy.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === PolicyError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('policy.not_found')
      });
    }

    next(error);
  }
};

export const createPolicy = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const policy = await policyService.create(req.validatedBody);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: policy,
      message: t('policy.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case PolicyError.EXISTED:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('policy.is_existed')
        });

      default:
        next(error);
    }
  }
};

export const updatePolicy = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    const updatedPolicy = await policyService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedPolicy,
      message: t('policy.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case PolicyError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('policy.not_found')
        });

      case PolicyError.TITLE_EXISTED:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('policy.title_existed')
        });

      case PolicyError.SLUG_EXISTED:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('policy.slug_existed')
        });

      default:
        next(error);
    }
  }
};

export const deletePolicy = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const policy = await policyService.delete(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: policy,
      message: t('policy.delete_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case PolicyError.NOT_FOUND: {
        const policyId = error.data.policyId ?? '';

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('policy.not_found', { policyId: policyId })
        });
      }

      default:
        next(error);
    }
  }
};
