import { prisma } from '@/libs/prisma';
import { comparePassword, generateToken, hashPassword, JwtPayload } from '@/libs/auth';
import { LoginPayload, RegisterPayload } from '@/models/Auth';
import { Role, UserPayload } from '@/models/User';

export enum AuthError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'USER_NOT_FOUND',
  EMAIL_EXISTED = 'USER_EMAIL_EXISTED',
  NO_PERMISSION = 'NO_PERMISSION',
  EMAIL_PASSWORD_NOT_MATCH = 'EMAIL_PASSWORD_NOT_MATCH',
  AUTHORZIED_FAILED = 'AUTHORZIED_FAILED',
  PHONE_EXISTED = 'PHONE_EXISTED'
}

export const authService = {
  async register(payload: RegisterPayload) {
    const { email, password, fullName, phone, address } = payload;

    // Find user with email
    const existedUser = await prisma.user.findUnique({
      where: { email: email }
    });

    if (existedUser) throw new Error(AuthError.EMAIL_EXISTED);

    // Find user with phone if client request
    if (phone) {
      // Find user with phone
      const existedPhone = await prisma.user.findUnique({
        where: { phone: phone }
      });

      if (existedPhone) throw new Error(AuthError.PHONE_EXISTED);
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

    return user;
  },

  async login(payload: LoginPayload) {
    const { email, password } = payload;

    // Find user
    const user = await prisma.user.findUnique({
      where: { email: email }
    });

    if (!user) throw new Error(AuthError.NOT_FOUND);

    if (!user.isActive) throw new Error(AuthError.NO_PERMISSION);

    // Compare password
    const validPassword = await comparePassword(password, user.password);

    if (!validPassword) throw new Error(AuthError.EMAIL_PASSWORD_NOT_MATCH);

    // Generate token
    const token = generateToken(user);

    if (!token) throw new Error(AuthError.AUTHORZIED_FAILED);

    return { user, token };
  },

  async getProfile(user: JwtPayload) {
    // Find User by ID
    const profile = await prisma.user.findUnique({
      where: { id: user.userId }
    });

    if (!profile) throw new Error(AuthError.NOT_FOUND);

    return profile;
  }
};
