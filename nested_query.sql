
USE [store]
GO

---query: select all the items which price is greater than average
SELECT * From items			 
WHERE item_price >( 
SELECT AVG(item_price)
FROM items);

--customer's names who placed first order
SELECT cust_first_name, cust_last_name FROM customers
WHERE cust_id in (SELECT cust_id FROM orders_to_customers WHERE order_id = 'ORD_001');

-- Show order dates for order's containing item with item_id IT_003 
SELECT DISTINCT(created_at) FROM Orders   -- DISTINCT to avoid duplicate dates
WHERE order_id in (SELECT order_id FROM items_in_orders WHERE item_id = 'IT_003')
