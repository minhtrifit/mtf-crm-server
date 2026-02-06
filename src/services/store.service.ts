import { prisma } from '@/libs/prisma';
import { GetStoresParams, StoreBase } from '@/models/Store';
import { PagingType } from '@/models';

export enum StoreError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'STORE_NOT_FOUND'
}

export const storeService = {
  async getList(params: GetStoresParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();
    let isActive: boolean | undefined = undefined;

    if (params.isActive === 'true') isActive = true;
    if (params.isActive === 'false') isActive = false;

    const where: any = {
      ...(isActive !== undefined && { isActive }),
      ...(q && {
        OR: [
          { name: { contains: q, mode: 'insensitive' } },
          { hotline: { contains: q, mode: 'insensitive' } },
          { email: { contains: q, mode: 'insensitive' } },
          { taxCode: { contains: q, mode: 'insensitive' } }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.store.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.store.count({ where })
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

  async getById(id: string) {
    const store = await prisma.store.findUnique({
      where: { id }
    });

    if (!store) throw new Error(StoreError.NOT_FOUND);

    return store;
  },

  async create(payload: StoreBase) {
    return prisma.store.create({
      data: payload
    });
  },

  async update(id: string, payload: Partial<StoreBase>) {
    // Check store tồn tại
    const store = await prisma.store.findUnique({
      where: { id }
    });

    if (!store) throw new Error(StoreError.NOT_FOUND);

    const data: any = {};

    if (payload.name !== undefined) data.name = payload.name;

    if (payload.address !== undefined) data.address = payload.address;

    if (payload.hotline !== undefined) data.hotline = payload.hotline;

    if (payload.email !== undefined) data.email = payload.email;

    if (payload.taxCode !== undefined) data.taxCode = payload.taxCode;

    if (payload.isActive !== undefined) data.isActive = payload.isActive;

    return prisma.store.update({
      where: { id },
      data
    });
  }
};
