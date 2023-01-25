
USE [store]
GO

---Item with highest price
SELECT  Max(item_price)            
FROM items;

---Item with lowest price
SELECT Min(item_price)             
FROM items;

---query 3: find the range of items' price
SELECT Max(item_price)-Min(item_price)		
FROM items;

--query 4: how many times item 001 has been ordered 
SELECT COUNT(quantity)						
FROM items_in_orders 
WHERE item_id = 'IT_001';

--query 5: total quantity of item 001 has been ordered
SELECT SUM(quantity)						 
FROM items_in_orders 
WHERE item_id='IT_001';

 --query6: how many customers are from each city
 SELECT city_name, COUNT(*) headcount			
 FROM addresses
 GROUP BY city_name;

 --query7: quantity of every item that has been ordered

 SELECT item_name,  sum(quantity) quantity_ordered	
 FROM items_in_orders  iio								
 JOIN items i ON i.item_id = iio.item_id					--join tables to show item name with quantity
  GROUP BY item_name;

  --query 8: how many orders are placed in each day
 SELECT created_at, COUNT(*) headcount						
 FROM Orders
 GROUP BY created_at;

 