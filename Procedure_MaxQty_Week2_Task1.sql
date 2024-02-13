CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
SELECT MAX(orders.Quantity)
FROM orders