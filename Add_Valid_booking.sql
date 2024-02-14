CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN new_booking_date DATE, IN new_table_number INT)
BEGIN
    DECLARE table_status INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO table_status
    FROM `LittleLemonDB`.`Booking`
    WHERE `BookingDate` = new_booking_date AND `TableNumber` = new_table_number;

    IF (table_status > 0) THEN
        ROLLBACK;
        SELECT 'Booking could not be completed. Table is already booked on the specified date.' AS 'Status';
    ELSE
        INSERT INTO `LittleLemonDB`.`Booking`(`BookingDate`, `TableNumber`)
        VALUES(new_booking_date, new_table_number);

        COMMIT;
        SELECT 'Booking completed successfully.' AS 'Status';
    END IF;
END