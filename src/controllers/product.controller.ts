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

    const updatedProduct = await productService.update(id, req.body);

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
