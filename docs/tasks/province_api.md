# API List Province Vietnam - Planning

## 1. Yêu cầu (Requirements)

### Mô tả
Xây dựng API để lấy danh sách các Tỉnh/Thành phố ở Việt Nam, hỗ trợ:
- Liệt kê tất cả 63 tỉnh thành
- Tìm kiếm theo tên
- Lấy chi tiết một tỉnh/thành phố
- Lấy danh sách quận/huyện thuộc tỉnh

### API Endpoints
| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/api/provinces` | Lấy danh sách tất cả tỉnh/thành phố |
| GET | `/api/provinces?search=Hà Nội` | Tìm kiếm tỉnh/thành phố theo tên |
| GET | `/api/provinces/:code` | Lấy chi tiết một tỉnh/thành phố theo mã |
| GET | `/api/provinces/:code/districts` | Lấy danh sách quận/huyện thuộc tỉnh |

### Response Format
```typescript
{
  success: boolean;
  data: Province[] | Province | District[];
  message: string;
}
```

---

## 2. Data Source

### Quyết định: **Option B** - Lưu trong Database

**Cách làm:** 
- Tạo bảng `Province` và `District` trong Prisma schema
- Seed data 63 tỉnh thành + quận/huyện vào database
- Service sử dụng Prisma Client để query

**Pros:**
- Linh hoạt, dễ mở rộng thêm metadata (population, area, v.v.)
- Có thể thêm quan hệ Province ↔ District
- Dễ dàng cập nhật nếu có thay đổi
- Chuẩn hóa với architecture hiện tại (các entity khác đều lưu DB)

**Cons:**
- Cần migration và seed data
- Query DB thay vì đọc từ memory

---

## 3. Database Schema

### Prisma Schema Changes

```prisma
model Province {
  code        String     @id @db.VarChar(10)
  name        String     @db.VarChar(100)
  nameShort   String     @db.VarChar(50)
  type        String     @db.VarChar(20)  // 'city' | 'province'
  region      String     @db.VarChar(20)  // 'north' | 'central' | 'south'
  createdAt   DateTime   @default(now())
  updatedAt   DateTime   @updatedAt
  
  districts   District[]
}

model District {
  code         String    @id @db.VarChar(10)
  name         String    @db.VarChar(100)
  type         String    @db.VarChar(20)  // 'district' | 'city' | 'town'
  provinceCode String    @db.VarChar(10)
  createdAt    DateTime  @default(now())
  updatedAt    DateTime  @updatedAt
  
  province     Province  @relation(fields: [provinceCode], references: [code], onDelete: Cascade)
  
  @@index([provinceCode])
}
```

---

## 4. Implementation Steps

### Step 1: Update Prisma Schema
- **File:** `prisma/schema.prisma`
- **Action:** Thêm models `Province` và `District`

### Step 2: Create Migration
```bash
npm run prisma:migrate:dev -- --name add_province_district
```

### Step 3: Create Seed Data
- **File:** `prisma/data/provinces.ts` - Chứa data 63 tỉnh thành
- **File:** `prisma/data/districts.ts` - Chứa data quận/huyện

### Step 4: Update Seed Script
- **File:** `prisma/seed.ts`
- **Action:** Thêm logic seed Province và District

### Step 5: Run Seed
```bash
npm run prisma:seed
```

### Step 6: Create TypeScript Interface
- **File:** `src/models/province.model.ts`
- **Content:** Định nghĩa interface `Province`, `District`

### Step 7: Create DTO
- **File:** `src/dtos/province.dto.ts`
- **Content:** Joi schema cho query params (search, pagination)

### Step 8: Create Service
- **File:** `src/services/province.service.ts`
- **Methods:**
  - `getAllProvinces(search?: string): Promise<Province[]>`
  - `getProvinceByCode(code: string): Promise<Province | null>`
  - `getDistrictsByProvinceCode(code: string): Promise<District[]>`

### Step 9: Create Controller
- **File:** `src/controllers/province.controller.ts`
- **Handlers:**
  - `getProvincesHandler`
  - `getProvinceByCodeHandler`
  - `getDistrictsHandler`

### Step 10: Create Routes
- **File:** `src/routes/province.router.ts`
- **Routes:**
  - `GET /` → getProvincesHandler
  - `GET /:code` → getProvinceByCodeHandler
  - `GET /:code/districts` → getDistrictsHandler

### Step 11: Register Routes
- **File:** `src/index.ts`
- **Add:** `app.use('/api/provinces', provinceRouter)`

### Step 12: Add i18n Translations
- **Files:** 
  - `src/locales/en/translation.json`
  - `src/locales/vi/translation.json`
- **Keys:**
  - `province.not_found`
  - `province.list_success`

---

## 5. Files cần tạo/sửa

### New Files
```
prisma/
├── data/
│   ├── provinces.ts          # Data 63 tỉnh thành
│   └── districts.ts          # Data quận/huyện
src/
├── models/
│   └── province.model.ts     # TypeScript interfaces
├── dtos/
│   └── province.dto.ts       # Joi validation schemas
├── services/
│   └── province.service.ts   # Business logic
├── controllers/
│   └── province.controller.ts # HTTP handlers
└── routes/
    └── province.router.ts    # Route definitions
