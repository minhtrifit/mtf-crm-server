export interface GetWebsiteTemplatesParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
}

export interface SectionItemType {
  id: string;
  productId: string;
  position: number;
}

export interface SectionType {
  id: string;
  title: string;
  position: number;
  items: SectionItemType[];
}

export interface WebsiteTemplateBase {
  name: string;
  primaryColor: string;
  logoUrl: string;
  isActive: boolean;
}

export interface WebsiteTemplate extends WebsiteTemplateBase {
  id: string;
}
