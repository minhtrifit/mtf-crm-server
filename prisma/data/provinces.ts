// Danh sách 63 tỉnh thành Việt Nam theo mã Tổng cục Thống kê
export interface ProvinceSeedData {
  code: string;
  name: string;
  nameShort: string;
  type: 'city' | 'province';
  region: 'north' | 'central' | 'south';
}

export const PROVINCES_DATA: ProvinceSeedData[] = [
  // Miền Bắc (North)
  { code: '01', name: 'Thành phố Hà Nội', nameShort: 'Hà Nội', type: 'city', region: 'north' },
  { code: '02', name: 'Tỉnh Hà Giang', nameShort: 'Hà Giang', type: 'province', region: 'north' },
  { code: '04', name: 'Tỉnh Cao Bằng', nameShort: 'Cao Bằng', type: 'province', region: 'north' },
  { code: '06', name: 'Tỉnh Bắc Kạn', nameShort: 'Bắc Kạn', type: 'province', region: 'north' },
  { code: '08', name: 'Tỉnh Tuyên Quang', nameShort: 'Tuyên Quang', type: 'province', region: 'north' },
  { code: '10', name: 'Tỉnh Lào Cai', nameShort: 'Lào Cai', type: 'province', region: 'north' },
  { code: '11', name: 'Tỉnh Điện Biên', nameShort: 'Điện Biên', type: 'province', region: 'north' },
  { code: '12', name: 'Tỉnh Lai Châu', nameShort: 'Lai Châu', type: 'province', region: 'north' },
  { code: '14', name: 'Tỉnh Sơn La', nameShort: 'Sơn La', type: 'province', region: 'north' },
  { code: '15', name: 'Tỉnh Yên Bái', nameShort: 'Yên Bái', type: 'province', region: 'north' },
  { code: '17', name: 'Tỉnh Hoà Bình', nameShort: 'Hoà Bình', type: 'province', region: 'north' },
  { code: '19', name: 'Tỉnh Thái Nguyên', nameShort: 'Thái Nguyên', type: 'province', region: 'north' },
  { code: '20', name: 'Tỉnh Lạng Sơn', nameShort: 'Lạng Sơn', type: 'province', region: 'north' },
  { code: '22', name: 'Tỉnh Quảng Ninh', nameShort: 'Quảng Ninh', type: 'province', region: 'north' },
  { code: '24', name: 'Tỉnh Bắc Giang', nameShort: 'Bắc Giang', type: 'province', region: 'north' },
  { code: '25', name: 'Tỉnh Phú Thọ', nameShort: 'Phú Thọ', type: 'province', region: 'north' },
  { code: '26', name: 'Tỉnh Vĩnh Phúc', nameShort: 'Vĩnh Phúc', type: 'province', region: 'north' },
  { code: '27', name: 'Tỉnh Bắc Ninh', nameShort: 'Bắc Ninh', type: 'province', region: 'north' },
  { code: '30', name: 'Tỉnh Hải Dương', nameShort: 'Hải Dương', type: 'province', region: 'north' },
  { code: '31', name: 'Thành phố Hải Phòng', nameShort: 'Hải Phòng', type: 'city', region: 'north' },
  { code: '33', name: 'Tỉnh Hưng Yên', nameShort: 'Hưng Yên', type: 'province', region: 'north' },
  { code: '34', name: 'Tỉnh Thái Bình', nameShort: 'Thái Bình', type: 'province', region: 'north' },
  { code: '35', name: 'Tỉnh Hà Nam', nameShort: 'Hà Nam', type: 'province', region: 'north' },
  { code: '36', name: 'Tỉnh Nam Định', nameShort: 'Nam Định', type: 'province', region: 'north' },
  { code: '37', name: 'Tỉnh Ninh Bình', nameShort: 'Ninh Bình', type: 'province', region: 'north' },

  // Miền Trung (Central)
  { code: '38', name: 'Tỉnh Thanh Hóa', nameShort: 'Thanh Hóa', type: 'province', region: 'central' },
  { code: '40', name: 'Tỉnh Nghệ An', nameShort: 'Nghệ An', type: 'province', region: 'central' },
  { code: '42', name: 'Tỉnh Hà Tĩnh', nameShort: 'Hà Tĩnh', type: 'province', region: 'central' },
  { code: '44', name: 'Tỉnh Quảng Bình', nameShort: 'Quảng Bình', type: 'province', region: 'central' },
  { code: '45', name: 'Tỉnh Quảng Trị', nameShort: 'Quảng Trị', type: 'province', region: 'central' },
  { code: '46', name: 'Tỉnh Thừa Thiên Huế', nameShort: 'Thừa Thiên Huế', type: 'province', region: 'central' },
  { code: '48', name: 'Thành phố Đà Nẵng', nameShort: 'Đà Nẵng', type: 'city', region: 'central' },
  { code: '49', name: 'Tỉnh Quảng Nam', nameShort: 'Quảng Nam', type: 'province', region: 'central' },
  { code: '51', name: 'Tỉnh Quảng Ngãi', nameShort: 'Quảng Ngãi', type: 'province', region: 'central' },
  { code: '52', name: 'Tỉnh Bình Định', nameShort: 'Bình Định', type: 'province', region: 'central' },
  { code: '54', name: 'Tỉnh Phú Yên', nameShort: 'Phú Yên', type: 'province', region: 'central' },
  { code: '56', name: 'Tỉnh Khánh Hòa', nameShort: 'Khánh Hòa', type: 'province', region: 'central' },
  { code: '58', name: 'Tỉnh Ninh Thuận', nameShort: 'Ninh Thuận', type: 'province', region: 'central' },
  { code: '60', name: 'Tỉnh Bình Thuận', nameShort: 'Bình Thuận', type: 'province', region: 'central' },

  // Tây Nguyên (Central Highlands - thuộc miền Trung)
  { code: '62', name: 'Tỉnh Kon Tum', nameShort: 'Kon Tum', type: 'province', region: 'central' },
  { code: '64', name: 'Tỉnh Gia Lai', nameShort: 'Gia Lai', type: 'province', region: 'central' },
  { code: '66', name: 'Tỉnh Đắk Lắk', nameShort: 'Đắk Lắk', type: 'province', region: 'central' },
  { code: '67', name: 'Tỉnh Đắk Nông', nameShort: 'Đắk Nông', type: 'province', region: 'central' },
  { code: '68', name: 'Tỉnh Lâm Đồng', nameShort: 'Lâm Đồng', type: 'province', region: 'central' },

  // Miền Nam (South)
  { code: '70', name: 'Tỉnh Bình Phước', nameShort: 'Bình Phước', type: 'province', region: 'south' },
  { code: '72', name: 'Tỉnh Tây Ninh', nameShort: 'Tây Ninh', type: 'province', region: 'south' },
  { code: '74', name: 'Tỉnh Bình Dương', nameShort: 'Bình Dương', type: 'province', region: 'south' },
  { code: '75', name: 'Tỉnh Đồng Nai', nameShort: 'Đồng Nai', type: 'province', region: 'south' },
  { code: '77', name: 'Tỉnh Bà Rịa - Vũng Tàu', nameShort: 'Bà Rịa - Vũng Tàu', type: 'province', region: 'south' },
  { code: '79', name: 'Thành phố Hồ Chí Minh', nameShort: 'Hồ Chí Minh', type: 'city', region: 'south' },
  { code: '80', name: 'Tỉnh Long An', nameShort: 'Long An', type: 'province', region: 'south' },
  { code: '82', name: 'Tỉnh Tiền Giang', nameShort: 'Tiền Giang', type: 'province', region: 'south' },
  { code: '83', name: 'Tỉnh Bến Tre', nameShort: 'Bến Tre', type: 'province', region: 'south' },
  { code: '84', name: 'Tỉnh Trà Vinh', nameShort: 'Trà Vinh', type: 'province', region: 'south' },
  { code: '86', name: 'Tỉnh Vĩnh Long', nameShort: 'Vĩnh Long', type: 'province', region: 'south' },
  { code: '87', name: 'Tỉnh Đồng Tháp', nameShort: 'Đồng Tháp', type: 'province', region: 'south' },
  { code: '89', name: 'Tỉnh An Giang', nameShort: 'An Giang', type: 'province', region: 'south' },
  { code: '91', name: 'Tỉnh Kiên Giang', nameShort: 'Kiên Giang', type: 'province', region: 'south' },
  { code: '92', name: 'Thành phố Cần Thơ', nameShort: 'Cần Thơ', type: 'city', region: 'south' },
  { code: '93', name: 'Tỉnh Hậu Giang', nameShort: 'Hậu Giang', type: 'province', region: 'south' },
  { code: '94', name: 'Tỉnh Sóc Trăng', nameShort: 'Sóc Trăng', type: 'province', region: 'south' },
  { code: '95', name: 'Tỉnh Bạc Liêu', nameShort: 'Bạc Liêu', type: 'province', region: 'south' },
  { code: '96', name: 'Tỉnh Cà Mau', nameShort: 'Cà Mau', type: 'province', region: 'south' }
];
