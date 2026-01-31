import Joi from 'joi';
import { NotificationType } from '@/models/Notification';

const typeValues = Object.values(NotificationType);

export const GetQuerySchema = Joi.object({
  limit: Joi.number().integer().min(1).max(100).optional(),
  type: Joi.string().trim().allow('').optional()
});

export const UpdateSchema = Joi.object({
  itemId: Joi.string().min(1).optional(),
  type: Joi.string()
    .valid(...typeValues)
    .optional(),
  message_vi: Joi.string().min(1).optional(),
  message_en: Joi.string().min(1).optional(),
  isSeen: Joi.boolean().optional()
});
