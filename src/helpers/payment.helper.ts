export const buildAmountRangeWhere = (fromAmount?: number, toAmount?: number) => {
  if (fromAmount == null && toAmount == null) return undefined;

  return {
    ...(fromAmount != null && { lte: Number(fromAmount) }),
    ...(toAmount != null && { gte: Number(toAmount) })
  };
};
