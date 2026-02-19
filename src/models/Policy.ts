export interface GetPoliciesParams {
  page?: number;
  limit?: number;
  q?: string;
}

export interface PolicyBase {
  title: string;
  slug: string;
  content: string;
  createdAt: string;
  updatedAt: string;
}

export interface Policy extends PolicyBase {
  id: string;
}
