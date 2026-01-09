export enum PaymentMethod {
  COD = 'COD',
  VNPAY = 'VNPAY'
}

export interface PaymentPayload {
  orderId: string;
  amount: number;
  method: PaymentMethod;
}
