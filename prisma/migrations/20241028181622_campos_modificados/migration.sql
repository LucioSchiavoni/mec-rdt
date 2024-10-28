/*
  Warnings:

  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `User_name_key` ON `User`;

-- AlterTable
ALTER TABLE `Internos` MODIFY `ue` INTEGER NULL,
    MODIFY `lugar` INTEGER NULL,
    MODIFY `ter` INTEGER NULL;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `name`,
    ADD COLUMN `username` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `User_username_key` ON `User`(`username`);
