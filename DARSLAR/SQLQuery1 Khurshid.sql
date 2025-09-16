
----SQL---structured query language

create database statistika02

---create ----Yaratish (jadval,baza...)
---drop----Ochirish
---delete---Tozalash, butunligicha+qatorlar buyicha
---truncate---tozalash,butunligicha
---alter---ozgartirishni jadvalni
---update---yangilash malumotlarni
---set---malumotlarni belgilash
---declare---yangi uzgaruvchi yaratish

use statistika02


create table Students (StudentID int, StudentName varchar(50),StudentScore decimal(10,2))

select * from Students

insert into Students values (1,'Alex',50)
insert into Students values (2,'Sara',60),(3,'John',90)

insert into Students (StudentID,StudentName) values (4,'Dilshod')

delete Students
where StudentID = 3


truncate table Students

select * from Students


update Students
set StudentScore = 100
where StudentID = 1


drop table Students

alter table Students
add StudentStatus varchar(30)

select  * from Students

alter table Students
drop column StudentStatus

alter table Students
alter column StudentID varchar(15)


alter table Students
add birthdate datetime

update Students
set birthdate = '11/10/2025'
where StudentID = 2

select * from Students




--create database stat

--use stat

--create table Katalog (okpo int,inn int, korxname varchar(50))

--select * from Katalog

--insert into Katalog values (12345678,123456789,'Uzavto', 90,1)

--drop table Katalog