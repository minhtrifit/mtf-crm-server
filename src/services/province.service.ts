import { prisma } from '@/libs/prisma';
import type { Province, District } from '@/models/province.model';

export enum ProvinceError {
  NOT_FOUND = 'PROVINCE_NOT_FOUND'
}

export async function getAllProvinces(search?: string, region?: string): Promise<Province[]> {
  const where: any = {};

  if (search) {
    where.OR = [
      { name: { contains: search, mode: 'insensitive' } },
      { nameShort: { contains: search, mode: 'insensitive' } }
    ];
  }

  if (region) {
    where.region = region;
  }

  const provinces = await prisma.province.findMany({
    where,
    orderBy: {
      code: 'asc'
    }
  });

  return provinces as Province[];
}

export async function getProvinceByCode(code: string): Promise<Province> {
  const province = await prisma.province.findUnique({
    where: { code }
  });

  if (!province) {
    throw new Error(ProvinceError.NOT_FOUND);
  }

  return province as Province;
}

export async function getDistrictsByProvinceCode(code: string): Promise<District[]> {
  // Kiểm tra province tồn tại
  const province = await prisma.province.findUnique({
    where: { code }
  });

  if (!province) {
    throw new Error(ProvinceError.NOT_FOUND);
  }

  const districts = await prisma.district.findMany({
    where: { provinceCode: code },
    orderBy: {
      code: 'asc'
    }
  });

  return districts as District[];
}
