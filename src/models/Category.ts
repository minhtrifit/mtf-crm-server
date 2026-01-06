export interface CategoryBase {
  name: string;
  slug: string;
  imageUrl: string;
}

export interface Category extends CategoryBase {
  id: string;
}
