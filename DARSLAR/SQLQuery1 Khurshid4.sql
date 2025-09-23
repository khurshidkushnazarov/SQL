create database stat02_lesson04

use stat02_lesson04


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20)

select * from Products

where Price > 500 or (StockQuantity > 120 and Category ='Electronics')


select * from Products
where Category = 'Electronics'


select * from Products
where Category like '%on%'


select * from Products
where Category like 's%'


select * from Products
where Category like '_l%'

select * from Products
where Category like '[SC]%'

select * from Products
where Price like '[5]%'

select * from Products
where Price like '[50]%'

select * from Products
where Price like '50%'


select * from Products
where Category in ('Accessories','Electronics')


select * from Products
where price between 400 and 800


select * from Products
where Category in ('Electronics') and Price > 500


select * from Products
where Category in ('Accessories','Electronics') and Price > 500 and StockQuantity > 10


select Productname  from Products
where Category in ('Accessories','Electronics') and Price > 500 and StockQuantity > 10


select Productname,ProductID  from Products
where price between 400 and 800


select distinct Category from Products

select category, sum(price*StockQuantity) as total_sales from Products
group by category


select distinct Category,Productname from Products

select distinct Productname,Category from Products



select * from Products
order by Price asc

select * from Products
order by Price desc

select * from Products
order by Category asc, ProductName desc

select * from Products
order by Price asc, StockQuantity desc


select top 3 * from Products
order by Price desc

select top 3 * from Products
order by Price asc


select * from Products
order by Price desc
offset 10 rows fetch next 5 rows only

select Productname as Mahsulot,ProductID as IDsi from Products


