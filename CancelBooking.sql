CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN bookingID_to_cancel INT)
BEGIN
    -- Delete the booking record
    DELETE FROM `LittleLemonDB`.`Booking`
    WHERE `BookingID` = bookingID_to_cancel;

    SELECT CONCAT('Booking ', bookingID_to_cancel, ' cancelled') AS 'Confirmation';
END