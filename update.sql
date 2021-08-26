-- MySQL Script generated by MySQL Workbench
-- Wed Aug 25 18:43:16 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `report_palace`.`status_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `report_palace`.`status_report` (
  `state_report_id` INT NOT NULL AUTO_INCREMENT,
  `decription` VARCHAR(1024) NULL DEFAULT NULL,
  `status` VARCHAR(512) NOT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`state_report_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `report_palace`.`reports_created`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `report_palace`.`reports_created` (
  `report_created_id` NVARCHAR(36) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` TINYINT(1) NOT NULL DEFAULT '1',
  `state_report_id` INT NOT NULL,
  PRIMARY KEY (`report_created_id`, `state_report_id`),
  UNIQUE INDEX `report_created_id_UNIQUE` (`report_created_id` ASC) VISIBLE,
  INDEX `fk_reports_created_status_report_idx` (`state_report_id` ASC) VISIBLE,
  CONSTRAINT `fk_reports_created_status_report`
    FOREIGN KEY (`state_report_id`)
    REFERENCES `report_palace`.`status_report` (`state_report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `report_palace`.`report_bodies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `report_palace`.`report_bodies` (
  `report_body_id` NVARCHAR(36) NOT NULL,
  `report_created_id` NVARCHAR(36) NOT NULL,
  `subreport_identifier` NVARCHAR(36) NULL,
  PRIMARY KEY (`report_body_id`, `report_created_id`),
  UNIQUE INDEX `report_body_id_UNIQUE` (`report_body_id` ASC) VISIBLE,
  INDEX `fk_report_bodies_reports_created1_idx` (`report_created_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_bodies_reports_created1`
    FOREIGN KEY (`report_created_id`)
    REFERENCES `report_palace`.`reports_created` (`report_created_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
