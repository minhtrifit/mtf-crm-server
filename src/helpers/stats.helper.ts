import dayjs from 'dayjs';

export const getDateRange = (type: 'week' | 'month' | 'year') => {
  const now = dayjs();

  switch (type) {
    case 'week':
      return {
        start: now.startOf('week').toDate(),
        end: now.endOf('week').toDate()
      };
    case 'month':
      return {
        start: now.startOf('month').toDate(),
        end: now.endOf('month').toDate()
      };
    case 'year':
      return {
        start: now.startOf('year').toDate(),
        end: now.endOf('year').toDate()
      };
  }
};
