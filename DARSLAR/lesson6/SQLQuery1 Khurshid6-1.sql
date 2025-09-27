create database stat02_lesson06

use stat02_lesson06


select * into Products from [stat02_lesson04].[dbo].[Products]

select * from Products


------Agregation----qayta ishlash
-----sum
-----avg--------------urtachasi
-----count(), count(distinct), count(*)
-----max
-----min




select sum(StockQuantity) from Products
select avg(StockQuantity) from Products
select max(StockQuantity) from Products
select min(StockQuantity) from Products





create table test (id int)

insert into test values (1), (2),(3),(null),(4),(3),(5),(null)

select count(id) from test
select count(distinct id) from test
select count(*) from test



select category, sum(StockQuantity) from Products
group by category

select category, count(ProductName) from Products
group by category


select * from Products

select category,sum(Price)as sumnarx, count(ProductName) as soni from Products
group by category


select * from Products

select category,sum(Price * StockQuantity) as total from Products
group by category
having sum(Price * StockQuantity) > 20000

yozilish tartibi

where
select
from
order by
group by
having


ishlash tartibi

from
where
group by
having
select
order by



select * from Products

select category,sum(Price * StockQuantity) as total from Products
where Category <> 'Electronics'
group by category
having sum(Price * StockQuantity) > 20000
order by total desc


select category,max(Price) as maxpr,min(Price)as minpr, max(Price)- min(Price)as farq from Products
group by category


select  * from(
select category, count(productName) as totalProducts from Products
group by Category) as A
pivot (max(totalProducts) for category in ([Accessories],[Clothing],[Electronics],[Furniture],[Stationery],[Tools])) as pv




create table city_population (ID int, City  varchar(50),Population int, year int)

insert into city_population values
(1,'Chilonzor',2500,2012   ),
(2,'Yakkasaroy',1500,2012  ),
(3,'Mirobod',3000,2012     ),
(4,'Yashnobod',1000,2012   ),
(5,'Bektemir',2000,2012     ),
(1,'Chilonzor',2800,2013   ),
(2,'Yakkasaroy',1900,2013  ),
(3,'Mirobod',2000,2013     ),
(4,'Yashnobod',5000,2013   ),
(5,'Bektemir',1500,2013     )


select * from city_population

select * from (
select city,Population, year from city_population) as A
pivot (max(population) for year in ([2012],[2013])) as pvt