CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN OrderID INT)
DELETE FROM orders