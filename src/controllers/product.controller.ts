import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { prisma } from '@/libs/prisma';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { ProductBase } from '@/models/Product';
import { PagingType } from '@/models';

export const CreateSchema = Joi.object({
  name: Joi.string().required(),
  slug: Joi.string()
    .pattern(/^[a-z0-9-]+$/)
    .required(),
  sku: Joi.string().required(),
  price: Joi.number().positive().required(),
  stock: Joi.number().positive().required(),
  imagesUrl: Joi.array().items(Joi.string().uri()).min(1).required(),
  description: Joi.string().allow('').required(),
  categoryId: Joi.string().required()
});

export const UpdateSchema = Joi.object({
  name: Joi.string().min(1).optional(),
  slug: Joi.string()
    .pattern(/^[a-z0-9-]+$/)
    .min(1)
    .optional(),
  sku: Joi.string().min(1).optional(),
  price: Joi.number().positive().optional(),
  stock: Joi.number().positive().optional(),
  imagesUrl: Joi.array().items(Joi.string().uri()).min(1).optional(),
  description: Joi.string().allow('').optional(),
  isActive: Joi.boolean().optional(),
  categoryId: Joi.string().min(1).optional()
});

export const getProducts = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const page = Math.max(Number(req.query.page) || 1, 1);
    const limit = Math.min(Number(req.query.limit) || 10, 100);

    const q = (req.query.q as string)?.trim();
    const categoryId = (req.query.categoryId as string)?.trim();
    const categorySlug = (req.query.categorySlug as string)?.trim();
    let isActive: boolean | undefined = undefined;

    const skip = (page - 1) * limit;

    if (req.query.isActive === 'true') {
      isActive = true;
    } else if (req.query.isActive === 'false') {
      isActive = false;
    }

    // Build where condition
    const where: any = {
      ...(isActive !== undefined && { isActive }),
      ...(categoryId && { categoryId }),
      ...(categorySlug && {
        category: {
          slug: categorySlug
        }
      }),
      ...(q && {
        OR: [
          { name: { contains: q, mode: 'insensitive' } },
          { slug: { contains: q, mode: 'insensitive' } },
          { sku: { contains: q, mode: 'insensitive' } }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          category: {
            select: {
              id: true,
              name: true,
              slug: true,
              imageUrl: true,
              isActive: true
            }
          }
        }
      }),
      prisma.product.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: {
        data,
        paging
      },
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcaseProductsByCategorySlug = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const categorySlug = req.params.slug;

    const page = Math.max(Number(req.query.page) || 1, 1);
    const limit = Math.min(Number(req.query.limit) || 10, 100);

    const skip = (page - 1) * limit;

    if (!categorySlug) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('product.slug_required')
      });
    }

    // Build where condition
    const where: any = {
      ...(categorySlug && {
        category: {
          slug: categorySlug
        }
      })
    };

    const [data, total] = await Promise.all([
      prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          category: {
            select: {
              id: true,
              name: true,
              slug: true,
              imageUrl: true,
              isActive: true
            }
          }
        }
      }),
      prisma.product.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: {
        data,
        paging
      },
      message: t('product.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('product.id_required')
      });
    }

    // Find Product with ID
    const product = await prisma.product.findUnique({
      where: { id },
      include: {
        category: {
          select: {
            id: true,
            name: true,
            slug: true,
            imageUrl: true,
            isActive: true
          }
        }
      }
    });

    if (!product) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('product.not_found')
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: product,
      message: t('product.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { error, value } = CreateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

    if (!value) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('invalid_payload')
      });
    }

    if (error) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: error.details.map((err) => ({
          field: err.path.join('.'),
          message: err.message
        }))
      });
    }

    const { name, slug, sku, price, stock, imagesUrl, description, categoryId } = value;

    // Find Product with Name
    const existedProduct = await prisma.product.findFirst({
      where: {
        OR: [{ name }, { slug }, { sku }]
      }
    });

    if (existedProduct) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('product.is_existed')
      });
    }

    // Find Category with categoryId
    const category = await prisma.category.findUnique({
      where: { id: categoryId }
    });

    if (!category) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('category.not_found')
      });
    }

    const payload: ProductBase = {
      name: name,
      slug: slug,
      sku: sku,
      price: price,
      stock: stock,
      imagesUrl: imagesUrl,
      description: description,
      isActive: true,
      categoryId: categoryId
    };

    const product = await prisma.product.create({
      data: payload
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: product,
      message: t('product.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const updateProduct = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;

    // Check product by ID
    const product = await prisma.product.findUnique({
      where: { id }
    });

    if (!product) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        message: t('product.not_found')
      });
    }

    const { error, value } = UpdateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

    if (!value) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('invalid_payload')
      });
    }

    if (error) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: error.details.map((err) => ({
          field: err.path.join('.'),
          message: err.message
        }))
      });
    }

    const { name, slug, sku, price, stock, imagesUrl, description, isActive, categoryId } = value;

    // Build data update
    const data: any = {};

    if (name !== undefined) {
      // Find product with name
      const existedProduct = await prisma.product.findFirst({
        where: {
          name: name,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('product.name_existed')
        });
      }

      data.name = name;
    }
    if (slug !== undefined) {
      // Find product with slug
      const existedProduct = await prisma.product.findFirst({
        where: {
          slug: slug,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('product.slug_existed')
        });
      }

      data.slug = slug;
    }
    if (sku !== undefined) {
      // Find product with sku
      const existedProduct = await prisma.product.findFirst({
        where: {
          sku: sku,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('product.sku_existed')
        });
      }

      data.sku = sku;
    }
    if (price !== undefined) data.price = price;
    if (stock !== undefined) data.stock = stock;
    if (imagesUrl !== undefined) data.imagesUrl = imagesUrl;
    if (description !== undefined) data.description = description;
    if (categoryId !== undefined) {
      // Find Category with categoryId
      const category = await prisma.category.findUnique({
        where: { id: categoryId }
      });

      if (!category) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('category.not_found')
        });
      }

      data.categoryId = categoryId;
    }
    if (isActive !== undefined) data.isActive = isActive;

    // Update
    const updatedProduct = await prisma.product.update({
      where: { id },
      data,
      select: {
        id: true,
        name: true,
        sku: true,
        price: true,
        stock: true,
        description: true,
        imagesUrl: true,
        category: {
          select: {
            id: true,
            name: true,
            slug: true,
            imageUrl: true,
            isActive: true
          }
        },
        isActive: true,
        createdAt: true,
        updatedAt: true
      }
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedProduct,
      message: t('product.update_successfully')
    });
  } catch (error) {
    next(error);
  }
};
