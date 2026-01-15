export enum PaymentMethod {
  COD = 'COD',
  VNPAY = 'VNPAY'
}

export interface GetPaymentParams {
  page?: number;
  limit?: number;
  q?: string;
  orderId?: string;
  method: PaymentMethod;
  fromAmount?: number;
  toAmount?: number;
  fromPaidTime?: string;
  toPaidTime?: string;
}

export interface PaymentPayload {
  orderId: string;
  amount: number;
  method: PaymentMethod;
}

export interface PaymentBase {
  orderId: string;
  amount: number;
  method: PaymentMethod;
}

export interface Payment extends PaymentBase {
  id: string;
  paidAt: string;
}
