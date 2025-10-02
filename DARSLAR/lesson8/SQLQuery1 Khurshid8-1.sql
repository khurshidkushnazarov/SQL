create database stat02_lesson8
use stat02_lesson8

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Birthdate DATE
);

-- Insert 50 rows
INSERT INTO Customers (CustomerID, FirstName, LastName, Birthdate) VALUES
(10001, 'John', 'Smith', '1972-03-15'),
(10002, 'Emily', 'Johnson', '1985-07-22'),
(10003, 'Michael', 'Williams', '1978-11-10'),
(10004, 'Sarah', 'Brown', '1990-05-03'),
(10005, 'David', 'Jones', '1982-09-18'),
(10006, 'Laura', 'Miller', '1975-01-25'),
(10007, 'James', 'Davis', '1993-12-30'),
(10008, 'Olivia', 'Garcia', '1987-04-12'),
(10009, 'Daniel', 'Martinez', '1974-08-27'),
(10010, 'Sophia', 'Hernandez', '1996-02-08'),
(10011, 'Matthew', 'Lopez', '1980-06-14'),
(10012, 'Isabella', 'Gonzalez', '1998-09-20'),
(10013, 'Andrew', 'Wilson', '1977-12-05'),
(10014, 'Mia', 'Anderson', '2001-03-19'),
(10015, 'Christopher', 'Thomas', '1983-10-23'),
(10016, 'Charlotte', 'Taylor', '1992-01-09'),
(10017, 'Joshua', 'Moore', '1979-07-17'),
(10018, 'Amelia', 'Jackson', '1988-11-28'),
(10019, 'Ethan', 'Martin', '1995-04-06'),
(10020, 'Abigail', 'Lee', '2000-09-15'),
(10021, 'Joseph', 'Perez', '1976-02-21'),
(10022, 'Harper', 'Thompson', '1999-08-03'),
(10023, 'Benjamin', 'White', '1981-05-29'),
(10024, 'Ella', 'Harris', '1997-11-11'),
(10025, 'Alexander', 'Sanchez', '1973-04-16'),
(10026, 'Avery', 'Clark', '1989-07-24'),
(10027, 'Ryan', 'Ramirez', '1984-10-02'),
(10028, 'Scarlett', 'Lewis', '1994-12-14'),
(10029, 'Samuel', 'Robinson', '1971-01-07'),
(10030, 'Grace', 'Walker', '1986-08-18'),
(10031, 'Anthony', 'Young', '1979-03-26'),
(10032, 'Chloe', 'Allen', '1991-06-05'),
(10033, 'Jonathan', 'King', '1983-09-09'),
(10034, 'Lily', 'Wright', '1995-02-13'),
(10035, 'Nicholas', 'Scott', '1970-11-30'),
(10036, 'Aria', 'Torres', '2002-05-22'),
(10037, 'William', 'Nguyen', '1977-08-04'),
(10038, 'Zoe', 'Hill', '1998-10-27'),
(10039, 'Justin', 'Flores', '1985-03-02'),
(10040, 'Layla', 'Green', '1990-07-15'),
(10041, 'Kevin', 'Adams', '1974-09-23'),
(10042, 'Nora', 'Nelson', '1988-12-01'),
(10043, 'Brian', 'Baker', '1972-06-17'),
(10044, 'Hannah', 'Carter', '1993-04-09'),
(10045, 'Jason', 'Mitchell', '1981-10-19'),
(10046, 'Evelyn', 'Perez', '1996-01-28'),
(10047, 'Thomas', 'Roberts', '1975-05-12'),
(10048, 'Victoria', 'Turner', '2003-11-06'),
(10049, 'Eric', 'Phillips', '1987-08-29'),
(10050, 'Madison', 'Campbell', '1999-02-17');

