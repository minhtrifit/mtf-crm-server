export interface Province {
  code: string;
  name: string;
  nameShort: string;
  type: 'city' | 'province';
  region: 'north' | 'central' | 'south';
  createdAt?: Date;
  updatedAt?: Date;
}

export interface District {
  code: string;
  name: string;
  type: 'district' | 'city' | 'town';
  provinceCode: string;
  createdAt?: Date;
  updatedAt?: Date;
}
