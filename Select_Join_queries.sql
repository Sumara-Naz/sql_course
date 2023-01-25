/****** Script for SelectTopNRows command from SSMS  ******/
		   -- query 1: display customers names with their addresses. 
		   --selected only top 1000rows
SELECT TOP (1000)       
      [cust_first_name]   ---select only desired fields to show up.
      ,[cust_last_name]    --e.g cust_id is not an interesting field so i haven't included it
      ,[email_add]
      ,[street]
	  ,[city_name]
	  ,[country_name]

  FROM [store].[dbo].[customers] c
  JOIN [store].[dbo].[addresses] a	   --join customers and addresses table on the basis of addr_id
  ON c.addr_id= a.addr_id
  
 ORDER BY cust_last_name;  ---alphabetically list the customers last name 


			  ---query 2:fetch the information about customers who live in uppsala
  SELECT       
      [cust_first_name]    
      ,[cust_last_name]    
      ,[email_add]
      ,[street]
	  ,[city_name]
	  ,[country_name]

  FROM [store].[dbo].[customers] c 
  JOIN [store].[dbo].[addresses] a 	 ---join customers and addresses table on the bases of addr_id
  ON c.addr_id= a.addr_id
  WHERE city_name LIKE 'Uppsala'	---applies condition in where


 --querry3: display all placed orders with their names and quantity and where they have delivered 
 SELECT o.order_id, o.created_at, i.item_name, a.street, a.city_name, a.country_name, iio.quantity FROM [store].[dbo].[orders] o 
JOIN [store].[dbo].[items_in_orders] iio
ON o.order_id = iio.order_id
JOIN [store].[dbo].[addresses] a
ON o.addr_id = a.addr_id
JOIN [store].[dbo].[items] i
ON iio.item_id = i.item_id

--query 4: first name of the customers with their orders and on which dates
SELECT c.cust_first_name, o.order_id, o.created_at FROM [store].[dbo].[orders] o 
JOIN [store].[dbo].[orders_to_customers] otc 
ON o.order_id = otc.order_id
JOIN [store].[dbo].[customers] c
ON otc.cust_id = c.cust_id
