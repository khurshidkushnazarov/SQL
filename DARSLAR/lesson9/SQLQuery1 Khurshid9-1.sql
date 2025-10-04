

create database stat02_lesson9
use stat02_lesson9


create table family (id int,name varchar(25),parentid int)
insert into family values (1,'Grandfather',NULL),(2,'Father',1),
(3,'Uncle',1),(4,'Me',2),(5,'My Son',4),(6,'Cousin',3),(7,'Cousin son',6)

select * from family



select 
child.name as child,parent.name as parent
from family as child
left join family as parent
on child.parentid = parent.id

------------------------------------------------------------------------------------------------------

select 
child.name as child,
parent.name as parent,
grandparent.name as grandparent
from family as child
left join family as parent
on child.parentid = parent.id
left join family as grandparent
on parent.parentid = grandparent.id

-------------------------------------------------------------------------------------------------------


create table letters (letter varchar(50))

insert into letters values ('A'),('B'),('C'),('D'),('E'),('F')

select *from letters
----------------------------------------------------------------------------------------------------------
--uziga teng bulmagan harflarni olish kk

create table letters (letter varchar(50))

insert into letters values ('A'),('B'),('C'),('D'),('E'),('F')

select * from letters as L1
join letters as L2
on l1.letter <> l2.letter
-----------------------------------------------------------------------------------------
--uzidan katta harflarni olish kk

select * from letters as L1
join letters as L2
on l1.letter > l2.letter
---------------------------------------------------------------------------------------------
--uzidan oldingi harflarni olish kk

select l1.letter,max(l2.letter) as perv_letter from letters as L1
left join letters as L2
on l1.letter > l2.letter
group by l1.letter

-------------------------------------------------------------------------------------------------------
---narastayuwiyni chiqariw kk
create table sales (year int, sales int)

insert into sales values (2000,10000),(2001,25000),(2002,24000),(2003,26000)

select S1.year,S1.Sales, sum(S2.Sales) as running_total from sales as S1
left join Sales as S2
on S1.year >= S2.year
group by S1.year,S1.Sales
order by S1.year
-----------------------------------------------------------------------------------------------------------------

create table ProductSales (Year int, productName varchar(50),Sales int)
--truncate table ProductSales
insert into ProductSales values 
			( 2000,'A',5000),
			(2000,'B',4500),
			(2000,'C',6000),
			( 2001,'A',7000),
			(2001,'B',6000),
			(2001,'C',8000),
			( 2002,'A',5000),
			(2002,'B',4000),
			(2002,'C',4000)

select * from ProductSales

---xar bir maxsulot narastayuwiyni chiqariw kk

select Ps1.productName,Ps1.Year,Ps1.Sales,sum(Ps2.Sales) as runningtotal from ProductSales as PS1
join Productsales as PS2
on Ps1.productName = Ps2.productName and Ps1.Year>=Ps2.Year
group by Ps1.productName,Ps1.Year,Ps1.Sales
order by Ps1.productName,Ps1.Year
-----------------------------------------------------------------------------------------------------------------------

select Ps1.productname,Ps1.year,Ps1.sales, max(Ps2.year) as oldingiyil from ProductSales as Ps1
left join ProductSales as Ps2
on Ps1.productname = Ps2.productname and Ps1.year>Ps2.year
group by Ps1.productname,Ps1.year,Ps1.sales
--------------------------------------------------------------------------------------------------------------------------

----###################################################################################

---1st step

select Ps1.productName,Ps1.Year,Ps1.Sales,Max(Ps2.Year) as prev_year from ProductSales as Ps1
left join ProductSales as Ps2
on Ps1.productName = Ps2.productName and Ps1.Year > Ps2.Year
group by Ps1.productName,Ps1.Year,Ps1.Sales

-----------------------------------------------------
--2nd steps

select A.productName,A.Sales,PS.Sales from (
select Ps1.productName,Ps1.Year,Ps1.Sales,Max(Ps2.Year) as prev_year from ProductSales as Ps1
left join ProductSales as Ps2
on Ps1.productName = Ps2.productName and Ps1.Year > Ps2.Year
group by Ps1.productName,Ps1.Year,Ps1.Sales) as A
left join ProductSales as PS
on A.productName = PS.productName and A.prev_year = PS.Year

-- 3rd step


select 
		A.productName,
		A.Sales as hozirgi_savdo,
		isnull(PS.Sales,0) as otganyilgi_savdo,
		isnull(A.Sales - PS.Sales,0) as '$',
		isnull(cast(cast(A.Sales - PS.Sales as decimal(10,2))/cast(PS.Sales as decimal(10,2))*100 as decimal(10,2)),0) as '%'
		from (
select Ps1.productName,Ps1.Year,Ps1.Sales,Max(Ps2.Year) as prev_year from ProductSales as Ps1
left join ProductSales as Ps2
on Ps1.productName = Ps2.productName and Ps1.Year > Ps2.Year
group by Ps1.productName,Ps1.Year,Ps1.Sales) as A
left join ProductSales as PS
on A.productName = PS.productName and A.prev_year = PS.Year