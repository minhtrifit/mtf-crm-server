export interface GetStoresParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
}

export interface StoreBase {
  name: string;
  address: string;
  hotline: string;
  email: string;
  taxCode: string;
  isActive?: boolean;
}

export interface Store extends StoreBase {
  id: string;
}
