/* Violet Server Database Create Tables SQL */
/* for MySQL(MariaDB) */

CREATE TABLE `viewtotal` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`ArticleId` INT(11) NULL DEFAULT NULL,
	`TimeStamp` TIMESTAMP NULL DEFAULT NULL,
	`UserAppId` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`Id`) USING BTREE,
	INDEX `AritcleId` (`ArticleId`) USING BTREE,
	FULLTEXT INDEX `UserAppId` (`UserAppId`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `article` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`TimeStamp` TIMESTAMP NULL DEFAULT NULL,
	`Author` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Comments` INT(10) UNSIGNED ZEROFILL NOT NULL,
	`Title` CHAR(50) NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`Body` VARCHAR(5000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Etc` VARCHAR(5000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Board` INT(11) NOT NULL,
	PRIMARY KEY (`Id`) USING BTREE,
	INDEX `Board` (`Board`) USING BTREE,
	CONSTRAINT `Board` FOREIGN KEY (`Board`) REFERENCES `violet`.`board` (`Id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `board` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`ShortName` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Description` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`Id`) USING BTREE,
	FULLTEXT INDEX `ShortName` (`ShortName`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `comment` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`ArticleId` INT(11) NOT NULL,
	`TimeStamp` TIMESTAMP NULL DEFAULT NULL,
	`Author` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`Body` VARCHAR(500) NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`Id`) USING BTREE,
	INDEX `ArticleId` (`ArticleId`) USING BTREE,
	CONSTRAINT `ArticleId` FOREIGN KEY (`ArticleId`) REFERENCES `violet`.`article` (`Id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

