
SET SQL_SAFE_UPDATES = 0;

-- View for orders with quantity greater than 2
DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS (
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2
);

-- Order details for orders with cost greater than 150
DROP VIEW IF EXISTS OrdersView2;
CREATE VIEW OrdersView2 AS (
SELECT
	c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.Cuisine,
    mi.CourseName
FROM Orders o
INNER JOIN Customers c
  ON o.CustomerID = c.CustomerID
INNER JOIN Menus m
  ON o.MenuID = m.MenuID
INNER JOIN MenuItems mi
  ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost);

-- stored procedure to get the order with the max quantity
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity()  
SELECT MAX(Quantity) AS "Max Quantity in Order"
FROM Orders;

CALL GetMaxQuantity();

-- prepared statement to get order details using user input order id
PREPARE GetOrderDetail 
FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

DROP PROCEDURE IF EXISTS AddBooking;

-- a procedure to add a booking
DELIMITER //
CREATE PROCEDURE AddBooking (IN AddBookingID INT, IN AddBookingDate DATE, IN AddTableNo INT, IN AddCustomerID INT, IN AddEmployeeNum INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, EmployeeID)
VALUES (AddBookingID, AddBookingDate, AddTableNo, AddCustomerID, AddEmployeeNum);
-- SELECT CONCAT("No confirmation message ", AddBookingID) AS Confirmation;
END//
DELIMITER ;

-- call the procedure 
CALL AddBooking(99, "2022-12-10", 99, 99, 99);

-- update booking procedure
DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking(IN TableNumber INT, IN BookingDate Date)
UPDATE Bookings
SET BookingDate = BookingDate
WHERE TableNumber = TableNumber;

CALL UpdateBooking(99, '2022-1-10');

SELECT * FROM Bookings;


DROP PROCEDURE IF EXISTS MakeBooking;
DELIMITER //
CREATE PROCEDURE MakeBooking (booking_id INT, booking_date date, customer_id INT, table_no int)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) 
VALUES (booking_id, booking_date, table_no, customer_id);
-- SELECT "No confirmation message" AS "Confirmation";
END//
DELIMITER ;

CALL MakeBooking(50, "2022-12-30", 4, 3);

-- check the bookings table
SELECT * FROM Bookings;

-- stored procedure to cancel a booking
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN CancelID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = CancelID;
-- SELECT CONCAT("No confirmation message ",CancelID) AS Confirmation FROM Bookings;
END//
DELIMITER ;

CALL CancelBooking(99);


-- a procedure to check whether a table in the restaurant is already booked
DROP PROCEDURE IF EXISTS CheckBooking;

-- a stored procedure to check if a table is booked on a given date
DELIMITER //
CREATE PROCEDURE CheckBooking (booking_date DATE, table_number INT)
BEGIN
DECLARE bookedTable INT DEFAULT 0;
 SELECT COUNT(bookedTable)
    INTO bookedTable
    FROM Bookings WHERE BookingDate = booking_date and TableNumber = table_number;
    IF bookedTable > 0 THEN
      SELECT CONCAT( "Table ", table_number, " is already booked.") AS "Booking status";
      ELSE 
      SELECT CONCAT( "Table ", table_number, " is not booked.") AS "Booking status";
    END IF;
END//
DELIMITER ;

CALL CheckBooking("2022-12-10", 5);

-- check Bookings table
SELECT * FROM Bookings;
