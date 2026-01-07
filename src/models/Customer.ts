export interface BaseCustomer {
  fullName: string;
  phone: string;
  email?: string;
  address: string;
}

export interface Customer extends BaseCustomer {
  id: string;
}
