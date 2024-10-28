-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Telefonos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `unidad` VARCHAR(191) NOT NULL,
    `ip` VARCHAR(191) NULL,
    `rack` VARCHAR(191) NULL,
    `boca` VARCHAR(191) NULL,
    `anterior` VARCHAR(191) NULL,
    `estado` ENUM('ACTIVO', 'INACTIVO') NOT NULL DEFAULT 'INACTIVO',
    `piso` INTEGER NOT NULL,
    `area` VARCHAR(191) NOT NULL,
    `usuario` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Telefonos_ip_key`(`ip`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Internos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ue` INTEGER NOT NULL,
    `lugar` INTEGER NOT NULL,
    `ter` INTEGER NOT NULL,
    `telefonoId` INTEGER NOT NULL,

    UNIQUE INDEX `Internos_telefonoId_key`(`telefonoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Internos` ADD CONSTRAINT `Internos_telefonoId_fkey` FOREIGN KEY (`telefonoId`) REFERENCES `Telefonos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
