-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD
USE [store]
GO
--create tables for database named store
CREATE TABLE [Orders] (
    [order_id] varChar(50)  NOT NULL ,
    [created_at] datetime2  NOT NULL ,
    [addr_id] varChar(50)  NOT NULL ,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED (
        [order_id] ASC
    )
)

CREATE TABLE [items_in_orders] (
    [iio_id] int IDENTITY(1,1) NOT NULL ,
    [order_id] varChar(50)  NOT NULL ,
    [item_id] varChar(50)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_items_in_orders] PRIMARY KEY CLUSTERED (
        [iio_id] ASC
    )
)

CREATE TABLE [items] (
    [item_id] varchar(50)  NOT NULL ,
    [item_name] varchar(50)  NOT NULL ,
    [item_price] decimal(10,2)  NOT NULL ,
    CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED (
        [item_id] ASC
    )
)

CREATE TABLE [item_codes] (
    [item_id] varChar(50)  NOT NULL ,
    [code] int  NOT NULL ,
    CONSTRAINT [PK_item_codes] PRIMARY KEY CLUSTERED (
        [item_id] ASC
    )
)

CREATE TABLE [customers] (
    [cust_id] varchar(50)  NOT NULL ,
    [cust_first_name] varchar(50)  NOT NULL ,
    [cust_last_name] varchar(50)  NOT NULL ,
    [email_add] varchar(50)  NOT NULL ,
    [addr_id] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED (
        [cust_id] ASC
    )
)

CREATE TABLE [orders_to_customers] (
    [otc_id] int IDENTITY(1,1) NOT NULL ,
    [order_id] varchar(50)  NOT NULL ,
    [cust_id] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_orders_to_customers] PRIMARY KEY CLUSTERED (
        [otc_id] ASC
    )
)

CREATE TABLE [addresses] (
    [addr_id] varchar(50)  NOT NULL ,
    [street] varchar(50)  NOT NULL ,
    [city_name] varchar(50)  NOT NULL ,
    [country_name] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED (
        [addr_id] ASC
    )
)

ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_addr_id] FOREIGN KEY([addr_id])
REFERENCES [addresses] ([addr_id])

ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_addr_id]

ALTER TABLE [items_in_orders] WITH CHECK ADD CONSTRAINT [FK_items_in_orders_order_id] FOREIGN KEY([order_id])
REFERENCES [Orders] ([order_id])

ALTER TABLE [items_in_orders] CHECK CONSTRAINT [FK_items_in_orders_order_id]

ALTER TABLE [items_in_orders] WITH CHECK ADD CONSTRAINT [FK_items_in_orders_item_id] FOREIGN KEY([item_id])
REFERENCES [items] ([item_id])

ALTER TABLE [items_in_orders] CHECK CONSTRAINT [FK_items_in_orders_item_id]

ALTER TABLE [item_codes] WITH CHECK ADD CONSTRAINT [FK_item_codes_item_id] FOREIGN KEY([item_id])
REFERENCES [items] ([item_id])

ALTER TABLE [item_codes] CHECK CONSTRAINT [FK_item_codes_item_id]

ALTER TABLE [customers] WITH CHECK ADD CONSTRAINT [FK_customers_addr_id] FOREIGN KEY([addr_id])
REFERENCES [addresses] ([addr_id])

ALTER TABLE [customers] CHECK CONSTRAINT [FK_customers_addr_id]

ALTER TABLE [orders_to_customers] WITH CHECK ADD CONSTRAINT [FK_orders_to_customers_order_id] FOREIGN KEY([order_id])
REFERENCES [Orders] ([order_id])

ALTER TABLE [orders_to_customers] CHECK CONSTRAINT [FK_orders_to_customers_order_id]

ALTER TABLE [orders_to_customers] WITH CHECK ADD CONSTRAINT [FK_orders_to_customers_cust_id] FOREIGN KEY([cust_id])
REFERENCES [customers] ([cust_id])

ALTER TABLE [orders_to_customers] CHECK CONSTRAINT [FK_orders_to_customers_cust_id]

COMMIT TRANSACTION QUICKDBD