CREATE TABLE FactSales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SalesDate DATE,
    EmployeeID INT,
    SalesAmount DECIMAL(12,2),   -- allows large numbers with cents
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO FactSales (SalesID, ProductID, CustomerID, SalesDate, EmployeeID, SalesAmount) VALUES
(1, 20001, 10001, '2020-01-15', 50001, 45000.00),
(2, 20002, 10002, '2020-02-20', 50002, 125000.00),
(3, 20003, 10003, '2020-03-10', 50003, 389000.00),
(4, 20004, 10004, '2020-04-05', 50004, 205000.00),
(5, 20005, 10005, '2020-05-22', 50005, 497500.00),
(6, 20006, 10006, '2020-06-12', 50001, 86000.00),
(7, 20007, 10007, '2020-07-03', 50002, 243500.00),
(8, 20008, 10008, '2020-08-18', 50003, 315000.00),
(9, 20009, 10009, '2020-09-25', 50004, 192000.00),
(10, 20010, 10010, '2020-10-30', 50005, 410000.00),
(11, 20001, 10011, '2020-11-15', 50001, 221000.00),
(12, 20002, 10012, '2020-12-20', 50002, 334000.00),
(13, 20003, 10013, '2021-01-05', 50003, 254000.00),
(14, 20004, 10014, '2021-02-14', 50004, 98000.00),
(15, 20005, 10015, '2021-03-19', 50005, 457000.00),
(16, 20006, 10016, '2021-04-25', 50001, 76000.00),
(17, 20007, 10017, '2021-05-30', 50002, 298000.00),
(18, 20008, 10018, '2021-06-18', 50003, 375000.00),
(19, 20009, 10019, '2021-07-22', 50004, 420000.00),
(20, 20010, 10020, '2021-08-29', 50005, 278500.00),
(21, 20001, 10021, '2021-09-13', 50001, 335000.00),
(22, 20002, 10022, '2021-10-07', 50002, 198000.00),
(23, 20003, 10023, '2021-11-18', 50003, 432000.00),
(24, 20004, 10024, '2021-12-03', 50004, 245000.00),
(25, 20005, 10025, '2022-01-12', 50005, 115000.00),
(26, 20006, 10026, '2022-02-15', 50001, 263000.00),
(27, 20007, 10027, '2022-03-27', 50002, 389500.00),
(28, 20008, 10028, '2022-04-09', 50003, 206000.00),
(29, 20009, 10029, '2022-05-14', 50004, 497000.00),
(30, 20010, 10030, '2022-06-21', 50005, 147000.00),
(31, 20001, 10001, '2022-07-02', 50001, 241000.00),
(32, 20002, 10002, '2022-08-11', 50002, 319000.00),
(33, 20003, 10003, '2022-09-05', 50003, 465000.00),
(34, 20004, 10004, '2022-10-23', 50004, 226000.00),
(35, 20005, 10005, '2022-11-16', 50005, 194000.00),
(36, 20006, 10006, '2022-12-28', 50001, 289000.00),
(37, 20007, 10007, '2023-01-09', 50002, 333000.00),
(38, 20008, 10008, '2023-02-14', 50003, 414000.00),
(39, 20009, 10009, '2023-03-26', 50004, 202000.00),
(40, 20010, 10010, '2023-04-18', 50005, 367000.00),
(41, 20001, 10011, '2023-05-22', 50001, 499000.00),
(42, 20002, 10012, '2023-06-05', 50002, 142000.00),
(43, 20003, 10013, '2023-07-13', 50003, 283000.00),
(44, 20004, 10014, '2023-08-29', 50004, 412000.00),
(45, 20005, 10015, '2023-09-11', 50005, 329000.00),
(46, 20006, 10016, '2023-10-27', 50001, 217000.00),
(47, 20007, 10017, '2023-11-06', 50002, 255000.00),
(48, 20008, 10018, '2023-12-19', 50003, 389000.00),
(49, 20009, 10019, '2024-01-15', 50004, 420000.00),
(50, 20010, 10020, '2024-02-25', 50005, 260000.00),
(51, 20001, 10021, '2024-03-09', 50001, 365000.00),
(52, 20002, 10022, '2024-04-12', 50002, 245000.00),
(53, 20003, 10023, '2024-05-18', 50003, 278000.00),
(54, 20004, 10024, '2024-06-23', 50004, 497500.00),
(55, 20005, 10025, '2024-07-29', 50005, 332000.00);


select * from Customers

select * from FactSales



----join,cardinality

--- inner join
--- outer join
    ---left outer join
	---right outer join
	---full outer join
--- cross join
--- self join


create table Test1 (id int)

insert into Test1 values (1),(2),(3),(4)

select * from Test1

create table Test2 (id int)

insert into Test2 values (3),(4),(5),(6)

select * from Test2

-----inner join
select * from Test1
inner join Test2
on Test1.id = Test2.id
 

 ----left 
select * from Test1
left join Test2
on Test1.id = Test2.id

----right 
select * from Test1
right join Test2
on Test1.id = Test2.id


----full 
select * from Test1
full join Test2
on Test1.id = Test2.id



----cross 
select * from Test1
cross join Test2



create table Employee (EmployeeID int, Name varchar(30),ManagerID int)

insert into Employee values 
	(1,'Hamraev',null),
	(2,'Ziyayev',1),
	(3,'Mahammadiyev',1),
	(4,'Mamur',2),
	(5,'Dilshod',3),
	(6,'Xurshid',4),
	(7,'Kamoliddin',5)

select * from Employee


select 
employee.Name as employee, 
isnull(manager.name,'No manager') as manager
from Employee as employee
left join Employee as manager
on Employee.ManagerID = manager.EmployeeID                                  Ishchini yoniga raxbarini tortiw



select * from Customers
select * from FactSales


select
		top 5 FirstName,
		sum(SalesAmount) as totalsales from Customers as C
inner join FactSales as F
on C.CustomerID = F.CustomerID
group by FirstName
order by totalsales desc                                      #### kup savdo qilgan 5 customerni topish


select * from Customers
select * from FactSales


----1 step
select * from Customers as C
inner join FactSales as F
on C.CustomerID = F.CustomerID

---2-step

select
		FirstName,sum(SalesAmount) as totalsales from Customers as C
inner join FactSales as F
on C.CustomerID = F.CustomerID
group by FirstName


---3-step

select
		top 5 FirstName,
		sum(SalesAmount) as totalsales from Customers as C
inner join FactSales as F
on C.CustomerID = F.CustomerID
group by FirstName
order by totalsales desc




------------------------------------------
select * from Customers
select * from FactSales

select FirstName,SalesAmount  from Customers
left join FactSales
on Customers.CustomerID = FactSales.CustomerID
where SalesAmount is Null

