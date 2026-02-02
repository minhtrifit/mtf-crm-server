export interface GetFaqsParams {
  page?: number;
  limit?: number;
  q?: string;
}

export interface FaqBase {
  title: string;
  content: string;
  createdAt: string;
  updatedAt: string;
}

export interface Faq extends FaqBase {
  id: string;
}
