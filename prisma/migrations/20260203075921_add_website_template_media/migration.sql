-- CreateEnum
CREATE TYPE "MediaType" AS ENUM ('FACEBOOK', 'INSTAGRAM', 'YOUTUBE', 'ZALO', 'TELEGRAM');

-- CreateTable
CREATE TABLE "WebsiteMedia" (
    "id" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "type" "MediaType" NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "WebsiteMedia_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "WebsiteMedia_templateId_idx" ON "WebsiteMedia"("templateId");

-- AddForeignKey
ALTER TABLE "WebsiteMedia" ADD CONSTRAINT "WebsiteMedia_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "WebsiteTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
