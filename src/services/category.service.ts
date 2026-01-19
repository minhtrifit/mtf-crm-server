import { prisma } from '@/libs/prisma';
import { CategoryBase, GetCategoriesParams } from '@/models/Category';
import { PagingType } from '@/models';

export enum CategoryError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'CATEGORY_NOT_FOUND',
  NAME_EXISTED = 'CATEGORY_NAME_EXISTED',
  SLUG_EXISTED = 'CATEGORY_SLUG_EXISTED'
}

export const categoryService = {
  async getList(params: GetCategoriesParams) {
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

    return {
      data,
      paging
    };
  },

  async getShowcase() {
    const data = await prisma.category.findMany({
      where: { isActive: true },
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

    return data;
  },

  async getAllCategories() {
    const data = await prisma.category.findMany({
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

    return data;
  },

  async getById(id: string) {
    const category = await prisma.category.findUnique({
      where: { id }
    });

    if (!category) {
      throw new Error(CategoryError.NOT_FOUND);
    }

    return category;
  },

  async getBySlug(slug: string) {
    const category = await prisma.category.findUnique({
      where: { slug }
    });

    if (!category) {
      throw new Error(CategoryError.NOT_FOUND);
    }

    return category;
  },

  async create(payload: CategoryBase) {
    const { name, slug } = payload;

    const existedCategory = await prisma.category.findFirst({
      where: {
        OR: [{ name }, { slug }]
      }
    });

    if (existedCategory) {
      throw new Error(CategoryError.EXISTED);
    }

    return prisma.category.create({
      data: payload
    });
  },

  async update(id: string, payload: Partial<CategoryBase>) {
    // Check category tồn tại
    const category = await prisma.category.findUnique({
      where: { id }
    });

    if (!category) {
      throw new Error(CategoryError.NOT_FOUND);
    }

    const data: any = {};

    if (payload.name !== undefined) {
      const existed = await prisma.category.findFirst({
        where: {
          name: payload.name,
          NOT: { id }
        }
      });

      if (existed) {
        throw new Error(CategoryError.NAME_EXISTED);
      }

      data.name = payload.name;
    }

    if (payload.slug !== undefined) {
      const existed = await prisma.category.findFirst({
        where: {
          slug: payload.slug,
          NOT: { id }
        }
      });

      if (existed) {
        throw new Error(CategoryError.SLUG_EXISTED);
      }

      data.slug = payload.slug;
    }

    if (payload.imageUrl !== undefined) {
      data.imageUrl = payload.imageUrl;
    }

    if (payload.isActive !== undefined) {
      data.isActive = payload.isActive;
    }

    return prisma.$transaction(async (tx) => {
      // Disabled all products by category id
      if (payload.isActive === true) {
        await tx.product.updateMany({
          where: {
            categoryId: id,
            isActive: false
          },
          data: {
            isActive: true
          }
        });
      }

      // Enable all products by category id
      if (payload.isActive === false) {
        await tx.product.updateMany({
          where: {
            categoryId: id,
            isActive: true
          },
          data: {
            isActive: false
          }
        });
      }

      return tx.category.update({
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
    });
  }
};
