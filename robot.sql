CREATE TABLE `Robot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`model` VARCHAR(255) NOT NULL,
	`version` DECIMAL NOT NULL,
	`status` INT NOT NULL,
	`resource` INT NOT NULL,
	`fabricName` VARCHAR(255) NOT NULL,
	`ipAdress` INT NOT NULL,
	`idGroup` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Shedule` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`idRobot` INT NOT NULL,
	`datetimeStart` DATETIME NOT NULL,
	`datetimeEnd` DATETIME NOT NULL,
	`idMode` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Mode` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nameMode` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`login` TEXT NOT NULL,
	`hash` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `GroupUsers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`idUser1` INT NOT NULL,
	`idUser2` INT NOT NULL,
	`idUser3` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ErrorsLog` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`dateTime` DATETIME NOT NULL,
	`idError` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ErrorsCatalog` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`comment`  NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `WorkLog` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`dateTime` DATETIME NOT NULL,
	`workTime` INT NOT NULL,
	`area` DECIMAL NOT NULL,
	`error` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `UsersLog` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`dateTime` DATETIME NOT NULL,
	`idGroup` INT NOT NULL,
	`idUser` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Shedule` ADD CONSTRAINT `Shedule_fk0` FOREIGN KEY (`idRobot`) REFERENCES `Robot`(`id`);

ALTER TABLE `Shedule` ADD CONSTRAINT `Shedule_fk1` FOREIGN KEY (`idMode`) REFERENCES `Mode`(`id`);

ALTER TABLE `GroupUsers` ADD CONSTRAINT `GroupUsers_fk0` FOREIGN KEY (`idUser1`) REFERENCES `User`(`id`);

ALTER TABLE `GroupUsers` ADD CONSTRAINT `GroupUsers_fk1` FOREIGN KEY (`idUser2`) REFERENCES `User`(`id`);

ALTER TABLE `GroupUsers` ADD CONSTRAINT `GroupUsers_fk2` FOREIGN KEY (`idUser3`) REFERENCES `User`(`id`);

ALTER TABLE `ErrorsLog` ADD CONSTRAINT `ErrorsLog_fk0` FOREIGN KEY (`idError`) REFERENCES `ErrorsCatalog`(`id`);

ALTER TABLE `WorkLog` ADD CONSTRAINT `WorkLog_fk0` FOREIGN KEY (`error`) REFERENCES `ErrorsCatalog`(`id`);

ALTER TABLE `UsersLog` ADD CONSTRAINT `UsersLog_fk0` FOREIGN KEY (`idGroup`) REFERENCES `GroupUsers`(`id`);

ALTER TABLE `UsersLog` ADD CONSTRAINT `UsersLog_fk1` FOREIGN KEY (`idUser`) REFERENCES `User`(`id`);










