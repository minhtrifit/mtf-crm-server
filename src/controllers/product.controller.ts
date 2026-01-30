import { Request, Response, NextFunction } from 'express';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { ProductError, productService } from '@/services/product.service';

export const getProducts = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await productService.getList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getWebsiteSearchProducts = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await productService.getWebsiteSearchList(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcaseProductsByCategorySlug = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { categorySlug } = req.validatedParams;

    const result = await productService.getShowcaseByCategorySlug(categorySlug, req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const product = await productService.getById(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: product,
      message: t('product.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === ProductError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    next(error);
  }
};

export const getProductBySlug = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { slug } = req.validatedParams;

    const product = await productService.getBySlug(slug);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: product,
      message: t('product.get_detail_successfully')
    });
  } catch (error: any) {
    if (error.message === ProductError.NOT_FOUND) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: req.t('product.not_found')
      });
    }

    next(error);
  }
};

export const getAllProducts = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await productService.getAll();

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const { name, slug, sku, price, stock, imagesUrl, description, categoryId } = req.validatedBody;

    const product = await productService.create({
      name,
      slug,
      sku,
      price,
      stock,
      imagesUrl,
      description,
      isActive: true,
      categoryId
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: product,
      message: t('product.create_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case ProductError.PRODUCT_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('product.is_existed')
        });

      case ProductError.CATEGORY_NOT_FOUND:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('category.not_found')
        });

      default:
        next(error);
    }
  }
};

export const updateProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('product.id_required')
      });
    }

    const updatedProduct = await productService.update(id, req.validatedBody);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedProduct,
      message: t('product.update_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case ProductError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('product.not_found')
        });

      case ProductError.NAME_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('product.name_existed')
        });

      case ProductError.SLUG_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('product.slug_existed')
        });

      case ProductError.SKU_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('product.sku_existed')
        });

      case ProductError.CATEGORY_NOT_FOUND:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('category.not_found')
        });

      default:
        next(error);
    }
  }
};

export const getReviews = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await productService.getReviews(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_review_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getReviewsByProductId = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const reviews = await productService.getReviewsByProductId(id, req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: reviews,
      message: t('product.get_review_by_product_id_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case ProductError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('product.not_found')
        });

      case ProductError.REVIEW_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('product.review_already')
        });

      default:
        next(error);
    }
  }
};

export const checkIsReviewd = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { userId } = req.validatedQuery;
    const { id } = req.validatedParams;

    const reviews = await productService.checkIsReviewd(userId, id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: reviews,
      message: t('product.check_is_user_reviewed_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};

export const createReview = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const userId = req.user?.userId;

    const review = await productService.createReview({ ...req.validatedBody, userId: userId });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: review,
      message: t('product.create_review_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case ProductError.NOT_FOUND:
        return res.status(HTTP_STATUS.NOT_FOUND).json({
          success: false,
          message: t('product.not_found')
        });

      case ProductError.REVIEW_EXISTED:
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          message: t('product.review_already')
        });

      default:
        next(error);
    }
  }
};

export const deleteReview = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.validatedParams;

    const reviews = await productService.deleteReview(id);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: reviews,
      message: t('product.delete_review_successfully')
    });
  } catch (error: any) {
    const { t } = req;

    switch (error.message) {
      case ProductError.REVIEW_NOT_FOUND: {
        const reviewId = error.data.reviewId ?? '';

        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('order.product_stock_not_enough', { reviewId: reviewId })
        });
      }

      default:
        next(error);
    }
  }
};

export const getSearchKeywords = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const result = await productService.getKeywords(req.validatedQuery);

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: result,
      message: t('product.get_search_keyword_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createSearchKeyword = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const review = await productService.createKeyword(req.validatedBody);

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: review,
      message: t('product.create_search_keyword_successfully')
    });
  } catch (error: any) {
    next(error);
  }
};
