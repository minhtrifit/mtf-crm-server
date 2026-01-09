import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { HTTP_STATUS } from '@/constants/http-status-code';
import { prisma } from '@/libs/prisma';
import { hashPassword, isValidRole } from '@/libs/auth';
import { Role, UserPayload } from '@/models/User';
import { PagingType } from '@/models';

const roleValues = Object.values(Role);

export const CreateSchema = Joi.object({
  email: Joi.string().required(),
  password: Joi.string().required(),
  fullName: Joi.string().required(),
  phone: Joi.string().allow('', null),
  address: Joi.string().allow('', null),
  role: Joi.string()
    .valid(...roleValues)
    .optional()
});

export const getUsers = async (req: Request, res: Response, next: NextFunction) => {
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
      prisma.user.findMany({
        where,
        skip,
        take: limit,
        orderBy: { createdAt: 'desc' }
      }),
      prisma.user.count({ where })
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
      message: t('user.get_list_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const getUserById = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

    // Check client id
    const id = req.params.id;

    if (!id) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('user.user_id_not_found')
      });
    }

    // Find user
    const user = await prisma.user.findUnique({
      where: { id: id }
    });

    if (!user) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: t('user.user_not_found')
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: user,
      message: t('user.get_detail_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const createUser = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;

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

    const { email, password, fullName, phone, address, role } = value;

    // Check role
    // if (role && !isValidRole(role)) {
    //   return res.status(HTTP_STATUS.BAD_REQUEST).json({
    //     success: false,
    //     data: null,
    //     message: 'Role is not existed'
    //   });
    // }

    // Find user with email
    const existedEmail = await prisma.user.findUnique({
      where: { email: email }
    });

    if (existedEmail) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: t('user.user_email_existed')
      });
    }

    // Find user with phone if client request
    if (phone) {
      // Find user with phone
      const existedPhone = await prisma.user.findUnique({
        where: { phone: phone }
      });

      if (existedPhone) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_phone_existed')
        });
      }
    }

    // Hash user password
    const hashedPassword = await hashPassword(password);

    const newUser: UserPayload = {
      email: email,
      password: hashedPassword,
      fullName: fullName,
      phone: phone ? phone : null,
      address: address ? address : null,
      role: role ? role : Role.USER
    };

    const user = await prisma.user.create({
      data: newUser
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: user,
      message: t('user.create_successfully')
    });
  } catch (error) {
    next(error);
  }
};

export const updateUser = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { t } = req;
    const { id } = req.params;
    const { email, fullName, password, phone, address, isActive } = req.body;

    // 1. Validate: At least one field
    if (fullName === undefined && email === undefined && password === undefined && isActive === undefined) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        message: t('at_least_one_field_required')
      });
    }

    // 2. Check user by ID
    const user = await prisma.user.findUnique({
      where: { id }
    });

    if (!user) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        message: t('user.user_not_found')
      });
    }

    // 3. Build data update
    const data: any = {};

    if (fullName !== undefined) data.fullName = fullName;
    if (email !== undefined) {
      // Find user with email
      const existedEmail = await prisma.user.findFirst({
        where: {
          email: email,
          NOT: {
            id: id
          }
        }
      });

      if (existedEmail) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_email_existed')
        });
      }

      data.email = email;
    }
    if (phone !== undefined) {
      // Find user with phone
      const existedPhone = await prisma.user.findFirst({
        where: {
          phone: phone,
          NOT: {
            id: id
          },
          AND: [{ phone: { not: null } }, { phone: { not: '' } }]
        }
      });

      if (existedPhone) {
        return res.status(HTTP_STATUS.BAD_REQUEST).json({
          success: false,
          data: null,
          message: t('user.user_phone_existed')
        });
      }

      data.phone = phone;
    }
    if (address !== undefined) data.address = address;
    if (isActive !== undefined) data.isActive = isActive;

    if (password !== undefined) {
      const hashedPassword = await hashPassword(password);
      data.password = hashedPassword;
    }

    // 4. Update
    const updatedUser = await prisma.user.update({
      where: { id },
      data,
      select: {
        id: true,
        fullName: true,
        email: true,
        phone: true,
        address: true,
        isActive: true,
        createdAt: true,
        updatedAt: true
      }
    });

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: updatedUser,
      message: t('user.update_successfully')
    });
  } catch (error) {
    next(error);
  }
};
