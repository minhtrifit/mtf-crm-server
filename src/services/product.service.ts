import { prisma } from '@/libs/prisma';
import { GetProductsParams, ProductBase } from '@/models/Product';
import { PagingType } from '@/models';

export enum ProductError {
  NOT_FOUND = 'PRODUCT_NOT_FOUND',
  PRODUCT_EXISTED = 'PRODUCT_EXISTED',
  CATEGORY_NOT_FOUND = 'CATEGORY_NOT_FOUND',
  NAME_EXISTED = 'PRODUCT_NAME_EXISTED',
  SLUG_EXISTED = 'PRODUCT_SLUG_EXISTED',
  SKU_EXISTED = 'PRODUCT_SKU_EXISTED'
}

export const productService = {
  async getList(params: GetProductsParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();
    const categoryId = params.categoryId?.trim();
    const categorySlug = params.categorySlug?.trim();

    let isActive: boolean | undefined = undefined;
    if (params.isActive === 'true') isActive = true;
    if (params.isActive === 'false') isActive = false;

    const where: any = {
      ...(isActive !== undefined && { isActive }),
      ...(categoryId && { categoryId }),
      ...(categorySlug && {
        category: { slug: categorySlug }
      }),
      ...(q && {
        OR: [
          { name: { contains: q, mode: 'insensitive' } },
          { slug: { contains: q, mode: 'insensitive' } },
          { sku: { contains: q, mode: 'insensitive' } }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          category: {
            select: {
              id: true,
              name: true,
              slug: true,
              imageUrl: true,
              isActive: true
            }
          }
        }
      }),
      prisma.product.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async getById(id: string) {
    const product = await prisma.product.findUnique({
      where: { id },
      include: {
        category: {
          select: {
            id: true,
            name: true,
            slug: true,
            imageUrl: true,
            isActive: true
          }
        }
      }
    });

    if (!product) {
      throw new Error(ProductError.NOT_FOUND);
    }

    return product;
  },

  async getBySlug(slug: string) {
    const product = await prisma.product.findUnique({
      where: { slug },
      include: {
        category: {
          select: {
            id: true,
            name: true,
            slug: true,
            imageUrl: true,
            isActive: true
          }
        }
      }
    });

    if (!product) {
      throw new Error(ProductError.NOT_FOUND);
    }

    return product;
  },

  async getShowcaseByCategorySlug(categorySlug: string, params: GetProductsParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);

    const skip = (page - 1) * limit;

    // Build where condition
    const where: any = {
      ...(categorySlug && {
        category: {
          slug: categorySlug
        }
      })
    };

    const [data, total] = await Promise.all([
      prisma.product.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }],
        include: {
          category: {
            select: {
              id: true,
              name: true,
              slug: true,
              imageUrl: true,
              isActive: true
            }
          }
        }
      }),
      prisma.product.count({ where })
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

  async create(payload: ProductBase) {
    const { name, slug, sku, categoryId } = payload;

    const existedProduct = await prisma.product.findFirst({
      where: {
        OR: [{ name }, { slug }, { sku }]
      }
    });

    if (existedProduct) {
      throw new Error(ProductError.PRODUCT_EXISTED);
    }

    const category = await prisma.category.findUnique({
      where: { id: categoryId }
    });

    if (!category) {
      throw new Error(ProductError.CATEGORY_NOT_FOUND);
    }

    return prisma.product.create({
      data: payload
    });
  },

  async update(id: string, payload: Partial<ProductBase>) {
    const { name, slug, sku, price, stock, imagesUrl, description, isActive, categoryId } = payload;

    // Check product by ID
    const product = await prisma.product.findUnique({
      where: { id }
    });

    if (!product) {
      throw new Error(ProductError.NOT_FOUND);
    }

    const data: any = {};

    if (name !== undefined) {
      // Find product with name
      const existedProduct = await prisma.product.findFirst({
        where: {
          name: name,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        throw new Error(ProductError.NAME_EXISTED);
      }

      data.name = name;
    }
    if (slug !== undefined) {
      // Find product with slug
      const existedProduct = await prisma.product.findFirst({
        where: {
          slug: slug,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        throw new Error(ProductError.SLUG_EXISTED);
      }

      data.slug = slug;
    }
    if (sku !== undefined) {
      // Find product with sku
      const existedProduct = await prisma.product.findFirst({
        where: {
          sku: sku,
          NOT: {
            id: id
          }
        }
      });

      if (existedProduct) {
        throw new Error(ProductError.SKU_EXISTED);
      }

      data.sku = sku;
    }
    if (price !== undefined) data.price = price;
    if (stock !== undefined) data.stock = stock;
    if (imagesUrl !== undefined) data.imagesUrl = imagesUrl;
    if (description !== undefined) data.description = description;
    if (categoryId !== undefined) {
      // Find Category with categoryId
      const category = await prisma.category.findUnique({
        where: { id: categoryId }
      });

      if (!category) {
        throw new Error(ProductError.CATEGORY_NOT_FOUND);
      }

      data.categoryId = categoryId;
    }
    if (isActive !== undefined) data.isActive = isActive;

    return prisma.product.update({
      where: { id },
      data,
      select: {
        id: true,
        name: true,
        sku: true,
        price: true,
        stock: true,
        description: true,
        imagesUrl: true,
        category: {
          select: {
            id: true,
            name: true,
            slug: true,
            imageUrl: true,
            isActive: true
          }
        },
        isActive: true,
        createdAt: true,
        updatedAt: true
      }
    });
  }
};
