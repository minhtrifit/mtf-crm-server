import { prisma } from '@/libs/prisma';
import { GetUsersParams, Role, UpdateUserPayload, UserPayload } from '@/models/User';
import { PagingType } from '@/models';
import { hashPassword, JwtPayload } from '@/libs/auth';

export enum UserError {
  EXISTED = 'EXISTED',
  ID_NOT_FOUND = 'USER_ID_NOT_FOUND',
  NOT_FOUND = 'USER_NOT_FOUND',
  EMAIL_EXISTED = 'USER_EMAIL_EXISTED',
  PHONE_EXISTED = 'USER_PHONE_EXISTED',
  NO_ACCESS_PERMISSION = 'NO_ACCESS_PERMISSION',
  PHONE_REQUIRED = 'PHONE_REQUIRED',
  PROVINCE_NOT_FOUND = 'PROVINCE_NOT_FOUND',
  DISTRICT_NOT_FOUND = 'DISTRICT_NOT_FOUND'
}

// Helper function to lookup province and district names
async function getProvinceDistrictNames(
  provinceCode?: string | null,
  districtCode?: string | null
): Promise<{ provinceName: string | null; districtName: string | null }> {
  let provinceName: string | null = null;
  let districtName: string | null = null;

  if (provinceCode) {
    const province = await prisma.province.findUnique({
      where: { code: provinceCode }
    });
    if (!province) {
      throw new Error(UserError.PROVINCE_NOT_FOUND);
    }
    provinceName = province.name;
  }

  if (districtCode) {
    const district = await prisma.district.findUnique({
      where: { code: districtCode }
    });
    if (!district) {
      throw new Error(UserError.DISTRICT_NOT_FOUND);
    }
    districtName = district.name;
  }

  return { provinceName, districtName };
}

export const userService = {
  async getList(params: GetUsersParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = (params.q as string)?.trim();

    let isActive: boolean | undefined = undefined;
    if (params.isActive === 'true') isActive = true;
    if (params.isActive === 'false') isActive = false;

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
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.user.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return {
      data,
      paging
    };
  },

  async getSearchList(params: GetUsersParams) {
    const q = (params.q as string)?.trim();

    let isActive: boolean | undefined = undefined;
    if (params.isActive === 'true') isActive = true;
    if (params.isActive === 'false') isActive = false;

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
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.user.count({ where })
    ]);

    return {
      data,
      total
    };
  },

  async getById(id: string) {
    if (!id) throw new Error(UserError.ID_NOT_FOUND);

    // Find user
    const user = await prisma.user.findUnique({
      where: { id: id },
      include: {
        orders: {
          include: {
            payments: true
          }
        }
      }
    });

    if (!user) {
      throw new Error(UserError.NOT_FOUND);
    }

    return user;
  },

  async getProfile(id: string, jwtPayload: JwtPayload) {
    if (!id) throw new Error(UserError.ID_NOT_FOUND);

    if (jwtPayload.role === Role.USER && jwtPayload.userId !== id) {
      throw new Error(UserError.NO_ACCESS_PERMISSION);
    }

    // Find user
    const user = await prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        email: true,
        fullName: true,
        avatar: true,
        phone: true,
        address: true,
        // Province/District fields
        provinceCode: true,
        provinceName: true,
        districtCode: true,
        districtName: true,
        orders: {
          include: {
            payments: true
          }
        }
      }
    });

    if (!user) {
      throw new Error(UserError.NOT_FOUND);
    }

    return user;
  },

  async getByPhone(phone: string) {
    if (!phone) throw new Error(UserError.PHONE_REQUIRED);

    const user = await prisma.user.findUnique({
      where: { phone: phone },
      include: {
        orders: {
          include: {
            payments: true
          }
        }
      }
    });

    if (!user) {
      throw new Error(UserError.NOT_FOUND);
    }

    return user;
  },

  async create(payload: UserPayload) {
    const { email, password, fullName, phone, address, role, provinceCode, districtCode } = payload;

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

    if (existedEmail) throw new Error(UserError.EMAIL_EXISTED);

    // Find user with phone if client request
    if (phone) {
      // Find user with phone
      const existedPhone = await prisma.user.findUnique({
        where: { phone: phone }
      });

      if (existedPhone) throw new Error(UserError.PHONE_EXISTED);
    }

    // Lookup province and district names
    const { provinceName, districtName } = await getProvinceDistrictNames(provinceCode, districtCode);

    // Hash user password
    const hashedPassword = await hashPassword(password);

    const newUser = {
      email: email,
      password: hashedPassword,
      fullName: fullName,
      phone: phone ? phone : null,
      address: address ? address : null,
      role: role ? role : Role.USER,
      // Province/District fields
      provinceCode: provinceCode || null,
      provinceName,
      districtCode: districtCode || null,
      districtName
    };

    const user = await prisma.user.create({
      data: newUser
    });

    return user;
  },

  async update(id: string, payload: Partial<UpdateUserPayload>, jwtPayload: JwtPayload) {
    if (jwtPayload.role === Role.USER && jwtPayload.userId !== id) {
      throw new Error(UserError.NO_ACCESS_PERMISSION);
    }

    // Check user by ID
    const user = await prisma.user.findUnique({
      where: { id }
    });

    if (!user) {
      throw new Error(UserError.NOT_FOUND);
    }

    const { email, fullName, phone, address, avatar, isActive, provinceCode, districtCode } = payload;

    // Build data update
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

      if (existedEmail) throw new Error(UserError.EMAIL_EXISTED);

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

      if (existedPhone) throw new Error(UserError.PHONE_EXISTED);

      const normalizedPhone = phone?.trim() || null;

      data.phone = normalizedPhone;
    }
    if (address !== undefined) data.address = address;
    if (avatar !== undefined) data.avatar = avatar;
    if (isActive !== undefined) data.isActive = isActive;

    // Handle province/district update
    if (provinceCode !== undefined || districtCode !== undefined) {
      const newProvinceCode = provinceCode !== undefined ? provinceCode : user.provinceCode;
      const newDistrictCode = districtCode !== undefined ? districtCode : user.districtCode;

      // If clearing province, also clear district
      if (provinceCode === null || provinceCode === '') {
        data.provinceCode = null;
        data.provinceName = null;
        data.districtCode = null;
        data.districtName = null;
      } else {
        const { provinceName, districtName } = await getProvinceDistrictNames(newProvinceCode, newDistrictCode);

        if (provinceCode !== undefined) {
          data.provinceCode = provinceCode || null;
          data.provinceName = provinceName;
        }

        if (districtCode !== undefined) {
          data.districtCode = districtCode || null;
          data.districtName = districtName;
        }
      }
    }

    // Update
    const updatedUser = await prisma.user.update({
      where: { id },
      data,
      select: {
        id: true,
        fullName: true,
        email: true,
        phone: true,
        address: true,
        avatar: true,
        isActive: true,
        // Province/District fields
        provinceCode: true,
        provinceName: true,
        districtCode: true,
        districtName: true,
        createdAt: true,
        updatedAt: true
      }
    });

    return updatedUser;
  }
};
