import { prisma } from '@/libs/prisma';
import { GetNotificationsParams, UpdateNotificationBody } from '@/models/Notification';

export enum NotificationError {
  EXISTED = 'EXISTED',
  NOT_FOUND = 'NOTIFICATION_NOT_FOUND'
}

export const notificationService = {
  async getList(params: GetNotificationsParams) {
    const limit = Math.min(Number(params.limit) || 10, 100);
    const type = params.type?.trim();

    const where: any = {
      ...(type !== undefined && { type })
    };

    const data = await prisma.notification.findMany({
      where,
      take: limit,
      orderBy: [{ createdAt: 'desc' }, { id: 'desc' }]
    });

    return data;
  },

  async update(id: string, payload: Partial<UpdateNotificationBody>) {
    const { type, itemId, message_vi, message_en, isSeen } = payload;

    // Check notification by ID
    const notification = await prisma.notification.findUnique({
      where: { id }
    });

    if (!notification) throw new Error(NotificationError.NOT_FOUND);

    const data: any = {};

    if (itemId !== undefined) {
      // Find notification with itemId
      const existedNotification = await prisma.notification.findFirst({
        where: {
          itemId: itemId,
          NOT: {
            id: id
          }
        }
      });

      if (existedNotification) throw new Error(NotificationError.EXISTED);

      data.itemId = itemId;
    }
    if (type !== undefined) data.type = type;
    if (message_vi !== undefined) data.message_vi = message_vi;
    if (message_en !== undefined) data.message_en = message_en;
    if (isSeen !== undefined) data.isSeen = isSeen;

    return prisma.notification.update({
      where: { id },
      data
    });
  }
};
