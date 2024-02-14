-- Insert data into Customer
INSERT INTO `LittleLemonDB`.`Customer` (`CustomerID`, `FullName`, `ContactNumber`,`Email`)
VALUES
(1, 'John Doe','12627682932', 'john.doe@example.com'),
(2, 'Jane Doe', '12395875561','jane.doe@example.com'),
(3, 'Alice', '16262786391','alice@example.com'),
(4, 'Bob', '17736726363','bob@example.com'),
(5, 'Charlie', '16054610849','charlie@example.com'),
(6, 'David', '17635930461','david@example.com'),
(7, 'Emily', '12519265580','emily@example.com'),
(8, 'Frank', '16187625501','frank@example.com'),
(9, 'Grace', '14098874947','grace@example.com'),
(10, 'Hannah', '12402270015','hannah@example.com');

-- Insert data into Staff
INSERT INTO `LittleLemonDB`.`Staff` (`StaffID`, `FullName`, `Role`, `Salary`)
VALUES
(1,'Sarah', 'Manager', 55000),
(2,'Tom', 'Waiter', 30000),
(3,'Linda', 'Chef', 40000),
(4,'Robert', 'Cashier', 31000),
(5,'Daniel', 'Waiter', 32000),
(6,'Susan', 'Hostess', 28000),
(7,'Chris', 'Manager', 60000),
(8,'Jessica', 'Chef', 38000),
(9,'Brian', 'Waiter', 29000),
(10,'Kim', 'Hostess', 27000);

-- Insert data into Menus
INSERT INTO `LittleLemonDB`.`Menu` (`MenuID`, `Name`, `Description`)
VALUES
(1, 'Garlic Butter Shrimp', 'Italian'),
(2, 'Spring Rolls', 'Chinese'),
(3, 'Caprese Salad', 'Italian'),
(4, 'Chicken Wings', 'American'),
(5, 'Tomato Soup', 'French'),
(6, 'Sushi Rolls', 'Japanese'),
(7, 'Hummus with Pita', 'Lebanese'),
(8, 'Tandoori Chicken', 'Indian'),
(9, 'Greek Salad', 'Greek'),
(10, 'Steak au Poivre', 'French');

-- Insert data into Booking
INSERT INTO `LittleLemonDB`.`Booking` (`BookingID`, `Date`, `TableNumber`)
VALUES
(1, '2023-09-01 12:00:00', 10),
(2, '2023-09-01 12:30:00', 12),
(3, '2023-09-02 13:00:00', 14),
(4, '2023-09-02 14:00:00', 16),
(5, '2023-09-03 15:00:00', 18),
(6, '2023-09-03 16:00:00', 20),
(7, '2023-09-04 17:00:00', 22),
(8, '2023-09-04 18:00:00', 24),
(9, '2023-09-05 19:00:00', 26),
(10, '2023-09-05 20:00:00', 28);


-- Insert data into Orders
INSERT INTO `LittleLemonDB`.`Orders` (`OrderID`, `Date`, `Quantity`, `TotalCost`, `Menu_MenuID`, `CustomerID`)
VALUES
(1, '2023-09-01 12:00:00', 3, 499, 1, 5),
(2, '2023-09-01 12:30:00', 2, 295, 2, 8),
(3, '2023-09-02 13:00:00', 4, 599, 3, 4),
(4, '2023-09-02 14:00:00', 1, 199, 4, 7),
(5, '2023-09-03 15:00:00', 5, 795, 5, 1),
(6, '2023-09-03 16:00:00', 2, 295, 6, 9),
(7, '2023-09-04 17:00:00', 3, 499, 7, 2),
(8, '2023-09-04 18:00:00', 4, 599, 8, 6),
(9, '2023-09-05 20:00:00', 1, 199, 9, 3),
(10, '2023-09-05 20:00:00', 5, 795, 10, 10);

-- Insert data into OrderDeliveryStatuses
INSERT INTO `LittleLemonDB`.`DeliveryStatus` (`DeliveryID`, `DeliveryDate`, `DeliveryStatus`)
VALUES
(1, '2023-09-01 12:15:00', 'Delivered'),
(2, '2023-09-01 12:45:00', 'Preparing'),
(3, '2023-09-02 13:15:00', 'Preparing'),
(4, '2023-09-02 14:15:00', 'Out for delivery'),
(5, '2023-09-03 15:15:00', 'Out for delivery'),
(6, '2023-09-03 16:15:00', 'Delivered'),
(7, '2023-09-04 17:15:00', 'Preparing'),
(8, '2023-09-04 18:15:00', 'Delivered'),
(9, '2023-09-05 19:15:00', 'Delivered'),
(10, '2023-09-05 20:15:00', 'Delivered');