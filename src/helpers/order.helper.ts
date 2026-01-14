import moment from 'moment-timezone';

const TZ = 'Asia/Ho_Chi_Minh';

export const buildPaidTimeWhere = (fromPaidTime?: string, toPaidTime?: string) => {
  if (!fromPaidTime && !toPaidTime) return undefined;

  return {
    ...(fromPaidTime?.trim() && {
      gte: moment.tz(fromPaidTime, 'YYYY-MM-DD', TZ).startOf('day').toDate()
    }),
    ...(toPaidTime?.trim() && {
      lte: moment.tz(toPaidTime, 'YYYY-MM-DD', TZ).endOf('day').toDate()
    })
  };
};
