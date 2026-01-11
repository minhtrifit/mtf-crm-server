import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { prisma } from '@/libs/prisma';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { PagingType } from '@/models';
import { CategoryBase } from '@/models/Category';

export const CreateSchema = Joi.object({
  name: Joi.string().required(),
  slug: Joi.string().required(),
  imageUrl: Joi.string().required()
});

export const UpdateSchema = Joi.object({
  name: Joi.string().min(1).optional(),
  slug: Joi.string().min(1).optional(),
  imageUrl: Joi.string().allow('').optional(),
  isActive: Joi.boolean().optional()
});

export const getCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const page = Math.max(Number(req.query.page) || 1, 1);
    const limit = Math.min(Number(req.query.limit) || 10, 100);

    const q = (req.query.q as string)?.trim();
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
      ...(q && {
        OR: [{ name: { contains: q, mode: 'insensitive' } }, { slug: { contains: q, mode: 'insensitive' } }]
      })
    };

    const [data, total] = await Promise.all([
      prisma.category.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.category.count({ where })
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
      message: t('category.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getShowcaseCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    const data = await prisma.category.findMany({
      where: { isActive: true },
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

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
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('category.id_required')
      });
    }

    // Find Category with ID
    const category = await prisma.category.findUnique({
      where: { id: id }
    });

    if (!category) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('category.not_found')
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: category,
      message: t('category.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createCategory = async (req: Request, res: Response, next: NextFunction) => {
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

    const { name, slug, imageUrl } = value;

    // Find Category with Name
    const existedCategory = await prisma.category.findFirst({
      where: {
        OR: [{ name }, { slug }]
      }
    });

    if (existedCategory) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('category.is_existed')
      });
    }

    const payload: CategoryBase = {
      name: name,
      slug: slug,
      imageUrl: imageUrl
    };

    const category = await prisma.category.create({
      data: payload
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: category,
      message: t('category.create_successfully')
    });
  } catch (error) {
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

    // Check category by ID
    const category = await prisma.category.findUnique({
      where: { id }
    });

    if (!category) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        message: t('category.not_found')
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

    const { name, slug, imageUrl, isActive } = value;

    // Build data update
    const data: any = {};

    if (name !== undefined) {
      // Find category with name
      const existedCategory = await prisma.category.findFirst({
        where: {
          name: name,
          NOT: {
            id: id
          }
        }
      });

      if (existedCategory) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('category.name_existed')
        });
      }

      data.name = name;
    }
    if (slug !== undefined) {
      // Find category with slug
      const existedCategory = await prisma.category.findFirst({
        where: {
          slug: slug,
          NOT: {
            id: id
          }
        }
      });

      if (existedCategory) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('category.slug_existed')
        });
      }

      data.slug = slug;
    }
    if (imageUrl !== undefined) data.imageUrl = imageUrl;
    if (isActive !== undefined) data.isActive = isActive;

    // Update
    const updatedCategory = await prisma.category.update({
      where: { id },
      data,
      select: {
        id: true,
        name: true,
        imageUrl: true,
        isActive: true,
        createdAt: true,
        updatedAt: true
      }
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedCategory,
      message: t('category.update_successfully')
    });
  } catch (error) {
    next(error);
  }
};
