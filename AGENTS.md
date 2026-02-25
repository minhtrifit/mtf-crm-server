# MTF CRM Server - Agent Documentation

## Project Overview

MTF CRM Server is a Customer Relationship Management backend API built with Express.js and TypeScript. It provides a comprehensive e-commerce platform with user management, product catalog, order processing, payment integration (VNPay), and website template management.

### Technology Stack

- **Runtime**: Node.js (>18.x, recommend 24.12.0)
- **Framework**: Express.js 5.x
- **Language**: TypeScript 5.x (compiled to ES6)
- **Database**: PostgreSQL 15
- **ORM**: Prisma 7.x with Prisma Client
- **Real-time**: Socket.IO 4.x
- **Authentication**: JWT (jsonwebtoken) + bcryptjs
- **Validation**: Joi
- **File Upload**: Multer
- **Internationalization**: i18next with fs-backend
- **Logging**: Winston
- **Linting**: ESLint 9.x with TypeScript support
- **Formatting**: Prettier

### Project Structure

```
mtf-crm-server/
├── src/                          # Main source code
│   ├── configs/                  # Configuration files
│   │   ├── i18n.ts              # Internationalization config
│   │   ├── logger.ts            # Winston logger config
│   │   └── morgan.ts            # HTTP request logging
│   ├── constants/               # Constants
│   │   └── http-status-code.ts  # HTTP status codes enum
│   ├── controllers/             # Route controllers (handle HTTP requests)
│   ├── dtos/                    # Data Transfer Objects (Joi validation schemas)
│   ├── helpers/                 # Helper functions
│   ├── libs/                    # Core libraries
│   │   ├── auth.ts              # JWT & password utilities
│   │   └── prisma.ts            # Prisma client instance
│   ├── locales/                 # i18n translation files
│   │   ├── en/translation.json  # English translations
│   │   └── vi/translation.json  # Vietnamese translations
│   ├── middlewares/             # Express middlewares
│   │   ├── auth.ts              # Authentication & authorization
│   │   ├── errorHandler.ts      # Global error handler
│   │   ├── multer-error.middleware.ts
│   │   ├── upload.ts            # File upload middleware
│   │   ├── validate.middleware.ts      # Body validation
│   │   ├── validate-params.middleware.ts
│   │   └── validate-query.middleware.ts
│   ├── models/                  # TypeScript interfaces & types
│   ├── routes/                  # Express route definitions
│   ├── services/                # Business logic layer
│   ├── sockets/                 # Socket.IO event handlers
│   │   ├── index.ts             # Socket registration
│   │   ├── order.socket.ts      # Order-related socket events
│   │   └── socket.emitter.ts    # Socket emitter utility
│   ├── index.ts                 # Application entry point
│   └── type.d.ts               # Global TypeScript declarations
├── prisma/                      # Prisma ORM files
│   ├── schema.prisma           # Database schema definition
│   ├── migrations/             # Database migrations
│   └── seed.ts                 # Database seeding script
├── generated/                   # Prisma generated client (auto-generated)
├── uploads/                     # Uploaded files storage
├── logs/                        # Application logs
├── dist/                        # Compiled JavaScript output
├── docker-compose.yml           # Docker Compose configuration
├── Dockerfile                   # Docker image definition
├── prisma.config.ts            # Prisma configuration
├── tsconfig.json               # TypeScript configuration
├── eslint.config.mts           # ESLint configuration
├── nodemon.json                # Nodemon dev server config
└── .prettierrc                 # Prettier formatting rules
```

## Architecture Pattern

The project follows a **Layered Architecture** with clear separation of concerns:

1. **Routes Layer**: Defines API endpoints and middleware chain
2. **Controllers Layer**: Handles HTTP requests/responses
3. **Services Layer**: Contains business logic and database operations
4. **DTOs Layer**: Validates incoming data using Joi schemas
5. **Models Layer**: TypeScript interfaces for type safety
6. **Middlewares Layer**: Cross-cutting concerns (auth, validation, error handling)

### Request Flow

```
Client Request → Route → Middlewares (auth, validation) → Controller → Service → Prisma → Database
                                    ↓
Client Response ← JSON Response ← Controller ← Service Result
```

## Available Scripts

### Development Commands

```bash
# Run development server with hot reload (uses tsx)
npm run dev

# Build for production (compiles TypeScript to dist/)
npm run build

# Start production server (runs compiled JS from dist/)
npm run start

# Full production startup (generate + migrate + build + start)
npm run prod
```

### Code Quality Commands

```bash
# Check ESLint
npm run lint

# Fix ESLint issues
npm run lint:fix

# Check Prettier formatting
npm run prettier

# Fix Prettier formatting
npm run prettier:fix
```

