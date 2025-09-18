


----Import data + Constraint

create table employee2 (id int, Name varchar(30),salary int)

bulk insert employee2

from 'C:\Users\user\Desktop\Python02 Xurshid Kushnazarov\SQL\lesson-2\employee.txt'
with(
	firstrow=2,
	fieldterminator=',',
	rowterminator='\n')

select * from employee2


-----Constraint----cheklov
---- data validation uchun ishlatiladi
---- age= -10


create table Test (age int check(age>0))

insert into Test values (100)

drop table Test

create table Test (age int,manager varchar(50) default('Dilshod aka'))

select * from Test

insert into Test values (1,'Husan')

insert into Test (age) values (1)


drop table Test

create table Test (age int unique,manager varchar(50) default('Dilshod aka'))

insert into Test values (1,'Rustam')
insert into Test values (2,'Jasur')
select * from Test


drop table Test

create table Test (age int unique not null,manager varchar(50) default('Dilshod aka'))

insert into Test values (2,'Rustam')
insert into Test values (3,'Jasur')

insert into Test (Manager) values ('John')

insert into Test (Age,Manager) values (10,'John')

select * from Test