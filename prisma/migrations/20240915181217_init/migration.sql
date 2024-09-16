/*
  Warnings:

  - The primary key for the `blog` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `name` on the `blog` table. All the data in the column will be lost.
  - The `id` column on the `blog` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[slug]` on the table `blog` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `content` to the `blog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slug` to the `blog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `blog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `blog` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "blog" DROP CONSTRAINT "blog_pkey",
DROP COLUMN "name",
ADD COLUMN     "content" TEXT NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "featuredImage" TEXT,
ADD COLUMN     "published" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "slug" TEXT NOT NULL,
ADD COLUMN     "title" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "viewCount" INTEGER NOT NULL DEFAULT 0,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "blog_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Post";

-- CreateIndex
CREATE UNIQUE INDEX "blog_slug_key" ON "blog"("slug");
