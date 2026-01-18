export interface GetWebsiteTemplatesParams {
  page?: number;
  limit?: number;
  q?: string;
  isActive?: string;
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
