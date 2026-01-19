-- CreateTable
CREATE TABLE "WebsiteSection" (
    "id" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "title" TEXT,
    "position" INTEGER NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebsiteSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebsiteCollection" (
    "id" TEXT NOT NULL,
    "sectionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebsiteCollection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebsiteCollectionItem" (
    "id" TEXT NOT NULL,
    "collectionId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "WebsiteCollectionItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "WebsiteSection_templateId_position_idx" ON "WebsiteSection"("templateId", "position");

-- CreateIndex
CREATE UNIQUE INDEX "WebsiteCollection_sectionId_key" ON "WebsiteCollection"("sectionId");

-- CreateIndex
CREATE INDEX "WebsiteCollectionItem_collectionId_position_idx" ON "WebsiteCollectionItem"("collectionId", "position");

-- CreateIndex
CREATE UNIQUE INDEX "WebsiteCollectionItem_collectionId_productId_key" ON "WebsiteCollectionItem"("collectionId", "productId");

-- AddForeignKey
ALTER TABLE "WebsiteSection" ADD CONSTRAINT "WebsiteSection_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "WebsiteTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteCollection" ADD CONSTRAINT "WebsiteCollection_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "WebsiteSection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteCollectionItem" ADD CONSTRAINT "WebsiteCollectionItem_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "WebsiteCollection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebsiteCollectionItem" ADD CONSTRAINT "WebsiteCollectionItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
