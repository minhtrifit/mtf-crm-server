export interface GetUsersParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
}

export enum Role {
  ADMIN = 'ADMIN',
  USER = 'USER'
}

export interface UserBase {
  email: string;
  password: string;
  fullName: string;
}

export interface User extends UserBase {
  id: string;
  role: Role;
  isActive: boolean;
  phone: string | null;
  address: string | null;
  // Province/District fields
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface UserPayload extends UserBase {
  role: Role;
  phone: string | null;
  address: string | null;
  // Province/District fields
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
}

export interface UpdateUserPayload extends UserBase {
  role: Role;
  phone: string | null;
  address: string | null;
  avatar: string | null;
  isActive: boolean;
  // Province/District fields
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
}
