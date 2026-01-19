import { prisma } from '@/libs/prisma';
import { GetWebsiteTemplatesParams, WebsiteTemplateBase } from '@/models/WebsiteTemplate';
import { PagingType } from '@/models';

export enum WebsiteTemplateError {
  NOT_FOUND = 'WEBSITE_TEMPLATE_NOT_FOUND',
  WEBSITE_TEMPLATE_EXISTED = 'WEBSITE_TEMPLATE_EXISTED',
  NAME_EXISTED = 'NAME_EXISTED'
}

export const websiteTemplateService = {
  async getList(params: GetWebsiteTemplatesParams) {
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
        OR: [{ name: { contains: q, mode: 'insensitive' } }]
      })
    };

    const [data, total] = await Promise.all([
      prisma.websiteTemplate.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.websiteTemplate.count({ where })
    ]);

    const paging: PagingType = {
      current_page: page,
      total_item: data.length,
      total_page: Math.ceil(total / limit),
      total
    };

    return { data, paging };
  },

  async getShowcase() {
    const template = await prisma.websiteTemplate.findFirst({
      where: {
        isActive: true
      },
      orderBy: {
        createdAt: 'desc'
      }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    return template;
  },

  async getById(id: string) {
    const template = await prisma.websiteTemplate.findUnique({
      where: { id },
      include: {
        sections: true
      }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    return template;
  },

  async create(payload: WebsiteTemplateBase) {
    const { name, isActive } = payload;

    const existedTemplate = await prisma.websiteTemplate.findFirst({
      where: {
        name
      }
    });

    if (existedTemplate) {
      throw new Error(WebsiteTemplateError.WEBSITE_TEMPLATE_EXISTED);
    }

    return prisma.$transaction(async (tx) => {
      if (isActive) {
        await tx.websiteTemplate.updateMany({
          where: {
            isActive: true
          },
          data: {
            isActive: false
          }
        });
      }

      return tx.websiteTemplate.create({
        data: payload
      });
    });
  },

  async update(id: string, payload: Partial<WebsiteTemplateBase>) {
    const { name, primaryColor, logoUrl, isActive } = payload;

    const template = await prisma.websiteTemplate.findUnique({
      where: { id }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    const data: any = {};

    if (name !== undefined) {
      // Find template with name
      const existedTemplate = await prisma.websiteTemplate.findFirst({
        where: {
          name: name,
          NOT: {
            id: id
          }
        }
      });

      if (existedTemplate) {
        throw new Error(WebsiteTemplateError.NAME_EXISTED);
      }

      data.name = name;
    }

    if (primaryColor !== undefined) data.primaryColor = primaryColor;
    if (logoUrl !== undefined) data.logoUrl = logoUrl;
    if (isActive !== undefined) data.isActive = isActive;

    return prisma.$transaction(async (tx) => {
      if (isActive) {
        await tx.websiteTemplate.updateMany({
          where: {
            isActive: true
          },
          data: {
            isActive: false
          }
        });
      }

      return tx.websiteTemplate.update({
        where: { id },
        data
      });
    });
  }
};
