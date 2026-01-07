# MTF CRM SERVER DOCUMENTATION

<img src="https://img.shields.io/github/stars/minhtrifit/mtf-crm-server"/> ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/minhtrifit/mtf-crm-server)

# 📋 Table of Contents

1. [Required & Technical Stack](#required-technical-stack)
2. [Config](#config)
3. [Installation](#installation)
4. [API List](#api-list)

## 💻 Required & Technical Stack <a name="required-technical-stack"></a>

- Node version: >18.x (recommend 24.12.0)
- [Express.js](https://expressjs.com)
- [ProgreSQL](https://www.postgresql.org)
- [Prisma](https://www.prisma.io)

## ⚙️ Config .env file <a name="config"></a>

- Config [.env]() file in root dir with path `./.env`
- Project use [Prisma](https://www.prisma.io/docs/getting-started) as ORM

```bash
PORT=5000
NODE_ENV=development
CLIENT_URL=http://localhost:3000
JWT_SECRET=mtf_crm_server
DATABASE_URL="postgresql://postgresql:123456@localhost:5432/mtf_crm_db"
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

## 📝 API List<a name="api-list"></a>

**User**

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
| `password` | string            | ❌       |
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

**Auth**

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

**Upload**

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

**Category**

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

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `name`     | string | ❌       |
| `slug`     | string | ❌       |
| `imageUrl` | string | ❌       |

```json
{
  "name": "Category 1",
  "slug": "category-1",
  "imageUrl": "http://localhost:5000/uploads/1767696821488-255593947.jpg"
}
```

**Customer**

- Get customer list

`[GET]`: `http://localhost:5000/api/customer`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Query Parameters

| Query   | Type   | Required | Description                                |
| ------- | ------ | -------- | ------------------------------------------ |
| `page`  | number | ❌       | Current page (default: `1`)                |
| `limit` | number | ❌       | Items per page (default: `10`, max: `100`) |
| `q`     | string | ❌       | Search by `email` or `fullName` or `phone` |

- Get customer by id

`[GET]`: `http://localhost:5000/api/customer/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

- Create new customer

`[POST]`: `http://localhost:5000/api/customer`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `email`    | string | ✅       |
| `fullName` | string | ✅       |
| `phone`    | string | ✅       |
| `address`  | string | ❌       |

```json
{
  "email": "tri@example.com",
  "fullName": "minhtrifit",
  "phone": "123456789",
  "address": "HCM"
}
```

- Update customer

`[PATCH]`: `http://localhost:5000/api/customer/:id`

### Request Header

| Key             | Type               | Required |
| --------------- | ------------------ | -------- |
| `Authorization` | Bearer token-value | ✅       |

### Request Body

| Query      | Type   | Required |
| ---------- | ------ | -------- |
| `email`    | string | ❌       |
| `fullName` | string | ❌       |
| `phone`    | string | ❌       |
| `address`  | string | ❌       |

```json
{
  "email": "tri@example.com",
  "fullName": "minhtrifit",
  "phone": "123456789",
  "address": "HCM"
}
```

**Product**

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
