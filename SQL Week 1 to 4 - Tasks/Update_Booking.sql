CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN UpdateID INT, IN TableNo INT)
UPDATE Bookings
SET TableNumber = TableNo
WHERE BookingID = UpdateID