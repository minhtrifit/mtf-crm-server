import { prisma } from '@/libs/prisma';
import { FaqBase, GetFaqsParams } from '@/models/Faq';
import { HttpError, PagingType } from '@/models';
import { HTTP_STATUS } from '@/constants/http-status-code';

export enum FaqError {
  NOT_FOUND = 'FAQ_NOT_FOUND'
}

export const faqService = {
  async getList(params: GetFaqsParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();

    const where: any = {
      ...(q && {
        OR: [{ title: { contains: q, mode: 'insensitive' } }, { content: { contains: q, mode: 'insensitive' } }]
      })
    };

    const [data, total] = await Promise.all([
      prisma.faq.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.faq.count({ where })
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
    const data = await prisma.faq.findMany({
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

    return {
      data
    };
  },

  async getById(id: string) {
    const faq = await prisma.faq.findUnique({
      where: { id }
    });

    if (!faq) throw new Error(FaqError.NOT_FOUND);

    return faq;
  },

  async create(payload: FaqBase) {
    const { title, content } = payload;

    return prisma.faq.create({
      data: {
        title,
        content
      }
    });
  },

  async update(id: string, payload: Partial<FaqBase>) {
    const { title, content } = payload;

    // Check faq tồn tại
    const faq = await prisma.faq.findUnique({
      where: { id }
    });

    if (!faq) throw new Error(FaqError.NOT_FOUND);

    const data: any = {};

    if (title !== undefined) data.title = title;
    if (content !== undefined) data.content = content;

    return prisma.faq.update({
      where: { id },
      data
    });
  },

  async delete(id: string) {
    const faq = await prisma.faq.findUnique({ where: { id } });

    if (!faq)
      throw new HttpError(FaqError.NOT_FOUND, HTTP_STATUS.BAD_REQUEST, {
        faqId: id
      });

    return prisma.faq.delete({
      where: { id }
    });
  }
};
