
create table test1 (id int)

insert into test1 values (1),(2),(3),(4)



create table test2 (id int)

insert into test2 values (3),(4),(5),(6)

select * from test1
select * from test2

select * from test1
intersect
select * from test2

select * from test1
union
select * from test2


select * from test1
union all
select * from test2


select * from test1
except
select * from test2

select * from test2
except
select * from test1

## topwiriq

select * from test1
union
select * from test2
except
select * from test1
intersect
select * from test2




