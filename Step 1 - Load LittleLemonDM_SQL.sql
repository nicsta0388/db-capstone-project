-- MySQL Script generated by MySQL Workbench
-- Sat Feb 17 14:14:44 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB` ;
-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Role` VARCHAR(100) NULL,
  `Address` VARCHAR(200) NULL,
  `Contact_Number` INT NULL,
  `Email` VARCHAR(100) NULL,
  `Annual_Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`))
  ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(200) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
  ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATETIME NULL,
   `TableNumber` INT NOT NULL,
  `CustomerID` INT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`BookingID`))
  ENGINE = InnoDB;
  -- INDEX `staff_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  -- INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  -- CONSTRAINT `staff_id_fk`
  --  FOREIGN KEY (`EmployeeID`)
  --  REFERENCES `LittleLemonDB`.`Employees` (`EmployeeID`)
  --  ON DELETE CASCADE
  --  ON UPDATE CASCADE,
  -- CONSTRAINT `customerid_fk`
  --  FOREIGN KEY (`CustomerID`)
  --  REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
  --  ON DELETE CASCADE
  --  ON UPDATE CASCADE)


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(100) NULL,
  `StarterName` VARCHAR(100) NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NULL,
  `Cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menuitem_id_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menuitems_id_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NULL,
  `CustomerID` INT NULL,
   `Quantity` INT NOT NULL,
  `TotalCost` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menuid_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

--------------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `little_lemon` ;
-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon` ;

-- -----------------------------------------------------
-- Table `little_lemon`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `little_lemon`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `little_lemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `staff_id_fk_idx2` (`StaffID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx2` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk2`
    FOREIGN KEY (`StaffID`)
    REFERENCES `little_lemon`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisines` VARCHAR(255) NULL,
  `Starters` VARCHAR(255) NULL,
  `Courses` VARCHAR(255) NULL,
  `Drinks` VARCHAR(255) NULL,
  `Desserts` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `StaffID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `staff_id_fk_idx3` (`StaffID` ASC) VISIBLE,
  INDEX `delivery_id_fk_idx3` (`DeliveryID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx3` (`MenuID` ASC) VISIBLE,
  INDEX `booking_id_fk_idx3` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk3`
    FOREIGN KEY (`StaffID`)
    REFERENCES `little_lemon`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_id_fk3`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `little_lemon`.`Delivery` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk3`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_id_fk3`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN AddBookingID INT, IN AddBookingDate DATE, IN AddTableNo INT, IN AddCustomerID INT, IN AddEmployeeNum INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, EmployeeID)
VALUES (AddBookingID, AddBookingDate, AddTableNo, AddCustomerID, AddEmployeeNum);
-- SELECT CONCAT("New Booking ID ", AddBookingID, " Added.") AS Confirmation;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN CancelID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = CancelID;
-- SELECT CONCAT("Order ",CancelID, " is cancelled.") AS Confirmation FROM Bookings;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
SELECT MAX(Quantity) AS "Max Quantity in Order"
FROM Orders

CREATE DEFINER=`root`@`localhost` PROCEDURE `MakeBooking`(booking_id INT, customer_id INT, table_no int, booking_date date)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) 
VALUES (booking_id, booking_date, table_no, customer_id);
SELECT "New booking added" AS "Confirmation";
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN UpdateID INT, IN TableNo INT)
UPDATE Bookings
SET TableNumber = TableNo
WHERE BookingID = UpdateID
