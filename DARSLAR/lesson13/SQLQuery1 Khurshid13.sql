
create database stat02_lesson13

use stat02_lesson13


---window functions
----aggregated functions
----renking functions

CREATE TABLE Employees (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
    (11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
    (12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')

	select *,avg(salary) over() as sth from employees  
	
	---- agar over() bulsa window functions deyiladi
	----over() har bir satrga quyib beradi 


	---- urtacha (sth) dan katta oylik(salary) oladiganlar
	with cte as(
	select *,avg(salary) over() as sth from employees)
	select * from cte
	where cte.sth < salary


	----xar bir departamentni urtacasini undan katta oyliklini topish

	with cte as(
	select *,avg(salary) over(partition by department_id) as sth from employees)
	select * from cte
	where cte.sth > salary


	with cte as(
	select *,
	avg(salary) over(partition by department_id) as sth1,
	sum(salary) over(partition by department_id) as sth2,
	max(salary) over(partition by department_id) as sth3,
	min(salary) over(partition by department_id) as sth4
	from employees)
	select * from cte
	where cte.salary > cte.sth1


	-----uzi va 2 ta oldingisini qushib urtacasini topish

select
      *,
	avg(salary) over(order by(select null) rows between 2 preceding and current row) as sth from employees 



	-----uzi va 1 ta oldingi va 1 ta keyingisini qushib urtacasini topish
	select
      *,
	avg(salary) over(order by(select null) rows between 1 preceding and 1 following) as sth from employees 



	-----narastayuwiy yigadi
	select
      *,
	sum(salary) over(order by(select null) rows between unbounded preceding and current row) as sth from employees 



	----renking (pag'ona) window functions

	---tabqalashtirish(urin)

	select
      *,
	row_number() over(order by salary desc) as rn,
	rank() over(order by salary desc) as rn2,
	dense_rank() over(order by salary desc) as rn3
	from employees
	
	-- row_number xato ishlaydi 
	-- rank xato ishlaydi
	-- dense_rank tugri ishlaydi

		
---xar bir department buyicha
	select
      *,
	row_number() over(partition by department_id order by salary desc) as rn,
	rank() over(partition by department_id order by salary desc) as rn2,
	dense_rank() over(partition by department_id order by salary desc) as rn3
	from employees


	---xar bir department buyicha eng kattalarini(oylik,salary)  topish
	
	with cte as(
	select
      *,
	dense_rank() over(partition by department_id order by salary desc) as rn77
	from employees)
	select * from cte
	where rn77=1



create table Emp ( Groups varchar(10),Sequence int)

insert into Emp values ('A',1),('A',2),('A',3),('A',5),('A',6),('A',8),('A',9),('B',11),('C',1),('C',2),('C',3)

select * from Emp


with cte as(
select
     groups,
	 sequence,
	 sequence -
	  row_number() over(order by (select null)) as rn3
	from Emp)
select groups, min(sequence) as min_val, max(sequence) as max_val from cte
group by groups,rn3
order by groups