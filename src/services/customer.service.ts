import { prisma } from '@/libs/prisma';
import { BaseCustomer, CustomerPayload, GetCustomersParams } from '@/models/Customer';
import { PagingType } from '@/models';

export enum CustomerError {
  EXISTED = 'EXISTED',
  ID_NOT_FOUND = 'CUSTOMER_ID_NOT_FOUND',
  NOT_FOUND = 'CUSTOMER_NOT_FOUND',
  EMAIL_EXISTED = 'CUSTOMER_EMAIL_EXISTED',
  PHONE_EXISTED = 'CUSTOMER_PHONE_EXISTED',
  NO_ACCESS_PERMISSION = 'NO_ACCESS_PERMISSION',
  PHONE_REQUIRED = 'PHONE_REQUIRED'
}

export const customerService = {
  async getCustomers(params: GetCustomersParams) {
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

    return {
      data,
      paging
    };
  },

  async getCustomer(id: string) {
    if (!id) throw new Error(CustomerError.ID_NOT_FOUND);

    // Find Customer with ID
    const customer = await prisma.customer.findUnique({
      where: { id: id }
    });

    if (!customer) throw new Error(CustomerError.NOT_FOUND);

    return customer;
  },

  async getByPhone(phone: string) {
    if (!phone) throw new Error(CustomerError.PHONE_REQUIRED);

    const user = await prisma.customer.findUnique({
      where: { phone: phone },
      include: {
        orders: {
          include: {
            payments: true
          }
        }
      }
    });

    return user;
  },

  async create(payload: CustomerPayload) {
    const { fullName, phone, email, address } = payload;

    // Find Customer with phone
    const existedCustomer = await prisma.customer.findFirst({
      where: { phone: phone }
    });

    if (existedCustomer) throw new Error(CustomerError.PHONE_EXISTED);

    const newCustomer: CustomerPayload = {
      fullName: fullName,
      phone: phone,
      email: email ? email : null,
      address: address
    };

    const customer = await prisma.customer.create({
      data: newCustomer
    });

    return customer;
  },

  async update(id: string, payload: Partial<CustomerPayload>) {
    // Check customer by ID
    const customer = await prisma.customer.findUnique({
      where: { id }
    });

    if (!customer) throw new Error(CustomerError.NOT_FOUND);

    const { fullName, phone, email, address } = payload;

    // Build data update
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

      if (existedPhone) throw new Error(CustomerError.PHONE_EXISTED);

      data.phone = phone;
    }
    if (email !== undefined) data.email = email;
    if (address !== undefined) data.address = address;

    // Update
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

    return updatedCustomer;
  }
};