```

### Modified Files
```
prisma/
├── schema.prisma             # Add Province, District models
└── seed.ts                   # Add seed logic
src/
├── index.ts                  # Register province routes
├── locales/en/translation.json
└── locales/vi/translation.json
```

---

## 6. Sample Data Structure

### Province Data (prisma/data/provinces.ts)
```typescript
export const PROVINCES_DATA = [
  {
    code: '01',
    name: 'Thành phố Hà Nội',
    nameShort: 'Hà Nội',
    type: 'city',
    region: 'north'
  },
  {
    code: '79',
    name: 'Thành phố Hồ Chí Minh',
    nameShort: 'Hồ Chí Minh',
    type: 'city',
    region: 'south'
  },
  // ... 61 tỉnh còn lại
];
```

### District Data (prisma/data/districts.ts)
```typescript
export const DISTRICTS_DATA = [
  {
    code: '001',
    name: 'Quận Ba Đình',
    type: 'district',
    provinceCode: '01'
  },
  // ... các quận/huyện khác
];
```

---

## 7. API Response Examples

### GET /api/provinces
```json
{
  "success": true,
  "data": [
    {
      "code": "01",
      "name": "Thành phố Hà Nội",
      "nameShort": "Hà Nội",
      "type": "city",
      "region": "north"
    }
  ],
  "message": "Lấy danh sách tỉnh thành thành công"
}
```

### GET /api/provinces/01
```json
{
  "success": true,
  "data": {
    "code": "01",
    "name": "Thành phố Hà Nội",
    "nameShort": "Hà Nội",
    "type": "city",
    "region": "north"
  },
  "message": "Lấy thông tin tỉnh thành thành công"
}
```

### GET /api/provinces/01/districts
```json
{
  "success": true,
  "data": [
    {
      "code": "001",
      "name": "Quận Ba Đình",
      "type": "district",
      "provinceCode": "01"
    }
  ],
  "message": "Lấy danh sách quận huyện thành công"
}
```

### GET /api/provinces/999 (Not Found)
```json
{
  "success": false,
  "data": null,
  "message": "Không tìm thấy tỉnh thành"
}
```

---

## 8. Commands Summary

```bash
# 1. Update schema and create migration
npm run prisma:migrate:dev -- --name add_province_district

# 2. Generate Prisma client
npm run prisma:generate

# 3. Seed data
npm run prisma:seed

# 4. Run dev server
npm run dev
```

---

## 9. Docker Production - Seed Data Solutions

Khi deploy lên VPS sử dụng Docker, có 3 giải pháp để seed data:

### ✅ Solution 1: Entrypoint Script (Khuyến nghị)
Tự động seed mỗi khi container khởi động (idempotent - chạy nhiều lần không sao)

**Tạo file `docker-entrypoint.sh`:**
```bash
#!/bin/sh
set -e

