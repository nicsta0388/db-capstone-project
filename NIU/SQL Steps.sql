CALL GetMaxQuantity();
CALL ManageBooking();
CALL AddBooking(99,"2022-12-10",99,15,26);
SELECT * FROM Bookings;
CALL UpdateBooking(99, "2022-01-10");
SELECT * FROM Bookings;
CALL CancelBooking(99);
SELECT * FROM Bookings;