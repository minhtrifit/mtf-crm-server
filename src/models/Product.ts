export interface GetProductsParams {
  page?: number;
  limit?: number;
  q?: string;
  categoryId?: string;
  categorySlug?: string;
  isActive?: string;
}

export interface ProductBase {
  name: string;
  slug: string;
  sku: string;
  price: number;
  stock: number;
  imagesUrl: string[];
  description: string;
  isActive: boolean;
  categoryId: string;
}

export interface Product extends ProductBase {
  id: string;
}