### Database Commands

```bash
# Generate Prisma client
npm run prisma:generate

# Create development migration
npm run prisma:migrate:dev

# Deploy migrations (production)
npm run prisma:migrate:deploy

# Reset database (⚠️ destructive)
npm run prisma:reset

# Seed database with sample data
npm run prisma:seed
```

## Environment Configuration

Copy `.env.example` to `.env` and configure:

```bash
BASE_URL=http://localhost:5000
PORT=5000
NODE_ENV=development
CLIENT_URL=http://localhost:3000
CLIENT_CHECKOUT_RETURN_PATHNAME=thanh-toan?step=3
JWT_SECRET=your_jwt_secret_key
JWT_EXPIRES_IN=1y
ADMIN_CODE=your_admin_code
MAX_UPLOAD_FILES=7
DATABASE_URL=postgresql://user:password@localhost:5432/dbname

# VNPay payment gateway config
VNP_TMNCODE=your_vnpay_tmcode
VNP_HASHSECRET=your_vnpay_hashsecret
VNP_RETURN_URL=http://localhost:5000/api/order/result/vnpay
```

### Important Environment Variables

- `ADMIN_CODE`: Secret code for creating admin accounts (must match client-side `VITE_ADMIN_CODE`)
- `JWT_SECRET`: Secret key for JWT signing
- `DATABASE_URL`: PostgreSQL connection string
- `CLIENT_URL`: Frontend application URL (for CORS)

## Code Style Guidelines

### TypeScript Configuration

- **Module System**: CommonJS
- **Target**: ES6
- **Path Aliases**: `@/*` maps to `src/*`
- **Strict Mode**: Enabled
- **Global Types**: Defined in `src/type.d.ts`

### ESLint Rules

- Uses `@eslint/js`, `typescript-eslint`, and `prettier` plugins
- `@typescript-eslint/no-explicit-any`: Off (allowed)
- `@typescript-eslint/no-unused-vars`: Off (allowed)
- Ignored paths: `node_modules/`, `dist/`, `generated/`

### Prettier Configuration

```json
{
  "arrowParens": "always",
  "semi": true,
  "trailingComma": "none",
  "tabWidth": 2,
  "endOfLine": "auto",
  "useTabs": false,
  "singleQuote": true,
  "printWidth": 120,
  "jsxSingleQuote": true
}
```

### Naming Conventions

- **Files**: kebab-case (e.g., `user.router.ts`, `error-handler.ts`)
- **Classes/Interfaces**: PascalCase (e.g., `UserPayload`, `OrderStatus`)
- **Functions/Variables**: camelCase (e.g., `getUsers`, `userService`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `HTTP_STATUS`, `SALT_ROUNDS`)
- **Enum Values**: UPPER_SNAKE_CASE (e.g., `Role.ADMIN`, `OrderStatus.PENDING`)

## API Conventions

### Response Format

All API responses follow this structure:

```typescript
{
  success: boolean;      // true for success, false for error
  data: any | null;      // Response data or null
  message: string;       // Localized message using i18next
}
```

### HTTP Status Codes

Defined in `src/constants/http-status-code.ts`:

- `200 OK` - Success
- `201 CREATED` - Resource created
- `400 BAD_REQUEST` - Invalid input
- `401 UNAUTHORIZED` - Authentication required
- `403 FORBIDDEN` - No permission
- `404 NOT_FOUND` - Resource not found
- `500 INTERNAL_SERVER_ERROR` - Server error

### Authentication

- Uses JWT Bearer token in `Authorization` header
- Token format: `Bearer <token>`
- Protected routes use `authenticateHandler` middleware
- Role-based access control uses `authorizeHandler` middleware
- Admin-only routes use `authenticateAdminHandler` middleware (requires `ADMIN_CODE`)

### Internationalization (i18n)

- Default language: Vietnamese (`vi`)
- Supported languages: `vi`, `en`
- Language detection: `Accept-Language` header, query string `lang`, or cookie
- Translation files located in `src/locales/{lang}/translation.json`
- Access in controllers: `const { t } = req;` then `t('key.subkey')`

## Database Schema

### Main Entities

- **User**: User accounts with roles (ADMIN, USER)
- **Category**: Product categories
- **Product**: Products with SKU, pricing, stock
- **Order**: Customer orders with status tracking
- **OrderItem**: Items within an order
- **Payment**: Payment records (COD, VNPAY)
- **Review**: Product reviews with ratings
- **WebsiteTemplate**: Website configuration
- **WebsiteSection**: Template sections
- **WebsiteSectionItem**: Products in sections
- **Notification**: System notifications
- **Faq**: Frequently asked questions
- **Store**: Store locations
- **Policy**: Store policies
- **SearchKeyword**: Search analytics

