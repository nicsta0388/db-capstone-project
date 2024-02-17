CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN CancelID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = CancelID;
-- SELECT CONCAT("Order ",CancelID, " is cancelled.") AS Confirmation FROM Bookings;
END