CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN AddBookingID INT, IN AddBookingDate DATE, IN AddTableNo INT, IN AddCustomerID INT, IN AddEmployeeNum INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, EmployeeID)
VALUES (AddBookingID, AddBookingDate, AddTableNo, AddCustomerID, AddEmployeeNum);
-- SELECT CONCAT("New Booking ID ", AddBookingID, " Added.") AS Confirmation;
END