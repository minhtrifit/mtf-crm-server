export interface GetCustomersParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
}

export interface BaseCustomer {
  fullName: string;
  phone: string;
  email?: string;
  address: string;
}

export interface Customer extends BaseCustomer {
  id: string;
}

export interface CustomerPayload {
  fullName: string;
  phone: string;
  email: string | null;
  address: string;
}
