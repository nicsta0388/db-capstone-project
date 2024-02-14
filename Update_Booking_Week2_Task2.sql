CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN BookingID INT, IN BookingDate DATE)
BEGIN
UPDATE booking SET BookingDate = BookingDate WHERE BookingID = BookingID; 
SELECT CONCAT("Booking", bookingID, "updated") AS "Confirmation";
END