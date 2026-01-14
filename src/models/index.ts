export interface PagingType {
  current_page: number;
  total_item: number;
  total_page: number;
  total: number;
}

export class HttpError extends Error {
  status: number;
  data?: any;

  constructor(message: string, status = 400, data?: any) {
    super(message);
    this.status = status;
    this.data = data;
  }
}
