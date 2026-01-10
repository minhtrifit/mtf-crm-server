import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { prisma } from '@/libs/prisma';
import { BaseCustomer } from '@/models/Customer';
import { PagingType } from '@/models';
import { HTTP_STATUS } from '@/constants/http-status-code';

export const CreateSchema = Joi.object({
  fullName: Joi.string().required(),
  phone: Joi.string().required(),
  email: Joi.string().allow('', null),
  address: Joi.string().required()
});

export const getCustomers = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const page = Math.max(Number(req.query.page) || 1, 1);
    const limit = Math.min(Number(req.query.limit) || 10, 100);

    const q = (req.query.q as string)?.trim();
    const isActive = req.query.isActive !== undefined ? req.query.isActive === 'true' : undefined;

    const skip = (page - 1) * limit;

    // Build where condition
    const where: any = {
      ...(isActive !== undefined && { isActive }),
      ...(q && {
        OR: [
          { email: { contains: q, mode: 'insensitive' } },
          { fullName: { contains: q, mode: 'insensitive' } },
          { phone: { contains: q, mode: 'insensitive' } }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.customer.findMany({
        where,
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' }
      }),
      prisma.customer.count({ where })
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
      message: t('customer.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getCustomer = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('customer.is_required')
      });
    }

    // Find Customer with ID
    const customer = await prisma.customer.findUnique({
      where: { id: id }
    });

    if (!customer) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('customer.not_found')
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: customer,
      message: t('customer.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createCustomer = async (req: Request, res: Response, next: NextFunction) => {
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

    const { fullName, phone, email, address } = value;

    // Find Customer with phone
    const existedCustomer = await prisma.customer.findFirst({
      where: { phone: phone }
    });

    if (existedCustomer) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('customer.phone_existed')
      });
    }

    const newCustomer: BaseCustomer = {
      fullName: fullName,
      phone: phone,
      email: email ? email : null,
      address: address
    };

    const customer = await prisma.customer.create({
      data: newCustomer
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: customer,
      message: t('customer.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const updateCustomer = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;
    const { fullName, phone, email, address } = req.body;

    // 1. Validate: At least one field
    if (fullName === undefined && phone === undefined && email === undefined) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        message: t('at_least_one_field_required')
      });
    }

    // 2. Check customer by ID
    const customer = await prisma.customer.findUnique({
      where: { id }
    });

    if (!customer) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        message: t('customer.not_found')
      });
    }

    // 3. Build data update
    const data: any = {};

    if (fullName !== undefined) data.fullName = fullName;
    if (phone !== undefined) {
      // Find customer with phone
      const existedPhone = await prisma.customer.findFirst({
        where: {
          phone: phone,
          NOT: {
            id: id
          }
        }
      });

      if (existedPhone) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('customer.phone_existed')
        });
      }

      data.phone = phone;
    }
    if (email !== undefined) data.email = email;
    if (address !== undefined) data.address = address;

    // 4. Update
    const updatedCustomer = await prisma.customer.update({
      where: { id },
      data,
      select: {
        id: true,
        fullName: true,
        email: true,
        phone: true,
        address: true,
        createdAt: true,
        updatedAt: true
      }
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedCustomer,
      message: t('customer.update_successfully')
    });
  } catch (error) {
    next(error);
  }
};
