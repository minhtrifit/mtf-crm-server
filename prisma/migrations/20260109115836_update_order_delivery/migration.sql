-- CreateEnum
CREATE TYPE "DeliveryStatus" AS ENUM ('ORDERED', 'CONFIRMED', 'PREPARING', 'SHIPPING', 'DELIVERED');

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "deliveryStatus" "DeliveryStatus" NOT NULL DEFAULT 'ORDERED';
