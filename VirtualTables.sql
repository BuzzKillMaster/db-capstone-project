-- The summary and virtual table


-- First Task

CREATE OR REPLACE VIEW OrdersViews AS
SELECT id, quantity, cost FROM Orders WHERE quantity > 2;

SELECT * FROM OrdersView;


-- Second Task

SELECT
	customers.id AS 'Customer ID',
    customers.name AS 'Customer Name',
    orders.id AS 'Order ID',
    orders.cost,
    menu.name AS 'Menu Item',
    cuisines.name AS 'Cuisine',
    categories.name AS 'Category'
FROM Orders
INNER JOIN Customers ON customers.id = orders.customer
INNER JOIN Menu ON menu.id = orders.item
INNER JOIN Cuisines ON cuisines.id = menu.cuisine
INNER JOIN Categories ON categories.id = menu.category
ORDER BY orders.cost ASC;


-- Third Task

SELECT name AS 'Menu Item Name' FROM Menu WHERE id IN (SELECT item FROM Orders WHERE quantity > 2)
