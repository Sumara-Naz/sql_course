/****** Script for Selec  tTopNRows command from SSMS  ******/

-- CRUD operations

DECLARE @ITEM_ID varchar(25)

SET @ITEM_ID = 'IT_006'

-- Create	a row in table items
INSERT INTO [store].[dbo].[items]
           ([item_id]
           ,[item_name]
           ,[item_price])
     VALUES
(@ITEM_ID, 'Tie', 100)

-- READ
SELECT * FROM [store].[dbo].[items]
WHERE item_id = @ITEM_ID

-- UPDATE the item_price
UPDATE [store].[dbo].[items]
SET item_price=200
WHERE item_id = @ITEM_ID

-- DELETE  the row from table items
DELETE FROM [store].[dbo].[items]
WHERE item_id = @ITEM_ID