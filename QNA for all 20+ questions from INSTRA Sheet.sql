create database QNA5;
use QNA5;

create table departments(
dept_id int primary key,
dept_name varchar(90)
);
insert into departments
values
(1,"IT"),
(2,"HR"),
(3,"SALES");

create table  employees30(
emp_id int primary key,
name varchar(90),
salary int,
dept_id int,
manager_id int null,
foreign key(dept_id) references departments(dept_id)
);

insert into employees30
values
(1,"Alice",50000,1,null),
(2,"Bob" , 70000,1,1),
(3,"Charlie",60000,1,1),
(4,"David",40000,2,null),
(5,"Emma",50000,2,4),
(6,"Frank",70000,2,4);






select * from departments;
select * from employees30;


select dept_id from employees30
union all                    -- union all, add all no with duplicate values
select dept_id from departments;

select dept_id from employees30
union                          -- union , add all values after removing duplicate values
select dept_id from departments;

select distinct dept_id
from employees30;    -- distinct use for  remove duplicate values

select dept_id, count(*)
from employees30              -- group by create group
group by dept_id;


select  d.dept_id,e.name
from employees30 e            -- inner join same as left right ... just change name
inner join departments d
on e.dept_id = d.dept_id;


insert into employees30
values
(8,"Alice",50000,1,null);  -- Add a duplocate name to find duplicate name 
select*from employees30;

select name, count(*) as Count
from employees30
group by name            -- Find Duplicate Values
having count(*) > 1;






                                 -- Delete Duplicate rows o rvalues 
                                 
                                 
                                 
                                 
create database QNA7;
use QNA7;

create table  employees30(
emp_id int primary key,
name varchar(90),
salary int,
dept_id int,
manager_id int null
);
insert into employees30
values
(1,"Alice",50000,1,null),
(2,"Bob" , 70000,1,1),
(3,"Charlie",60000,1,1),
(4,"David",40000,2,null),
(5,"Emma",50000,2,4),
(6,"Alice",50900,1,null),
(7,"Frank",70000,2,4);

select * from employees30;

DELETE FROM employees30
WHERE emp_id NOT IN (
    SELECT MIN(emp_id)
    FROM employees30
    GROUP BY name
);

DELETE FROM employees30
WHERE emp_id NOT IN (
    SELECT emp_id FROM (
        SELECT MIN(emp_id) AS emp_id
        FROM employees30
        GROUP BY name
    ) AS temp
);


 -- Rule 1-
set SQL_safe_updates = 0;     -- to convert safe to change mode
delete from employees30
where emp_id not in (
    select emp_id from(
         select min(emp_id) as emp_id
         from employees30
         group by name
	)as temp  -- temp is for temperory change or delete any row
);

-- Rule 2
create table emp_backup as
select distinct * from employees30;
                                                     -- use of distinct that only remove duplicate values
select *from emp_backup;
drop table employees30;




                  -- Find 2nd Highest Salary
                  
create database company11;
use company11;

create table emp4(
emp_id int primary key,
name varchar(90),
salary int not null
);

insert into emp4
values
(1,"Soumya",80000),
(2,"Raj",50000),
(3,"sam",39999),
(4,"raju",90000);

select*from emp4;

select name,salary,emp_id
from emp4
where salary = (
	select max(salary)
    from emp4 
    where salary <(
        select max(salary)
        from emp4
    )
);

           -- Find nth  no highest salary
           
           
select distinct salary  -- distinct use for keep only unique salary
from emp4
order by salary desc       -- desc use for keep data high to low
limit 1 offset n ; -- this is the main line limit 1 is for highest salry and n is for nth number of highest salary



                   -- Find the highest salary of department
create database q16;
use q16;
create table emp(
name varchar(90),
salary int,
dept_id int
);
insert into emp
values
("Soumya",90000,1),
("Ram",80000,2),
("sam",70000,3),
("jadu",99000,1),
("sid",88000,2),
("Bina",77000,3),
("Raj",98000,1),
("suman",87000,2),
("suraj",76000,3);

select * from emp;

select dept_id, salary
from emp e
where salary = (
	select max(salary)
	from emp  e2
	where e.dept_id = e2.dept_id
);

select dept_id , max(salary) as highest_salary
from emp
group by dept_id;


                        -- Find employees above avg salary of dept
                        
                        
                        
create database q16;
use q16;
create table emp(
name varchar(90),
salary int,
dept_id int
);
insert into emp
values
("Soumya",90000,1),
("Ram",80000,2),
("sam",70000,3),
("jadu",99000,1),
("sid",88000,2),
("Bina",77000,3),
("Raj",98000,1),
("suman",87000,2),
("suraj",76000,3);

select * from emp;

select name ,salary
from emp e
where salary < (
	select avg(salary)
    from emp e2
    where e.dept_id = e2.dept_id
);



           













