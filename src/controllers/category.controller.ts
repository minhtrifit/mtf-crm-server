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

export const getCategories = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const page = Math.max(Number(req.query.page) || 1, 1);
    const limit = Math.min(Number(req.query.limit) || 10, 100);

    const q = (req.query.q as string)?.trim();
    const isActive = req.query.isActive !== undefined ? req.query.isActive === 'true' : undefined;

    const skip = (page - 1) * limit;

    // Build where condition
    const where: any = {
      ...(isActive !== undefined && { isActive }),
      ...(q && {
        OR: [{ name: { contains: q, mode: 'insensitive' } }]
      })
    };

    const [data, total] = await Promise.all([
      prisma.category.findMany({
        where,
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' }
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
      }
    });
  } catch (error) {
    next(error);
  }
};

export const getCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: 'Category ID is required'
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
        message: 'Category not found'
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: category,
      message: 'Get category successfully'
    });
  } catch (error) {
    next(error);
  }
};

export const createCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { error, value } = CreateSchema.validate(req.body, {
      abortEarly: false, // trả về tất cả lỗi
      allowUnknown: false // không cho field dư
    });

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
        message: 'Category is existed'
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
      message: 'Create category successfully'
    });
  } catch (error) {
    next(error);
  }
};

export const updateCategory = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { id } = req.params;
    const { name, imageUrl, isActive } = req.body;

    // 1. Validate: At least one field
    if (name === undefined && imageUrl === undefined && isActive === undefined) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        message: 'At least one field is required'
      });
    }

    // 2. Check category by ID
    const category = await prisma.category.findUnique({
      where: { id }
    });

    if (!category) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        message: 'Category not found'
      });
    }

    // 3. Build data update
    const data: any = {};

    if (name !== undefined) data.name = name;
    if (imageUrl !== undefined) data.imageUrl = imageUrl;
    if (isActive !== undefined) data.isActive = isActive;

    // 4. Update
    const updatedCategory = await prisma.category.update({
      where: { id },
      data,
      select: {
        id: true,
        name: true,
        imageUrl: true,
        isActive: true,
        updatedAt: true
      }
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedCategory,
      message: 'Update category successfully'
    });
  } catch (error) {
    next(error);
  }
};
