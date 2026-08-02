export interface AddToCartPayload {
  productId: string;
  quantity: number;
}

export interface UpdateCartItemQuantityPayload {
  cartItemId: string;
  quantity: number;
}
