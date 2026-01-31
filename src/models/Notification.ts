export enum NotificationType {
  ORDER = 'ORDER'
}

export interface NotificationBase {
  type: NotificationType;
  itemId: string;
  message_vi: string;
  message_en: string;
  isSeen: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface Notification extends NotificationBase {
  id: string;
}

export interface GetNotificationsParams {
  type?: NotificationType;
  limit?: number;
}

export interface UpdateNotificationBody {
  type: NotificationType;
  itemId: string;
  message_vi: string;
  message_en: string;
  isSeen: boolean;
}
