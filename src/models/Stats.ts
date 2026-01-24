export interface GetStatsOverviewParams {
  type: 'year' | 'quarter';
  year: number;
}

export interface GetsTopSellingProductsParams {
  type: 'week' | 'month' | 'year';
}