echo "⏳ Waiting for database..."
# Đợi database sẵn sàng (nếu cần)
sleep 5

echo "🚀 Running migrations..."
npx prisma migrate deploy

echo "🌱 Seeding data..."
npx prisma db seed || true  # Bỏ qua lỗi nếu data đã tồn tại

echo "✅ Starting application..."
exec "$@"
```

**Update `Dockerfile`:**
```dockerfile
# ... existing code ...

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "dist/index.js"]
```

**Update `docker-compose.yml`:**
```yaml
services:
  mtf-crm-api:
    build: .
    environment:
      - DATABASE_URL=postgresql://postgresql:123456@mtf-crm-database:5432/db
    depends_on:
      - mtf-crm-database
    # Entrypoint sẽ tự động chạy migration và seed
```

---

### ✅ Solution 2: Init Container (Best Practice)
Tách riêng việc seed vào một container chạy một lần duy nhất

**Update `docker-compose.yml`:**
```yaml
services:
  # ... database service ...

  mtf-crm-seed:
    build: .
    command: >
      sh -c "npx prisma migrate deploy &&
             echo 'Starting seed...' &&
             npx prisma db seed &&
             echo 'Seed completed!'"
    environment:
      - DATABASE_URL=postgresql://postgresql:123456@mtf-crm-database:5432/db
    depends_on:
      - mtf-crm-database
    profiles: ["seed"]  # Chỉ chạy khi gọi explicitly

  mtf-crm-api:
    build: .
    environment:
      - DATABASE_URL=postgresql://postgresql:123456@mtf-crm-database:5432/db
    depends_on:
      - mtf-crm-database
      - mtf-crm-seed
    ports:
      - "5000:5000"
```

**Chạy seed:**
```bash
# Chỉ chạy seed container
docker-compose --profile seed up mtf-crm-seed

# Sau đó chạy app
docker-compose up -d mtf-crm-api
```

---

### ✅ Solution 3: Manual Seed (Simplest)
SSH vào VPS và chạy lệnh seed thủ công sau khi deploy

**Script `scripts/seed.sh`:**
```bash
#!/bin/bash
set -e

echo "🌱 Seeding database..."
docker exec mtf-crm-api npx prisma db seed
echo "✅ Seed completed!"
```

**Cách dùng:**
```bash
# 1. Deploy app
docker-compose up -d

# 2. Đợi database ready (khoảng 10-20s)
sleep 15

# 3. Chạy migrate
docker exec mtf-crm-api npx prisma migrate deploy

# 4. Seed data
docker exec mtf-crm-api npx prisma db seed
```

---

### 🔥 Recommendation

| Giải pháp | Khi nào dùng | Ưu điểm | Nhược điểm |
|-----------|-------------|---------|------------|
| **Entrypoint Script** | Production thường xuyên deploy | Tự động, không cần can thiệp tay | Seed chạy mỗi restart |
| **Init Container** | Production, CI/CD pipeline | Tách biệt, rõ ràng | Phức tạp hơn |
| **Manual Seed** | Development, lần deploy đầu | Đơn giản, kiểm soát tốt | Phải làm tay |

**Lời khuyên:** Dùng **Solution 1 (Entrypoint)** cho production vì:
- Tự động hoàn toàn
- Idempotent (chạy nhiều lần không lỗi do `skipDuplicates`)
- Không cần can thiệp thủ công khi restart container

---

## 10. Notes

- Sử dụng HTTP Status Code: `200 OK` cho success, `404 NOT_FOUND` khi không tìm thấy
- Không cần authentication cho API này (public API)
- Province.code và District.code là String (theo chuẩn mã Tổng cục Thống kê VN)
- Quan hệ: Province 1-N District (Cascade Delete)
- Có thể thêm caching sau nếu cần optimize
