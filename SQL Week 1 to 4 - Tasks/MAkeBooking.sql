CREATE DEFINER=`root`@`localhost` PROCEDURE `MakeBooking`(booking_id INT, customer_id INT, table_no int, booking_date date)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) 
VALUES (booking_id, booking_date, table_no, customer_id);
SELECT "New booking added" AS "Confirmation";
END