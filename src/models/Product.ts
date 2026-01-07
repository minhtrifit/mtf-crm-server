export interface ProductBase {
  name: string;
  slug: string;
  sku: string;
  price: number;
  imagesUrl: string[];
  description: string;
  isActive: boolean;
  categoryId: string;
}

export interface Product extends ProductBase {
  id: string;
}
