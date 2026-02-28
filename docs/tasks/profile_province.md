# Thêm Province/District vào User Profile - Planning

## 1. Yêu cầu (Requirements)

### Mô tả
Thêm các trường thông tin tỉnh/thành phố và quận/huyện vào User schema để:
- Lưu thông tin địa chỉ chi tiết của ngườI dùng
- Hỗ trợ chọn địa chỉ từ dropdown tỉnh/thành → quận/huyện
- Tích hợp với API Province đã có sẵn

### Schema Changes
Thêm 4 trường mới vào model `User`:
| Trường | Kiểu dữ liệu | Mô tả |
|--------|-------------|-------|
| `provinceCode` | String? | Mã tỉnh/thành phố (khóa ngoại → Province) |
| `provinceName` | String? | Tên tỉnh/thành phố (denormalized) |
| `districtCode` | String? | Mã quận/huyện (khóa ngoại → District) |
| `districtName` | String? | Tên quận/huyện (denormalized) |

### API Endpoints cần cập nhật
| Endpoint | Method | Thay đổi |
|----------|--------|----------|
| `/api/auth/register` | POST | Thêm provinceCode, districtCode vào body |
| `/api/auth/me` | GET | Trả về thêm provinceCode, provinceName, districtCode, districtName |
| `/api/users/:id` | GET | Trả về thêm thông tin province/district |
| `/api/users/:id` | PUT/PATCH | Cho phép cập nhật provinceCode, districtCode |
| `/api/users` | POST | Cho phép tạo user với provinceCode, districtCode |

---

## 2. Database Schema Changes

### Prisma Schema Update

```prisma
model User {
  id        String   @id @default(uuid())
  email     String   @unique
  password  String
  fullName  String
  phone     String?  @unique
  address   String?
  avatar    String?  
  role      Role     @default(USER)
  isActive  Boolean  @default(true)
  
  // Province/District fields - NEW
  provinceCode String? @db.VarChar(10)
  provinceName String? @db.VarChar(100)
  districtCode String? @db.VarChar(10)
  districtName String? @db.VarChar(100)

  orders    Order[]
  reviews   Review[]

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
```

> **Note:** Không tạo quan hệ (relation) với Province/District để giữ schema đơn giản. Sử dụng denormalized fields (provinceName, districtName) để tránh join query.

---

## 3. Implementation Steps

### Step 1: Update Prisma Schema
- **File:** `prisma/schema.prisma`
- **Action:** Thêm 4 fields `provinceCode`, `provinceName`, `districtCode`, `districtName` vào model `User`

### Step 2: Create Migration
```bash
npm run prisma:migrate:dev -- --name add_province_district_to_user
```

### Step 3: Generate Prisma Client
```bash
npm run prisma:generate
```

### Step 4: Update TypeScript Interfaces
- **File:** `src/models/User.ts`
- **Action:** Cập nhật các interface để include province/district fields

```typescript
export interface User {
  id: string;
  email: string;
  fullName: string;
  role: Role;
  isActive: boolean;
  phone: string | null;
  address: string | null;
  // NEW FIELDS
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface UserPayload {
  // ... existing fields
  phone: string | null;
  address: string | null;
  // NEW FIELDS
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
}

export interface UpdateUserPayload {
  // ... existing fields
  provinceCode: string | null;
  provinceName: string | null;
  districtCode: string | null;
  districtName: string | null;
}
```

### Step 5: Update DTOs
- **File:** `src/dtos/user.dto.ts`
- **Action:** Cập nhật Joi schemas cho Create, Update, Register

```typescript
export const CreateSchema = Joi.object({
  email: Joi.string().required(),
  password: Joi.string().required(),
  fullName: Joi.string().required(),
  phone: Joi.string().allow('', null),
  address: Joi.string().allow('', null),
  // NEW FIELDS
  provinceCode: Joi.string().allow('', null).max(10),
  districtCode: Joi.string().allow('', null).max(10),
  role: Joi.string().valid(...roleValues).optional()
});

export const UpdateSchema = Joi.object({
  email: Joi.string().min(1).optional(),
  fullName: Joi.string().min(1).optional(),
  phone: Joi.string().allow('').optional(),
  address: Joi.string().allow('').optional(),
  avatar: Joi.string().allow('').optional(),
  // NEW FIELDS
  provinceCode: Joi.string().allow('').max(10).optional(),
  districtCode: Joi.string().allow('').max(10).optional(),
  role: Joi.string().valid(...roleValues).optional(),
  isActive: Joi.boolean().optional()
});

export const RegisterSchema = Joi.object({
  email: Joi.string().required(),
  password: Joi.string().required(),
  fullName: Joi.string().required(),
  phone: Joi.string().allow('', null),
  address: Joi.string().allow('', null),
  // NEW FIELDS
  provinceCode: Joi.string().allow('', null).max(10),
  districtCode: Joi.string().allow('', null).max(10)
});
```

### Step 6: Update Auth Service
- **File:** `src/services/auth.service.ts`
- **Action:** 
  - Cập nhật `register()` để xử lý provinceCode, districtCode
  - Cập nhật `getMe()` để trả về province/district info
  - Thêm helper method để lookup provinceName, districtName từ code

```typescript
// Helper method để lấy tên từ code
private async getProvinceDistrictNames(provinceCode?: string, districtCode?: string) {
  let provinceName = null;
  let districtName = null;
  
  if (provinceCode) {
    const province = await prisma.province.findUnique({
      where: { code: provinceCode }
    });
    provinceName = province?.name || null;
  }
  
  if (districtCode) {
    const district = await prisma.district.findUnique({
      where: { code: districtCode }
    });
    districtName = district?.name || null;
  }
  
  return { provinceName, districtName };
}
```

