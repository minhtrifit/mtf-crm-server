import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { prisma } from '@/libs/prisma';
import { comparePassword, generateToken, hashPassword } from '@/libs/auth';
import { Role, UserPayload } from '@/models/User';
import { HTTP_STATUS } from '@/constants/http-status-code';

export const CreateSchema = Joi.object({
  email: Joi.string().required(),
  password: Joi.string().required(),
  fullName: Joi.string().required(),
  phone: Joi.string().allow('', null),
  address: Joi.string().allow('', null)
});

export const register = async (req: Request, res: Response, next: NextFunction) => {
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

    const { email, password, fullName, phone, address } = value;

    // Find user with email
    const existedUser = await prisma.user.findUnique({
      where: { email: email }
    });

    if (existedUser) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: 'User email is existed'
      });
    }

    // Hash user password
    const hashedPassword = await hashPassword(password);

    const newUser: UserPayload = {
      email: email,
      password: hashedPassword,
      fullName: fullName,
      phone: phone ? phone : null,
      address: address ? address : null,
      role: Role.USER
    };

    const user = await prisma.user.create({
      data: newUser
    });

    return res.status(HTTP_STATUS.CREATED).json({
      success: true,
      data: user,
      message: 'Register successfully'
    });
  } catch (error) {
    next(error);
  }
};

export const login = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: 'Email or password are missing'
      });
    }

    // Find user
    const user = await prisma.user.findUnique({
      where: { email: email }
    });

    if (!user) {
      return res.status(HTTP_STATUS.NOT_FOUND).json({
        success: false,
        data: null,
        message: 'User not found'
      });
    }

    // Compare password
    const validPassword = await comparePassword(password, user.password);

    if (!validPassword) {
      return res.status(HTTP_STATUS.BAD_REQUEST).json({
        success: false,
        data: null,
        message: 'Password not match'
      });
    }

    // Generate token
    const token = generateToken(user);

    if (!token) {
      return res.status(HTTP_STATUS.UNAUTHORIZED).json({
        success: false,
        data: null,
        message: 'Authorzied failed'
      });
    }

    return res.status(HTTP_STATUS.OK).json({
      success: true,
      data: { ...user, token },
      message: 'Login successfully'
    });
  } catch (error) {
    next(error);
  }
};
