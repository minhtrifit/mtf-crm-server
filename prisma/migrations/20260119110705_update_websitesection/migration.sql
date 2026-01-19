/*
  Warnings:

  - You are about to drop the `WebsiteCollection` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WebsiteCollectionItem` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "WebsiteCollection" DROP CONSTRAINT "WebsiteCollection_sectionId_fkey";

-- DropForeignKey
ALTER TABLE "WebsiteCollectionItem" DROP CONSTRAINT "WebsiteCollectionItem_collectionId_fkey";

-- DropForeignKey
ALTER TABLE "WebsiteCollectionItem" DROP CONSTRAINT "WebsiteCollectionItem_productId_fkey";

-- DropTable
DROP TABLE "WebsiteCollection";

-- DropTable
DROP TABLE "WebsiteCollectionItem";

-- CreateTable
CREATE TABLE "WebsiteSectionItem" (
    "id" TEXT NOT NULL,
    "sectionId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "WebsiteSectionItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "WebsiteSectionItem_sectionId_position_idx" ON "WebsiteSectionItem"("sectionId", "position");

-- CreateIndex
CREATE UNIQUE INDEX "WebsiteSectionItem_sectionId_productId_key" ON "WebsiteSectionItem"("sectionId", "productId");

-- AddForeignKey
ALTER TABLE "WebsiteSectionItem" ADD CONSTRAINT "WebsiteSectionItem_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "WebsiteSection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteSectionItem" ADD CONSTRAINT "WebsiteSectionItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
