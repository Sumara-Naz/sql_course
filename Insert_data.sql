USE [store]
GO
--Insert data for customers addresses
INSERT INTO [dbo].[addresses]
           ([addr_id]
           ,[street]
           ,[city_name]
           ,[country_name])
     VALUES
  ('Add_01',	'Imatragatn 12'			,'Stockholm',	'Sweden'
),('Add_02',	'Ormbacken 6'			,'Stockholm',	'Sweden'
),('Add_03',	'Fruvägen 24'			,'Linköping',	'Sweden'
),('Add_04',	'Pippivägen 9'			,'Uppsala',		'Sweden'
),('Add_05',	'Kockbackavägen 13'		,'Stockholm',	'Sweden'
),('Add_06',	'Bäckaskiftsvägen 10'	,'Gotenberg',	'Sweden'
);

--Insert customers details
INSERT INTO [dbo].[customers]
           ([cust_id]
           ,[cust_first_name]
           ,[cust_last_name]
           ,[email_add]
           ,[addr_id])
     VALUES
  ('CUST_01',	'John'		,'Berg'			,'John433@hotmail.com'		,'Add_01'
),('CUST_02',	'Sara'		,'Najdi'		,'Sara.Najdi@gmail.com'		,'Add_02'
),('CUST_03',	'Mikael'	,'Ali'			,'Mikael_23@hotmail.com'	,'Add_03'
),('CUST_04',	'Nils'		,'Johnsson'		,'Nils45@live.se'			,'Add_04'
),('CUST_05',	'Maya'		,'Björn'		,'Maya_56@gmail.com'		,'Add_05'
),('CUST_06',	'Madhur'	,'Roy'			,'Madhur46@hotmail.com'		,'Add_06'

		   );
--insert items detail
INSERT INTO [dbo].[items]
           ([item_id]
           ,[item_name]
           ,[item_price])
     VALUES
('IT_001',	'T_shirt'	,300),
('IT_002',	'Trouser'	,500),
('IT_003',	'Sweater'	,250),
('IT_004',	'Shirt'	    ,450),
('IT_005',	'Cap'		,200);

--Insert item codes with respect to items id
INSERT INTO [dbo].[item_codes]
           ([item_id]
           ,[code])
     VALUES
('IT_001',	91001),
('IT_002',	92002),
('IT_003',	93003),
('IT_004',	94004),
('IT_005',	95005);


--Insert data for orders with delivery addresses and creation date
INSERT INTO [dbo].[Orders]
           ([order_id]
           ,[created_at]
           ,[addr_id])
     VALUES
('ORD_001',	'2022-12-14', 'Add_01'),
('ORD_002',	'2022-12-22', 'Add_05'),
('ORD_003',	'2022-12-14', 'Add_02'),
('ORD_004',	'2022-10-20', 'Add_04'),
('ORD_005',	'2022-11-11', 'Add_03'),
('ORD_006',	'2022-12-14', 'Add_06'),
('ORD_007',	'2022-12-22', 'Add_03');

-- Inserted quantity of each ordered item
-- items_in_order is a table to connect orders and items for many to many relation
INSERT INTO [dbo].[items_in_orders]
           (
           [order_id]
           ,[item_id]
           ,[quantity])
     VALUES
('ORD_001',	'IT_001',	2),
('ORD_001',	'IT_005',	1),
('ORD_002',	'IT_001',	1),
('ORD_003',	'IT_002',	2),
('ORD_003',	'IT_004',	3),
('ORD_004',	'IT_002',	2),
('ORD_005',	'IT_001',	1),
('ORD_005',	'IT_003',	1),
('ORD_005',	'IT_004',	2),
('ORD_006',	'IT_003',	3),
('ORD_007',	'IT_003',	2),
('ORD_007',	'IT_001',	4);

--Insert order to customer data
--

INSERT INTO [dbo].[orders_to_customers]
           (
           [order_id]
           ,[cust_id])
     VALUES
('ORD_001',	'CUST_01'),
('ORD_002',	'CUST_05'),
('ORD_003',	'CUST_02'),
('ORD_004',	'CUST_04'),
('ORD_005',	'CUST_03'),
('ORD_006',	'CUST_06'),
('ORD_007', 'CUST_03');
GO
