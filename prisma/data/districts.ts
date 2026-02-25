// Danh sách quận/huyện - Data có thể mở rộng thêm
export interface DistrictSeedData {
  code: string;
  name: string;
  type: 'district' | 'city' | 'town';
  provinceCode: string;
}

export const DISTRICTS_DATA: DistrictSeedData[] = [
  // Hà Nội (01)
  { code: '001', name: 'Quận Ba Đình', type: 'district', provinceCode: '01' },
  { code: '002', name: 'Quận Hoàn Kiếm', type: 'district', provinceCode: '01' },
  { code: '003', name: 'Quận Tây Hồ', type: 'district', provinceCode: '01' },
  { code: '004', name: 'Quận Long Biên', type: 'district', provinceCode: '01' },
  { code: '005', name: 'Quận Cầu Giấy', type: 'district', provinceCode: '01' },
  { code: '006', name: 'Quận Đống Đa', type: 'district', provinceCode: '01' },
  { code: '007', name: 'Quận Hai Bà Trưng', type: 'district', provinceCode: '01' },
  { code: '008', name: 'Quận Hoàng Mai', type: 'district', provinceCode: '01' },
  { code: '009', name: 'Quận Thanh Xuân', type: 'district', provinceCode: '01' },
  { code: '016', name: 'Huyện Sóc Sơn', type: 'district', provinceCode: '01' },
  { code: '017', name: 'Huyện Đông Anh', type: 'district', provinceCode: '01' },
  { code: '018', name: 'Huyện Gia Lâm', type: 'district', provinceCode: '01' },
  { code: '019', name: 'Quận Nam Từ Liêm', type: 'district', provinceCode: '01' },
  { code: '020', name: 'Huyện Thanh Trì', type: 'district', provinceCode: '01' },
  { code: '021', name: 'Quận Bắc Từ Liêm', type: 'district', provinceCode: '01' },
  { code: '250', name: 'Huyện Mê Linh', type: 'district', provinceCode: '01' },
  { code: '268', name: 'Quận Hà Đông', type: 'district', provinceCode: '01' },
  { code: '269', name: 'Thị xã Sơn Tây', type: 'town', provinceCode: '01' },
  { code: '271', name: 'Huyện Ba Vì', type: 'district', provinceCode: '01' },
  { code: '272', name: 'Huyện Phúc Thọ', type: 'district', provinceCode: '01' },
  { code: '273', name: 'Huyện Đan Phượng', type: 'district', provinceCode: '01' },
  { code: '274', name: 'Huyện Hoài Đức', type: 'district', provinceCode: '01' },
  { code: '275', name: 'Huyện Quốc Oai', type: 'district', provinceCode: '01' },
  { code: '276', name: 'Huyện Thạch Thất', type: 'district', provinceCode: '01' },
  { code: '277', name: 'Huyện Chương Mỹ', type: 'district', provinceCode: '01' },
  { code: '278', name: 'Huyện Thanh Oai', type: 'district', provinceCode: '01' },
  { code: '279', name: 'Huyện Thường Tín', type: 'district', provinceCode: '01' },
  { code: '280', name: 'Huyện Phú Xuyên', type: 'district', provinceCode: '01' },
  { code: '281', name: 'Huyện Ứng Hòa', type: 'district', provinceCode: '01' },
  { code: '282', name: 'Huyện Mỹ Đức', type: 'district', provinceCode: '01' },

  // TP. Hồ Chí Minh (79)
  { code: '760', name: 'Quận 1', type: 'district', provinceCode: '79' },
  { code: '761', name: 'Quận 12', type: 'district', provinceCode: '79' },
  { code: '762', name: 'Quận Thủ Đức', type: 'district', provinceCode: '79' },
  { code: '763', name: 'Quận 9', type: 'district', provinceCode: '79' },
  { code: '764', name: 'Quận Gò Vấp', type: 'district', provinceCode: '79' },
  { code: '765', name: 'Quận Bình Thạnh', type: 'district', provinceCode: '79' },
  { code: '766', name: 'Quận Tân Bình', type: 'district', provinceCode: '79' },
  { code: '767', name: 'Quận Tân Phú', type: 'district', provinceCode: '79' },
  { code: '768', name: 'Quận Phú Nhuận', type: 'district', provinceCode: '79' },
  { code: '769', name: 'Quận 2', type: 'district', provinceCode: '79' },
  { code: '770', name: 'Quận 3', type: 'district', provinceCode: '79' },
  { code: '771', name: 'Quận 10', type: 'district', provinceCode: '79' },
  { code: '772', name: 'Quận 11', type: 'district', provinceCode: '79' },
  { code: '773', name: 'Quận 4', type: 'district', provinceCode: '79' },
  { code: '774', name: 'Quận 5', type: 'district', provinceCode: '79' },
  { code: '775', name: 'Quận 6', type: 'district', provinceCode: '79' },
  { code: '776', name: 'Quận 8', type: 'district', provinceCode: '79' },
  { code: '777', name: 'Quận Bình Tân', type: 'district', provinceCode: '79' },
  { code: '778', name: 'Quận 7', type: 'district', provinceCode: '79' },
  { code: '783', name: 'Huyện Củ Chi', type: 'district', provinceCode: '79' },
  { code: '784', name: 'Huyện Hóc Môn', type: 'district', provinceCode: '79' },
  { code: '785', name: 'Huyện Bình Chánh', type: 'district', provinceCode: '79' },
  { code: '786', name: 'Huyện Nhà Bè', type: 'district', provinceCode: '79' },
  { code: '787', name: 'Huyện Cần Giờ', type: 'district', provinceCode: '79' },

  // Đà Nẵng (48)
  { code: '490', name: 'Quận Liên Chiểu', type: 'district', provinceCode: '48' },
  { code: '491', name: 'Quận Thanh Khê', type: 'district', provinceCode: '48' },
  { code: '492', name: 'Quận Hải Châu', type: 'district', provinceCode: '48' },
  { code: '493', name: 'Quận Sơn Trà', type: 'district', provinceCode: '48' },
  { code: '494', name: 'Quận Ngũ Hành Sơn', type: 'district', provinceCode: '48' },
  { code: '495', name: 'Quận Cẩm Lệ', type: 'district', provinceCode: '48' },
  { code: '497', name: 'Huyện Hòa Vang', type: 'district', provinceCode: '48' },
  { code: '498', name: 'Huyện Hoàng Sa', type: 'district', provinceCode: '48' },

  // Hải Phòng (31)
  { code: '303', name: 'Quận Hồng Bàng', type: 'district', provinceCode: '31' },
  { code: '304', name: 'Quận Ngô Quyền', type: 'district', provinceCode: '31' },
  { code: '305', name: 'Quận Lê Chân', type: 'district', provinceCode: '31' },
  { code: '306', name: 'Quận Hải An', type: 'district', provinceCode: '31' },
  { code: '307', name: 'Quận Kiến An', type: 'district', provinceCode: '31' },
  { code: '308', name: 'Quận Đồ Sơn', type: 'district', provinceCode: '31' },
  { code: '309', name: 'Quận Dương Kinh', type: 'district', provinceCode: '31' },
  { code: '311', name: 'Huyện Thuỷ Nguyên', type: 'district', provinceCode: '31' },
  { code: '312', name: 'Huyện An Dương', type: 'district', provinceCode: '31' },
  { code: '313', name: 'Huyện An Lão', type: 'district', provinceCode: '31' },
  { code: '314', name: 'Huyện Kiến Thuỵ', type: 'district', provinceCode: '31' },
  { code: '315', name: 'Huyện Tiên Lãng', type: 'district', provinceCode: '31' },
  { code: '316', name: 'Huyện Vĩnh Bảo', type: 'district', provinceCode: '31' },
  { code: '317', name: 'Huyện Cát Hải', type: 'district', provinceCode: '31' },
  { code: '318', name: 'Huyện Bạch Long Vĩ', type: 'district', provinceCode: '31' },

  // Cần Thơ (92)
  { code: '916', name: 'Quận Ninh Kiều', type: 'district', provinceCode: '92' },
  { code: '917', name: 'Quận Ô Môn', type: 'district', provinceCode: '92' },
  { code: '918', name: 'Quận Bình Thuỷ', type: 'district', provinceCode: '92' },
  { code: '919', name: 'Quận Cái Răng', type: 'district', provinceCode: '92' },
  { code: '923', name: 'Quận Thốt Nốt', type: 'district', provinceCode: '92' },
  { code: '924', name: 'Huyện Vĩnh Thạnh', type: 'district', provinceCode: '92' },
  { code: '925', name: 'Huyện Cờ Đỏ', type: 'district', provinceCode: '92' },
  { code: '926', name: 'Huyện Phong Điền', type: 'district', provinceCode: '92' },
  { code: '927', name: 'Huyện Thới Lai', type: 'district', provinceCode: '92' }

  // NOTE: Có thể bổ sung thêm các quận/huyện khác khi cần
];
