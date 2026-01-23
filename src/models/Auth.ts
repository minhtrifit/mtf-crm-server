import { Role } from './User';

export interface RegisterPayload {
  email: string;
  password: string;
  fullName: string;
  phone: string | null;
  address: string | null;
  role?: Role;
}

export interface LoginPayload {
  email: string;
  password: string;
}