### Step 7: Update User Service
- **File:** `src/services/user.service.ts`
- **Action:** Cập nhật `createUser()` và `updateUser()` để xử lý province/district

Logic xử lý:
1. Nếu có `provinceCode` → query Province table → lấy `provinceName`
2. Nếu có `districtCode` → query District table → lấy `districtName`
3. Lưu cả code và name vào database (denormalized)

### Step 8: Update Controllers (nếu cần)
- Kiểm tra và cập nhật `src/controllers/auth.controller.ts`
- Kiểm tra và cập nhật `src/controllers/user.controller.ts`

### Step 9: Update i18n Translations
- **Files:** 
  - `src/locales/en/translation.json`
  - `src/locales/vi/translation.json`
- **Add keys:**
  - `user.province_not_found`
  - `user.district_not_found`

---

## 4. Files cần sửa

### Modified Files
```
prisma/
├── schema.prisma              # Thêm provinceCode, provinceName, districtCode, districtName
src/
├── models/
│   └── User.ts               # Cập nhật interfaces
├── dtos/
│   └── user.dto.ts           # Cập nhật Joi schemas
├── services/
│   ├── auth.service.ts       # Cập nhật register, getMe
│   └── user.service.ts       # Cập nhật createUser, updateUser
├── locales/
│   ├── en/translation.json   # Thêm translation keys
│   └── vi/translation.json
```

---

## 5. API Request/Response Examples

### Register with Province/District
```http
POST /api/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "fullName": "Nguyễn Văn A",
  "phone": "0901234567",
  "address": "123 Đường ABC",
  "provinceCode": "79",
  "districtCode": "760"
}
```

### Response - Get Me (with Province/District)
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "email": "user@example.com",
    "fullName": "Nguyễn Văn A",
    "phone": "0901234567",
    "address": "123 Đường ABC",
    "avatar": null,
    "role": "USER",
    "isActive": true,
    "provinceCode": "79",
    "provinceName": "Thành phố Hồ Chí Minh",
    "districtCode": "760",
    "districtName": "Quận 1",
    "createdAt": "2024-01-01T00:00:00Z",
    "updatedAt": "2024-01-01T00:00:00Z"
  },
  "message": "Lấy thông tin thành công"
}
```

### Update User with Province/District
```http
PUT /api/users/:id
Content-Type: application/json
Authorization: Bearer <token>

{
  "provinceCode": "01",
  "districtCode": "001"
}
```

---

## 6. Business Logic

### Khi tạo/cập nhật User:

```typescript
// Pseudo code
async function updateUser(userId: string, data: UpdateUserData) {
  const updateData: any = { ...data };
  
  // Nếu có provinceCode, lookup provinceName
  if (data.provinceCode !== undefined) {
    if (data.provinceCode) {
      const province = await prisma.province.findUnique({
        where: { code: data.provinceCode }
      });
      if (!province) throw new Error('PROVINCE_NOT_FOUND');
      updateData.provinceName = province.name;
    } else {
      updateData.provinceName = null;
    }
  }
  
  // Nếu có districtCode, lookup districtName
  if (data.districtCode !== undefined) {
    if (data.districtCode) {
      const district = await prisma.district.findUnique({
        where: { code: data.districtCode }
      });
      if (!district) throw new Error('DISTRICT_NOT_FOUND');
      updateData.districtName = district.name;
    } else {
      updateData.districtName = null;
    }
  }
  
  return await prisma.user.update({
    where: { id: userId },
    data: updateData
  });
}
```

### Validation Rules:
1. `provinceCode` và `districtCode` là optional
2. Nếu có `provinceCode`, phải tồn tại trong bảng Province
3. Nếu có `districtCode`, phải tồn tại trong bảng District
4. `districtCode` nên thuộc về `provinceCode` (có thể bỏ qua nếu FE tự validate)

---

## 7. Commands Summary

```bash
# 1. Update schema and create migration
npm run prisma:migrate:dev -- --name add_province_district_to_user

# 2. Generate Prisma client
npm run prisma:generate

# 3. Run dev server to test
npm run dev
```

---

## 8. Migration Rollback (nếu cần)

```bash
# Nếu migration chưa deploy, có thể rollback
npx prisma migrate resolve --rolled-back add_province_district_to_user
```

---

## 9. Testing Checklist

- [ ] Register user với provinceCode, districtCode
- [ ] Register user không có provinceCode, districtCode (backward compatible)
- [ ] Get me trả về đầy đủ province/district info
- [ ] Update user provinceCode → tự động cập nhật provinceName
- [ ] Update user districtCode → tự động cập nhật districtName
- [ ] Update user với provinceCode không tồn tại → báo lỗi
- [ ] Update user với districtCode không tồn tại → báo lỗi
- [ ] Admin tạo user mới với province/district

---

## 10. Notes

- Schema sử dụng **denormalization** (lưu cả code và name) để:
  - Tránh join query khi lấy thông tin user
  - Hiển thị nhanh tên tỉnh/thành mà không cần query thêm
  - Dữ liệu tỉnh/thành ít thay đổi nên không lo inconsistent

- Nếu Province/District data thay đổi (rất hiếm), cần script để sync lại:
  ```typescript
  // Script để update provinceName/districtName nếu cần
  await prisma.$executeRaw`
    UPDATE "User" u
    SET "provinceName" = p.name
    FROM "Province" p
    WHERE u."provinceCode" = p.code
  `;
  ```
