/* 
| Tình huống          | OrderStatus | DeliveryStatus                     |
| ------------------- | ----------- | ---------------------------------- |
| Khách đặt COD       | `PENDING`   | `ORDERED`                          |
| Shop xác nhận đơn   | `PENDING`   | `CONFIRMED`                        |
| Đang giao COD       | `PENDING`   | `SHIPPING`                         |
| Giao COD xong       | `PAID`      | `DELIVERED`                        |
| VNPAY trả tiền ngay | `PAID`      | `ORDERED`                          |
| Hủy đơn             | `CANCELLED` | (giữ nguyên hoặc thêm `CANCELLED`) |
*/

import { PaymentMethod } from './Payment';

/*
  * COD FLOW
  OrderStatus: PENDING
  DeliveryStatus: ORDERED → CONFIRMED → PREPARING → SHIPPING → DELIVERED
  → sau khi giao xong → OrderStatus = PAID
*/

/*
  * OrderStatus: PAID
  DeliveryStatus: ORDERED → CONFIRMED → PREPARING → SHIPPING → DELIVERED
*/

export enum OrderStatus {
  PENDING = 'PENDING',
  PAID = 'PAID',
  CANCELLED = 'CANCELLED'
}

export enum DeliveryStatus {
  ORDERED = 'ORDERED', // đã đặt hàng
  CONFIRMED = 'CONFIRMED', // đã xác nhận đơn hàng
  PREPARING = 'PREPARING', // đang chuẩn bị hàng
  SHIPPING = 'SHIPPING', // đang vận chuyển
  DELIVERED = 'DELIVERED' // giao hàng thành công
}

export interface GetOrdersParams {
  page?: number;
  limit?: number;
  q?: string;
  status?: OrderStatus;
  deliveryStatus?: DeliveryStatus;
  buyerQ?: string;
  fromPaidTime?: string;
  toPaidTime?: string;
}

export interface OrderBody {
  userId: string;
  phone: string;
  deliveryAddress: string;
  note: string;
  items: OrderItemPayload[];
}

export interface AdminOrderBody extends OrderBody {
  amount: number;
  method: PaymentMethod;
  status: OrderStatus;
  deliveryStatus: DeliveryStatus;
}

export interface UpdateOrderBody {
  note: string;
  phone: string;
  deliveryAddress: string;
  status: OrderStatus;
  deliveryStatus: DeliveryStatus;
}

export interface OrderPayload {
  orderCode: string;
  userId: string;
  phone: string;
  deliveryAddress: string;
  note: string | null;
  totalAmount: number;
  items: {
    create: OrderItemPayload[];
  };
}

export interface AdminOrderPayload extends OrderPayload {
  status: OrderStatus;
  deliveryStatus: DeliveryStatus;
}

export interface OrderItemPayload {
  productId: string;
  quantity: number;
  price: number;
}
