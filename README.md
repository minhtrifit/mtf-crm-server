# MTF CRM SERVER DOCUMENTATION

<img src="https://img.shields.io/github/stars/minhtrifit/mtf-crm-server"/> ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/minhtrifit/mtf-crm-server)

# 📋 Table of Contents

1. [Required & Technical Stack](#required-technical-stack)
2. [Config](#config)
3. [Installation](#installation)
4. [Migrate database](#migrate-database)
5. [API List](#api-list)

## 💻 Required & Technical Stack <a name="required-technical-stack"></a>

- Node version: >18.x (recommend 24.22.1)
- [Express.js](https://expressjs.com)
- [ProgreSQL](https://www.postgresql.org)
- [Prisma](https://www.prisma.io)

## ⚙️ Config .env file <a name="config"></a>

- Config [.env]() file in root dir with path `./.env`
- Project use [Prisma](https://www.prisma.io/docs/getting-started) as ORM

- ADMIN_CODE: (optional) use for create admin account (**MUST MATCH** with **VITE_ADMIN_CODE** in client .env)

```bash
BASE_URL=http://localhost:5000
PORT=5000
NODE_ENV=development
CLIENT_URL=http://localhost:3000
CLIENT_CHECKOUT_RETURN_PATHNAME=thanh-toan?step=3
JWT_SECRET=mtf_crm_server
JWT_EXPIRES_IN=1y
ADMIN_CODE=abc123
MAX_UPLOAD_FILES=7
DATABASE_URL=postgresql://postgresql:123456@localhost:5432/mtf_crm_db

# VNPay config
VNP_TMNCODE=3R8DRRZ6
VNP_HASHSECRET=3SU4FHTN79BFVT46CN7M8OIHYKHK4A9K
VNP_RETURN_URL=http://localhost:5000/api/order/result/vnpay
```

## 📦 Installation <a name="installation"></a>

⛓️‍💥 Intall packages & dependencies

```console
npm install
```

💽 Run **DEVELOPMENT** mode (need to install packages & dependencies first)

```console
npm run prisma:generate
npm run prisma:migrate:dev
npm run dev
```

💽 Run **PRODUCTION** mode (need to install packages & dependencies first)

```console
npm run prod
```

✅ Check **ESLint**

```console
npm run lint
```

🛠️ Fix **ESLint**

```console
npm run lint:fix
```

✅ Check **Prettier**

```console
npm run prettier
```

🛠️ Fix **Prettier**

```console
npm run prettier:fix
```

⛃ Create **Prisma** migration

```console
npm run prisma:migrate:dev
```

⟲ Reset **Prisma** database

```console
npm run prisma:reset
```

🌱 Seed **Prisma** database

```console
npm run prisma:seed
```

## 🐳 Run with Docker <a name="docker"></a>

Buid & run app with **production** mode

```console
docker-compose up -d --build
```

## 📦 Migrate Database <a name="migrate-database"></a>

### Run database with Docker

Export Data only (Run with Window Terminal), **run case by case**

```console
docker exec postgres_container pg_dump -U postgresql --data-only --encoding=UTF8 mtf_crm_db -f /tmp/data.sql

docker cp postgres_container:/tmp/data.sql data.sql
```

Import data (change **your_database_name**)

```console
cmd /c "docker exec -i postgres_container psql -U postgresql -d your_database_name < data.sql"
```

Import data (**production** version)

```console
cmd /c "docker exec -i mtf-crm-database psql -U postgresql -d db < data.sql"
```

Copy uploads folder from container -> source (**production** version)

```console
cmd /c "docker cp mtf-crm-api:/app/uploads/. ./uploads"
```

## 📝 API List<a name="api-list"></a>

### Global Request Header

| Key               | Value                          | Required |
| ----------------- | ------------------------------ | -------- |
| `Accept-Language` | `vi` or `en` (default is `vi`) | ❌       |

> **User**

- Get user list

`[GET]`: `http://localhost:5000/api/users`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Query Parameters

| Query      | Type    | Required | Description                                  |
| ---------- | ------- | -------- | -------------------------------------------- |
| `page`     | number  | ❌       | Current page (default: `1`)                  |
| `limit`    | number  | ❌       | Items per page (default: `10`, max: `100`)   |
| `q`        | string  | ❌       | Search by `email` or `fullName`              |
| `isActive` | boolean | ❌       | Filter by isActive status (`true` / `false`) |

- Get user by id

`[GET]`: `http://localhost:5000/api/users/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

- Create new user

`[POST]`: `http://localhost:5000/api/users`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type              | Required |
| ---------- | ----------------- | -------- |
| `email`    | string            | ✅       |
| `fullName` | string            | ✅       |
| `password` | string            | ✅       |
| `phone`    | string            | ❌       |
| `address`  | string            | ❌       |
| `role`     | `ADMIN` or `USER` | ❌       |

```json
{
  "email": "tri@example.com",
  "fullName": "minhtrifit",
  "password": "123456",
  "phone": "123456789",
  "address": "HCM",
  "role": "USER" | "ADMIN"
}
```

- Update user

`[PATCH]`: `http://localhost:5000/api/users/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type              | Required |
| ---------- | ----------------- | -------- |
| `email`    | string            | ❌       |
| `fullName` | string            | ❌       |
| `phone`    | string            | ❌       |
| `address`  | string            | ❌       |
| `role`     | `ADMIN` or `USER` | ❌       |

```json
{
  "email": "tri@example.com",
  "fullName": "minhtrifit",
  "phone": "123456789",
  "address": "HCM",
  "role": "USER" | "ADMIN"
}
```

> **Auth**

- Register

`[POST]`: `http://localhost:5000/api/auth/register`

### Request Body

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `email`    | string | ✅       |
| `fullName` | string | ✅       |
| `password` | string | ✅       |

```json
{
  "email": "tri@example.com",
  "fullName": "minhtrifit",
  "password": "123456"
}
```

- Login

`[POST]`: `http://localhost:5000/api/auth/login`

### Request Body

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `email`    | string | ✅       |
| `password` | string | ✅       |

```json
{
  "email": "tri@example.com",
  "password": "123456"
}
```

> **Upload**

- Single upload

`[POST]`: `http://localhost:5000/api/upload/single`

### Request Header

| Key             | Type                | Required |
| --------------- | ------------------- | -------- |
| `Content-Type`  | multipart/form-data | ✅       |
| `Authorization` | Bearer token-value  | ✅       |

### Request Body (form-data)

| Query  | Type | Required |
| ------ | ---- | -------- |
| `file` | File | ✅       |
| `name` | Text | ❌       |

- Multiple upload

`[POST]`: `http://localhost:5000/api/upload/multiple`

### Request Header

| Key             | Type                | Required |
| --------------- | ------------------- | -------- |
| `Content-Type`  | multipart/form-data | ✅       |
| `Authorization` | Bearer token-value  | ✅       |

### Request Body (form-data)

| Query   | Type | Required |
| ------- | ---- | -------- |
| `files` | File | ✅       |
| `name`  | Text | ❌       |

> **Category**

- Get categories list

`[GET]`: `http://localhost:5000/api/category`

### Query Parameters

| Query      | Type    | Required | Description                                  |
| ---------- | ------- | -------- | -------------------------------------------- |
| `page`     | number  | ❌       | Current page (default: `1`)                  |
| `limit`    | number  | ❌       | Items per page (default: `10`, max: `100`)   |
| `q`        | string  | ❌       | Search by `name`                             |
| `isActive` | boolean | ❌       | Filter by isActive status (`true` / `false`) |

- Get category by id

`[GET]`: `http://localhost:5000/api/category/:id`

- Create new category

`[POST]`: `http://localhost:5000/api/category`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `name`     | string | ✅       |
| `slug`     | string | ✅       |
| `imageUrl` | string | ✅       |

```json
{
  "name": "Category 1",
  "slug": "category-1",
  "imageUrl": "http://localhost:5000/uploads/1767696821488-255593947.jpg"
}
```

- Update category

`[PATCH]`: `http://localhost:5000/api/category/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type    | Required |
| ---------- | ------- | -------- |
| `name`     | string  | ❌       |
| `slug`     | string  | ❌       |
| `imageUrl` | string  | ❌       |
| `isActive` | boolean | ❌       |

```json
{
  "name": "Category 1",
  "slug": "category-1",
  "imageUrl": "http://localhost:5000/uploads/1767696821488-255593947.jpg",
  "isActive": false
}
```

> **Product**

- Get product list

`[GET]`: `http://localhost:5000/api/product`

### Query Parameters

| Query          | Type   | Required | Description                                |
| -------------- | ------ | -------- | ------------------------------------------ |
| `page`         | number | ❌       | Current page (default: `1`)                |
| `limit`        | number | ❌       | Items per page (default: `10`, max: `100`) |
| `q`            | string | ❌       | Search by `name` or `slug` or `sku`        |
| `categoryId`   | string | ❌       | Search by `Category ID`                    |
| `categorySlug` | string | ❌       | Search by `Category Slug`                  |

- Get product by id

`[GET]`: `http://localhost:5000/api/product/:id`

- Create new product

`[POST]`: `http://localhost:5000/api/product`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query         | Type     | Required |
| ------------- | -------- | -------- |
| `name`        | string   | ✅       |
| `slug`        | string   | ✅       |
| `sku`         | string   | ✅       |
| `price`       | number   | ✅       |
| `imagesUrl`   | string[] | ✅       |
| `description` | string   | ✅       |
| `isActive`    | boolean  | ✅       |
| `categoryId`  | string   | ✅       |

```json
{
  "name": "Sản phẩm 1",
  "slug": "san-pham-1",
  "sku": "product-1",
  "price": 350000,
  "imagesUrl": ["http://localhost:5000/uploads/1767709707010-368704716.jpeg"],
  "description": "t-shirt black",
  "isActive": true,
  "categoryId": "c529266e-7706-4809-b784-cfcb81596e20"
}
```

- Update product

`[PATCH]`: `http://localhost:5000/api/product/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query         | Type     | Required |
| ------------- | -------- | -------- |
| `name`        | string   | ❌       |
| `slug`        | string   | ❌       |
| `sku`         | string   | ❌       |
| `price`       | number   | ❌       |
| `imagesUrl`   | string[] | ❌       |
| `description` | string   | ❌       |
| `isActive`    | boolean  | ❌       |
| `categoryId`  | string   | ❌       |

```json
{
  "name": "Sản phẩm 1",
  "slug": "san-pham-1",
  "sku": "product-1",
  "price": 125000,
  "imagesUrl": ["http://localhost:5000/uploads/1767709707010-368704716.jpeg"],
  "description": "t-shirt black",
  "isActive": true,
  "categoryId": "c529266e-7706-4809-b784-cfcb81596e20"
}
```

> **Order**

- Get order by id

`[GET]`: `http://localhost:5000/api/order/detail/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

- Create new COD order

`[POST]`: `http://localhost:5000/api/order/create-cod-order`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query             | Type         | Required |
| ----------------- | ------------ | -------- |
| `userId`          | string       | ✅       |
| `deliveryAddress` | string       | ✅       |
| `note`            | string       | ❌       |
| `items`           | array object | ✅       |
| `items.productId` | string       | ✅       |
| `items.quantity`  | number       | ✅       |

```json
{
  "userId": "d14480c0-ed03-4e5d-86a1-53072605e78b",
  "deliveryAddress": "Hồ Chí Minh",
  "note": "Giao hàng giờ hành chính",
  "items": [
    {
      "productId": "06cc137f-7691-433b-b818-2715ada2ea77",
      "quantity": 2
    },
    {
      "productId": "2b8ca681-9d91-42e3-9d78-7ec34c414145",
      "quantity": 1
    }
  ]
}
```

- Create new VNPAY order

`[POST]`: `http://localhost:5000/api/order/create-vnpay-order`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query             | Type         | Required |
| ----------------- | ------------ | -------- |
| `userId`          | string       | ✅       |
| `deliveryAddress` | string       | ✅       |
| `note`            | string       | ❌       |
| `items`           | array object | ✅       |
| `items.productId` | string       | ✅       |
| `items.quantity`  | number       | ✅       |

```json
{
  "userId": "d14480c0-ed03-4e5d-86a1-53072605e78b",
  "deliveryAddress": "Hồ Chí Minh",
  "note": "Giao hàng giờ hành chính",
  "items": [
    {
      "productId": "06cc137f-7691-433b-b818-2715ada2ea77",
      "quantity": 2
    },
    {
      "productId": "2b8ca681-9d91-42e3-9d78-7ec34c414145",
      "quantity": 1
    }
  ]
}
```

- Update order

`[PATCH]`: `http://localhost:5000/api/order/update-order/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query             | Type                                                                 | Required |
| ----------------- | -------------------------------------------------------------------- | -------- |
| `note`            | string                                                               | ❌       |
| `deliveryAddress` | string                                                               | ❌       |
| `status`          | `PENDING` or `PAID` or `CANCELLED`                                   | ❌       |
| `deliveryStatus`  | `ORDERED` or `CONFIRMED` or `PREPARING` or `SHIPPING` or `DELIVERED` | ❌       |

```json
{
  "note": "Giao buổi sáng",
  "deliveryAddress": "HN",
  "status": "PENDING",
  "deliveryStatus": "ORDERED"
}
```
