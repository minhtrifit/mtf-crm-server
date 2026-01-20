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

  async getSections(id: string) {
    const template = await prisma.websiteTemplate.findUnique({
      where: {
        id: id,
        isActive: true
      }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    const sections = await prisma.websiteSection.findMany({
      where: {
        templateId: template.id
      },
      orderBy: {
        position: 'asc'
      },
      include: {
        items: {
          include: {
            product: true
          },
          orderBy: {
            position: 'asc'
          }
        }
      }
    });

    return sections;
  },

  async getById(id: string) {
    const template = await prisma.websiteTemplate.findUnique({
      where: { id },
      include: {
        sections: {
          orderBy: { position: 'asc' },
          include: {
            items: {
              orderBy: { position: 'asc' },
              include: {
                product: true
              }
            }
          }
        }
      }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    return template;
  },

  async create(payload: WebsiteTemplateBase) {
    const { name, isActive, sections, primaryColor, logoUrl } = payload;

    const existedTemplate = await prisma.websiteTemplate.findFirst({
      where: { name }
    });

    if (existedTemplate) {
      throw new Error(WebsiteTemplateError.WEBSITE_TEMPLATE_EXISTED);
    }

    return prisma.$transaction(async (tx) => {
      if (isActive) {
        await tx.websiteTemplate.updateMany({
          where: { isActive: true },
          data: { isActive: false }
        });
      }

      console.log(payload);

      return tx.websiteTemplate.create({
        data: {
          name,
          primaryColor,
          logoUrl,
          isActive,

          sections: {
            create: sections.map((section) => ({
              title: section.title,
              position: section.position,

              items: {
                create: section.items.map((item) => ({
                  productId: item.productId,
                  position: item.position
                }))
              }
            }))
          }
        },
        include: {
          sections: {
            include: {
              items: true
            }
          }
        }
      });
    });
  },

  async update(id: string, payload: Partial<WebsiteTemplateBase>) {
    const { name, primaryColor, logoUrl, bannersUrl, isActive, sections } = payload;

    const template = await prisma.websiteTemplate.findUnique({
      where: { id }
    });

    if (!template) {
      throw new Error(WebsiteTemplateError.NOT_FOUND);
    }

    const data: any = {};

    if (name !== undefined) {
      const existedTemplate = await prisma.websiteTemplate.findFirst({
        where: {
          name,
          NOT: { id }
        }
      });

      if (existedTemplate) {
        throw new Error(WebsiteTemplateError.NAME_EXISTED);
      }

      data.name = name;
    }

    if (primaryColor !== undefined) data.primaryColor = primaryColor;
    if (logoUrl !== undefined) data.logoUrl = logoUrl;
    if (bannersUrl !== undefined) data.bannersUrl = bannersUrl;
    if (isActive !== undefined) data.isActive = isActive;

    return prisma.$transaction(async (tx) => {
      if (isActive) {
        await tx.websiteTemplate.updateMany({
          where: { isActive: true },
          data: { isActive: false }
        });
      }

      await tx.websiteTemplate.update({
        where: { id },
        data
      });

      // ===== update sections =====
      if (sections) {
        // 1. delete all items
        await tx.websiteSectionItem.deleteMany({
          where: {
            section: { templateId: id }
          }
        });

        // 2. delete all sections
        await tx.websiteSection.deleteMany({
          where: { templateId: id }
        });

        // 3. recreate sections
        for (const section of sections) {
          const createdSection = await tx.websiteSection.create({
            data: {
              templateId: id,
              title: section.title,
              position: section.position
            }
          });

          // 4. recreate items
          if (section.items?.length) {
            await tx.websiteSectionItem.createMany({
              data: section.items.map((item) => ({
                sectionId: createdSection.id,
                productId: item.productId,
                position: item.position
              }))
            });
          }
        }
      }

      return true;
    });
  }
};