### Enums

- `Role`: USER, ADMIN
- `OrderStatus`: PENDING, PAID, CANCELLED
- `DeliveryStatus`: ORDERED, CONFIRMED, PREPARING, SHIPPING, DELIVERED
- `PaymentMethod`: COD, VNPAY
- `NotificationType`: ORDER
- `MediaType`: FACEBOOK, INSTAGRAM, YOUTUBE, ZALO, TELEGRAM

## Docker Deployment

### Development with Docker

```bash
# Build and run with docker-compose (production mode)
docker-compose up -d --build
```

### Services

1. **mtf-crm-api** (Node.js application)
   - Port: 5000
   - Depends on postgres
   - Volume: `./uploads:/app/uploads`

2. **mtf-crm-database** (PostgreSQL 15)
   - User: `postgresql`
   - Password: `123456`
   - Database: `db`
   - Volume: `postgres_data`

### Database Operations

```bash
# Export data from container
docker exec mtf-crm-database pg_dump -U postgresql --data-only --encoding=UTF8 db -f /tmp/data.sql
docker cp mtf-crm-database:/tmp/data.sql data.sql

# Import data to container
cmd /c "docker exec -i mtf-crm-database psql -U postgresql -d db < data.sql"

# Copy uploads from container
cmd /c "docker cp mtf-crm-api:/app/uploads/. ./uploads"
```

## Security Considerations

### Authentication

- Passwords hashed with bcrypt (10 salt rounds)
- JWT tokens with configurable expiration
- Role-based access control (RBAC)
- Admin code verification for privileged operations

### File Upload

- Max upload files configurable via `MAX_UPLOAD_FILES` env var
- Files stored in `uploads/` directory
- Static file serving at `/uploads` endpoint

### CORS

- Configured for specific client origin (`CLIENT_URL`)
- Allowed methods: GET, POST, PUT, PATCH, DELETE
- Allowed headers: Content-Type, Authorization

### Environment Security

- Never commit `.env` files
- Use strong `JWT_SECRET` in production
- Protect `ADMIN_CODE` and VNPay credentials
- Database credentials should be rotated regularly

## Development Workflow

### Initial Setup

1. Install dependencies: `npm install`
2. Configure `.env` file
3. Generate Prisma client: `npm run prisma:generate`
4. Run migrations: `npm run prisma:migrate:dev`
5. (Optional) Seed database: `npm run prisma:seed`
6. Start dev server: `npm run dev`

### Adding New Features

1. Define model in `prisma/schema.prisma`
2. Run migration: `npm run prisma:migrate:dev`
3. Create/update TypeScript interfaces in `src/models/`
4. Create DTO validation schema in `src/dtos/`
5. Implement service logic in `src/services/`
6. Create controller in `src/controllers/`
7. Define routes in `src/routes/`
8. Add translations to `src/locales/{en,vi}/translation.json`
9. Register routes in `src/index.ts`

### Common Patterns

#### Service Error Handling

```typescript
export enum ServiceError {
  NOT_FOUND = 'NOT_FOUND',
  EXISTED = 'EXISTED'
}

// In service
throw new Error(ServiceError.NOT_FOUND);

// In controller
catch (error: any) {
  if (error.message === ServiceError.NOT_FOUND) {
    return res.status(HTTP_STATUS.NOT_FOUND).json({...});
  }
  next(error);
}
```

#### Route with Validation

```typescript
router.post(
  '/',
  authenticateHandler,           // Auth middleware
  validateBody(CreateSchema),    // Validation middleware
  createHandler                  // Controller
);
```

## Testing

Currently, the project does not include automated tests. When adding tests:

- Consider Jest or Vitest for unit testing
- Use Supertest for API integration testing
- Create a separate test database
- Mock Prisma client for unit tests

## Troubleshooting

### Common Issues

1. **Prisma Client not found**: Run `npm run prisma:generate`
2. **Database connection error**: Check `DATABASE_URL` in `.env`
3. **Type errors on build**: Ensure strict TypeScript compliance
4. **Upload failures**: Ensure `uploads/` directory exists and is writable

### Log Files

- `logs/error.log` - Error-level logs only
- `logs/combined.log` - All logs
- Console output includes colorized logs in development

## Useful Resources

- [Express.js Documentation](https://expressjs.com)
- [Prisma Documentation](https://www.prisma.io/docs)
- [Socket.IO Documentation](https://socket.io/docs)
- [TypeScript Documentation](https://www.typescriptlang.org/docs)
- [VNPay Integration Docs](https://sandbox.vnpayment.vn/apis)
