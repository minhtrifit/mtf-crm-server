import { prisma } from '@/libs/prisma';
import { GetPoliciesParams, PolicyBase } from '@/models/Policy';
import { HttpError, PagingType } from '@/models';
import { HTTP_STATUS } from '@/constants/http-status-code';

export enum PolicyError {
  NOT_FOUND = 'POLICY_NOT_FOUND',
  EXISTED = 'POLICY_EXISTED',
  TITLE_EXISTED = 'POLICY_TITLE_EXISTED',
  SLUG_EXISTED = 'POLICY_SLUG_EXISTED'
}

export const policyService = {
  async getList(params: GetPoliciesParams) {
    const page = Math.max(Number(params.page) || 1, 1);
    const limit = Math.min(Number(params.limit) || 10, 100);
    const skip = (page - 1) * limit;

    const q = params.q?.trim();

    const where: any = {
      ...(q && {
        OR: [
          { title: { contains: q, mode: 'insensitive' } },
          { slug: { contains: q, mode: 'insensitive' } },
          { content: { contains: q, mode: 'insensitive' } }
        ]
      })
    };

    const [data, total] = await Promise.all([
      prisma.policy.findMany({
        where,
        skip,
        take: limit,
        orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
      }),
      prisma.policy.count({ where })
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
    const data = await prisma.policy.findMany({
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

    return {
      data
    };
  },

  async getById(id: string) {
    const policy = await prisma.policy.findUnique({
      where: { id }
    });

    if (!policy) throw new Error(PolicyError.NOT_FOUND);

    return policy;
  },

  async getBySlug(slug: string) {
    const policy = await prisma.policy.findUnique({
      where: { slug }
    });

    if (!policy) throw new Error(PolicyError.NOT_FOUND);

    return policy;
  },

  async create(payload: PolicyBase) {
    const { title, slug, content } = payload;

    const existedPolicy = await prisma.policy.findFirst({
      where: {
        OR: [{ title }, { slug }]
      }
    });

    if (existedPolicy) throw new Error(PolicyError.EXISTED);

    return prisma.policy.create({
      data: {
        title,
        slug,
        content
      }
    });
  },

  async update(id: string, payload: Partial<PolicyBase>) {
    const { title, slug, content } = payload;

    // Check policy tồn tại
    const policy = await prisma.policy.findUnique({
      where: { id }
    });

    if (!policy) throw new Error(PolicyError.NOT_FOUND);

    const data: any = {};

    if (title !== undefined) {
      const existed = await prisma.policy.findFirst({
        where: {
          title: title,
          NOT: { id }
        }
      });

      if (existed) throw new Error(PolicyError.TITLE_EXISTED);

      data.title = payload.title;
    }

    if (slug !== undefined) {
      const existed = await prisma.policy.findFirst({
        where: {
          slug: slug,
          NOT: { id }
        }
      });

      if (existed) throw new Error(PolicyError.SLUG_EXISTED);

      data.slug = slug;
    }

    if (content !== undefined) data.content = content;

    return prisma.policy.update({
      where: { id },
      data
    });
  },

  async delete(id: string) {
    const policy = await prisma.policy.findUnique({ where: { id } });

    if (!policy)
      throw new HttpError(PolicyError.NOT_FOUND, HTTP_STATUS.BAD_REQUEST, {
        policyId: id
      });

    return prisma.policy.delete({
      where: { id }
    });
  }
};
