-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Access`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Access` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Access` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Action` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Action` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`File`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`File` ;

CREATE TABLE IF NOT EXISTS `mydb`.`File` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `updated` TEXT NULL,
  `Access` INT NOT NULL,
  `Action` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_File_Access_idx` (`Access` ASC) VISIBLE,
  INDEX `fk_File_Action_idx` (`Action` ASC) VISIBLE,
  CONSTRAINT `fk_File_Access`
    FOREIGN KEY (`Access`)
    REFERENCES `mydb`.`Access` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_File_Action`
    FOREIGN KEY (`Action`)
    REFERENCES `mydb`.`Action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DataSet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DataSet` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DataSet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `updated` DATE NULL,
  `File` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DataSet_File_idx` (`File` ASC) VISIBLE,
  CONSTRAINT `fk_DataSet_File`
    FOREIGN KEY (`File`)
    REFERENCES `mydb`.`File` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `DataSet` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Section_DataSet_idx` (`DataSet` ASC) VISIBLE,
  CONSTRAINT `fk_Section_DataSet`
    FOREIGN KEY (`DataSet`)
    REFERENCES `mydb`.`DataSet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `Acces` INT NOT NULL,
  `Action` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Access_idx` (`Acces` ASC) VISIBLE,
  INDEX `fk_User_Action_idx` (`Action` ASC) VISIBLE,
  CONSTRAINT `fk_User_Access`
    FOREIGN KEY (`Acces`)
    REFERENCES `mydb`.`Access` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Action`
    FOREIGN KEY (`Action`)
    REFERENCES `mydb`.`Action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` TEXT NULL,
  `possibilities` TEXT NULL,
  `Access_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Access_id`),
  INDEX `fk_Role_Access_idx` (`Access_id` ASC) VISIBLE,
  CONSTRAINT `fk_Role_Access`
    FOREIGN KEY (`Access_id`)
    REFERENCES `mydb`.`Access` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Access`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Access` (`id`) VALUES (1);
INSERT INTO `mydb`.`Access` (`id`) VALUES (2);
INSERT INTO `mydb`.`Access` (`id`) VALUES (3);
INSERT INTO `mydb`.`Access` (`id`) VALUES (4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Action`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Action` (`id`, `title`, `description`) VALUES (DEFAULT, 'title1', 'desc1');
INSERT INTO `mydb`.`Action` (`id`, `title`, `description`) VALUES (DEFAULT, 'title2', 'desc2');
INSERT INTO `mydb`.`Action` (`id`, `title`, `description`) VALUES (DEFAULT, 'title3', 'desc3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`File`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`File` (`id`, `title`, `updated`, `Access`, `Action`) VALUES (DEFAULT, 'title1', '02/03/21', 1, 2);
INSERT INTO `mydb`.`File` (`id`, `title`, `updated`, `Access`, `Action`) VALUES (DEFAULT, 'title2', '02/03/22', 2, 3);
INSERT INTO `mydb`.`File` (`id`, `title`, `updated`, `Access`, `Action`) VALUES (DEFAULT, 'title3', '02/03/23', 3, 3);
INSERT INTO `mydb`.`File` (`id`, `title`, `updated`, `Access`, `Action`) VALUES (DEFAULT, 'title4', '02/03/24', 4, 2);
INSERT INTO `mydb`.`File` (`id`, `title`, `updated`, `Access`, `Action`) VALUES (DEFAULT, 'title5', '02/03/25', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`DataSet`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`DataSet` (`id`, `title`, `description`, `updated`, `File`) VALUES (DEFAULT, 'title1', 'desc1', '01/01/01', 1);
INSERT INTO `mydb`.`DataSet` (`id`, `title`, `description`, `updated`, `File`) VALUES (DEFAULT, 'title2', 'desc2', '01/01/02', 2);
INSERT INTO `mydb`.`DataSet` (`id`, `title`, `description`, `updated`, `File`) VALUES (DEFAULT, 'title3', 'desc3', '01/01/03', 3);
INSERT INTO `mydb`.`DataSet` (`id`, `title`, `description`, `updated`, `File`) VALUES (DEFAULT, 'title4', 'desc4', '01/01/04', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Section`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Section` (`id`, `title`, `description`, `DataSet`) VALUES (DEFAULT, 'title1', 'desc1', 1);
INSERT INTO `mydb`.`Section` (`id`, `title`, `description`, `DataSet`) VALUES (DEFAULT, 'title2', 'desc2', 2);
INSERT INTO `mydb`.`Section` (`id`, `title`, `description`, `DataSet`) VALUES (DEFAULT, 'title3', 'desc3', 3);
INSERT INTO `mydb`.`Section` (`id`, `title`, `description`, `DataSet`) VALUES (DEFAULT, 'title4', 'desc4', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser1', 'looser11', 1, 3);
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser2', 'looser12', 2, 3);
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser3', 'looser13', 2, 2);
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser4', 'looser14', 3, 2);
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser5', 'looser15', 4, 1);
INSERT INTO `mydb`.`User` (`id`, `nickname`, `password`, `Acces`, `Action`) VALUES (DEFAULT, 'looser6', 'looser16', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Role`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type1', 'possibility1', 1);
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type2', 'possibility2', 2);
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type3', 'possibility3', 2);
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type4', 'possibility4', 2);
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type5', 'possibility5', 1);
INSERT INTO `mydb`.`Role` (`id`, `type`, `possibilities`, `Access_id`) VALUES (DEFAULT, 'type6', 'possibility6', 4);

COMMIT;

