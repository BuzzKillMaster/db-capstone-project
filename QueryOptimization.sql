-- Query Optimization

-- First Task

DROP PROCEDURE IF EXISTS GetMaxQuantity;

CREATE PROCEDURE GetMaxQuantity()
SELECT quantity as 'Max Quantity in Order'
FROM Orders
ORDER BY quantity DESC
LIMIT 1;

CALL GetMaxQuantity();


-- Second Task

PREPARE GetOrderDetail FROM 'SELECT id, quantity, cost FROM Orders WHERE customer = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


-- Third Task

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderID INT)
BEGIN
DELETE FROM Orders WHERE id = orderID;
SELECT CONCAT('Order ', orderID, ' was cancelled') AS 'Confirmation';
END //

DELIMITER ;

CALL CancelOrder(3);

SELECT * FROM Orders;