CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `littlelemondb`.`ordersview2` AS
    SELECT 
        `littlelemondb`.`customer`.`CustomerID` AS `CustomerID`,
        `littlelemondb`.`customer`.`FullName` AS `FullName`,
        `littlelemondb`.`orders`.`OrderID` AS `OrderID`,
        `littlelemondb`.`orders`.`TotalCost` AS `TotalCost`
    FROM
        (`littlelemondb`.`customer`
        JOIN `littlelemondb`.`orders`)
    WHERE
        (`littlelemondb`.`orders`.`TotalCost` > 150)
    ORDER BY `littlelemondb`.`orders`.`TotalCost` DESC