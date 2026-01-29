import { getDateRange } from '@/helpers/stats.helper';
import { prisma } from '@/libs/prisma';
import { DeliveryStatus, OrderStatus } from '@/models/Order';
import { GetStatsOverviewParams, GetsTopSellingProductsParams } from '@/models/Stats';

export const statsService = {
  async getTotal() {
    const [orders, users, revenue] = await Promise.all([
      prisma.order.count(),
      prisma.user.count(),
      prisma.payment.aggregate({
        _sum: {
          amount: true
        },
        where: {
          order: {
            status: 'PAID'
          }
        }
      })
    ]);

    return {
      total_orders: orders,
      total_revenue: revenue._sum.amount ?? 0,
      total_users: users
    };
  },

  async getOverview(filter: GetStatsOverviewParams) {
    const { type, year } = filter;

    const start = new Date(year, 0, 1);
    const end = new Date(year, 11, 31, 23, 59, 59);

    /* ================= OVERVIEW ================= */

    const [totalProducts, totalOrders, totalUsers, revenueAgg] = await Promise.all([
      prisma.product.count({
        where: { createdAt: { gte: start, lte: end } }
      }),

      prisma.order.count({
        where: { createdAt: { gte: start, lte: end } }
      }),

      prisma.user.count({
        where: { createdAt: { gte: start, lte: end } }
      }),

      prisma.payment.aggregate({
        _sum: { amount: true },
        where: {
          paidAt: { gte: start, lte: end },
          order: { status: 'PAID' }
        }
      })
    ]);

    /* ================= MONTH STATS ================= */

    const months = Array.from({ length: 12 }, (_, i) => i + 1);

    const monthStats = await prisma.$queryRaw<
      {
        month: number;
        orders: number;
        users: number;
        revenue: number;
      }[]
    >`
      WITH months AS (
        SELECT UNNEST(${months}::int[]) AS month
      )
      SELECT 
        m.month,

        COUNT(DISTINCT o.id) AS orders,

        (
          SELECT COUNT(*) FROM "User" u
          WHERE EXTRACT(MONTH FROM u."createdAt") = m.month
          AND EXTRACT(YEAR FROM u."createdAt") = ${year}
        ) AS users,

        COALESCE(SUM(p.amount), 0) AS revenue

      FROM months m
      LEFT JOIN "Order" o
        ON EXTRACT(MONTH FROM o."createdAt") = m.month
        AND EXTRACT(YEAR FROM o."createdAt") = ${year}

      LEFT JOIN "Payment" p
        ON p."orderId" = o.id
        AND o.status = 'PAID'
        AND EXTRACT(MONTH FROM p."paidAt") = m.month
        AND EXTRACT(YEAR FROM p."paidAt") = ${year}

      GROUP BY m.month
      ORDER BY m.month;
    `;

    /* ================= QUARTER STATS ================= */

    const quarterStats = [
      { label: 'Q1', months: [1, 2, 3] },
      { label: 'Q2', months: [4, 5, 6] },
      { label: 'Q3', months: [7, 8, 9] },
      { label: 'Q4', months: [10, 11, 12] }
    ].map((q) => {
      const data = monthStats.filter((m) => q.months.includes(m.month));

      return {
        label: q.label,
        orders: data.reduce((s, i) => s + Number(i.orders), 0),
        users: data.reduce((s, i) => s + Number(i.users), 0),
        revenue: data.reduce((s, i) => s + Number(i.revenue), 0)
      };
    });

    /* ================= CHART RESPONSE ================= */

    const chart =
      type === 'year'
        ? {
            year: monthStats.map((m) => ({
              month: String(m.month),
              orders: Number(m.orders),
              users: Number(m.users),
              revenue: Number(m.revenue)
            }))
          }
        : {
            quarter: quarterStats
          };

    /* ================= FINAL RESPONSE ================= */

    return {
      overview: {
        total_products: totalProducts,
        total_orders: totalOrders,
        total_users: totalUsers,
        total_revenue: revenueAgg._sum.amount ?? 0
      },
      chart
    };
  },

  async getDeliveryStatus() {
    const [ordered, confirmed, preparing, shipping, delivered] = await Promise.all([
      prisma.order.count({ where: { deliveryStatus: DeliveryStatus.ORDERED } }),
      prisma.order.count({ where: { deliveryStatus: DeliveryStatus.CONFIRMED } }),
      prisma.order.count({ where: { deliveryStatus: DeliveryStatus.PREPARING } }),
      prisma.order.count({ where: { deliveryStatus: DeliveryStatus.SHIPPING } }),
      prisma.order.count({ where: { deliveryStatus: DeliveryStatus.DELIVERED } })
    ]);

    return {
      ordered,
      confirmed,
      preparing,
      shipping,
      delivered
    };
  },

  async getTopSellingProducts(filter: GetsTopSellingProductsParams) {
    const { type } = filter;

    const { start, end } = getDateRange(type);

    const result = await prisma.orderItem.groupBy({
      by: ['productId'],
      where: {
        order: {
          status: OrderStatus.PAID,
          createdAt: {
            gte: start,
            lte: end
          }
        }
      },
      _sum: {
        quantity: true
      },
      orderBy: {
        _sum: {
          quantity: 'desc'
        }
      },
      take: 5
    });

    const productIds = result.map((r) => r.productId);

    const products = await prisma.product.findMany({
      where: {
        id: { in: productIds }
      },
      include: {
        category: true
      }
    });

    return result.map((item) => ({
      product: products.find((p) => p.id === item.productId),
      soldQuantity: item._sum.quantity ?? 0
    }));
  },

  async getRecentOrders() {
    const latestOrders = await prisma.order.findMany({
      orderBy: {
        createdAt: 'desc'
      },
      take: 5,
      include: {
        user: {
          select: {
            id: true,
            fullName: true,
            email: true,
            avatar: true
          }
        },
        items: {
          include: {
            product: true
          }
        }
      }
    });

    return latestOrders;
  }
};
