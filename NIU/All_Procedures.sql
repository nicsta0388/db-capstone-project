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