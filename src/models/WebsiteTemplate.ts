export interface GetWebsiteTemplatesParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
}

export interface SectionType {
  title: string;
  position: number;
  items: { productId: string; position: number }[];
}

export interface WebsiteTemplateBase {
  name: string;
  primaryColor: string;
  logoUrl: string;
  bannersUrl: string[];
  email: string;
  phone: string;
  footerDescription: string;
  isActive: boolean;
  sections: SectionType[];
}

export interface WebsiteTemplate extends WebsiteTemplateBase {
  id: string;
}
