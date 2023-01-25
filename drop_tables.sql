USE [store]
GO

/****** Object:  Table [dbo].[addresses]    Script Date: 12/28/2022 7:44:35 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addresses]') AND type in (N'U'))
DROP TABLE [dbo].[orders_to_customers]
DROP TABLE [dbo].[items_in_orders]
DROP TABLE [dbo].[customers]
DROP TABLE [dbo].[item_codes]
DROP TABLE [dbo].[items]
DROP TABLE [dbo].[Orders]
DROP TABLE [dbo].[addresses]

GO


