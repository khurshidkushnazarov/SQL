select * from Products

select
	*,
	case 
	when StockQuantity < 50 then 'low sales'
	when StockQuantity < 200 then 'Medium sales' else 'High sales' end as Quantitycategory
from Products


select
	*,
	case 
	when StockQuantity*Price < 10000 then 'low sales'
	when StockQuantity*Price < 20000 then 'Medium sales' else 'High sales' end as Salecategory
from Products


select
	*,
	StockQuantity*Price as Sales,
		case 
			when StockQuantity*Price < 10000 then 'low sales'
			when StockQuantity*Price < 20000 then 'Medium sales' else 'High sales' end as Salecategory
from Products








create table countries (country varchar(50))

insert into countries values ('Uzbekistan'),('Russia'),('Japan'),('Brazil'),('USA')

select * from countries
order by country desc


select * from countries
order by case when country='Uzbekistan' then 0 else 1 end, country

select *, case when country='Uzbekistan' then 0 else 1 end from countries
order by case when country='Uzbekistan' then 0 else 1 end,country




select *, iif (price < 300, 'arzon',iif(price<500,'ortacha',iif(price<1000,'qimmat','juda qimmat'))) as narxini from Products


declare @test int = 16
declare @test2 int = 15

select @test + @test2


declare @test int = 16
declare @test2 int = 15
declare @test3 int

set @test3 =  @test + @test2
select @test3



declare @students table (id int, name varchar(30))
insert into @students
select 1,'Alex'
union all
select 2,'John'
select * from @students