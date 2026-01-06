export interface CategoryBase {
  name: string;
  imageUrl: string;
}

export interface Category extends CategoryBase {
  id: string;
}
