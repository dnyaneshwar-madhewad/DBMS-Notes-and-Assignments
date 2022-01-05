=================================================================================
Create table and insert values in table
=================================================================================
create table emp1(empno int(4),ename varchar(20),sal int(5),dob date);


insert into emp1 values(1,'Jack',2000,'1995-01-01'); 
1. easier to write

 
insert into emp1 values(10,'neal',null,null);
insert into emp1(empno,ename,sal,dob) values(2,'Dny',4000,'1997-01-01');
insert into emp1(empno,ename,sal,dob) values(3,'Nanya',8000,'1975-01-01');
mysql> insert into emp1(empno,sal) values(1,2000);	


1. recommonded(readable)
2. you insert values in any order.(flexible)
3. In future, if you alter the table, if you add a column to the table,
   the existing statement will continue to work (it will insert a null value for the new column);
   s/w maintenance is reduced.


=================================================================================
insert into emp1 values('1', 'Amit', 4000, '1990-05-04'),
                       ('2', 'Priyanka', 5000, '1991-05-07'),
					   ('3', 'Divesh', 3000, '1994-03-08'),
					   ('4', 'Shailesh', 2500, '1970-04-11');
=================================================================================
NULL spcial tremenet:
=================================================================================
* 1 byte STORAGE
* Special treatment given to null value in all RDBMS

* Null means nothing

* Null value is having ASCII value 0

* Null value is independent of datatype

* null value occupies only 1 Byte of storage

* if row is ending with null values, then all those columns will not occupy any space

* its recommended that those columns that are likely to have large number of null values, 
  should preferably be stored at the end of the table structure, to conserve on HD space
  
=================================================================================
insert into emp (empno, sal) values

('1',4000),

('2', 5000),

('3',3000),

('4',2500);

mysql> select * from emp1;
+-------+----------+------+------------+
| empno | ename    | sal  | dob        |
+-------+----------+------+------------+
|     1 | Jack     | 2000 | 1995-01-01 |
|     2 | Dny      | 4000 | 1997-01-01 |
|     3 | Nanya    | 8000 | 1975-01-01 |
|    10 | neal     | NULL | NULL       |
|     1 | NULL     | 2000 | NULL       |
|     1 | Amit     | 4000 | 1990-05-04 |
|     2 | Priyanka | 5000 | 1991-05-07 |
|     3 | Divesh   | 3000 | 1994-03-08 |
|     4 | Shailesh | 2500 | 1970-04-11 |
|     1 | NULL     | 4000 | NULL       |
|     2 | NULL     | 5000 | NULL       |
|     3 | NULL     | 3000 | NULL       |
|     4 | NULL     | 2500 | NULL       |
+-------+----------+------+------------+


ABOVE 2 COMMANDS WILL WORK IN MY SQL
ABOVE 2 COMMANDS ARE NOT SUPPORTED BY



=================================================================================
Where Clause
==========================================================================================
select from emp where job = 'MANAGER';
select from emp where job = 'manager';
mysql> select * from emp1 where ename= 'neal';
+-------+-------+------+------+
| empno | ename | sal  | dob  |
+-------+-------+------+------+
|    10 | neal  | NULL | NULL |
+-------+-------+------+------+


In MySQL:

Queries are case-insensitive (More user-friendly) (Less secure)

In Oracle:

Queries are case-sensitive (Less user-friendly) (More secure)

select * from emp where job = 'MANAGER' or job = 'CLERK';
select * from emp where sal>2000;
=================================================================================
Realational OPERATOR
=================================================================================
1.>
2.<
3.!= or <>
4.>=
5.<=
=================================================================================
Logical Operator
=================================================================================
1. AND
2. OR
3. NOT


* WHERE clause is used for searching

* searching takes place in DB server HD WHERE clause is used to restrict
   the rows WHERE clause is used to retrieve the rows from DB server HD to server RAM

* select from emp where deptno = 10;
* select from emp where sal > 2000;

3. OR

select from emp where deptno = 10 or sal > 2000 and sal < 3000;
select from emp where (deptno = 10 or sal > 2000) and sal < 3000;
select from emp where sal > 2000 and sal <3000;


select from emp where sal > 2000 or sal< 3000;
select * from emp; equvalient;
=================================================================================
Arithmatic OPERATOR
=================================================================================
1.()
2./
3.*
4.+
5.-
=================================================================================
DISTINCT:
=================================================================================
select ename, sal from emp;
select ename, sal, sal*12 from emp;
sal 12 -> computed column (derived column) (fake column) (Pseudo column)

*Computed columns, e.g. sal*12, are never stored in the table
 (its a wastage of HD space; as and when required you can SELECT sal *12 to see the yearly SAL

select ename, sal, sal*12 from emp;
select ename, sal, sal*12 as "ANNUAL" from emp;



Alias
select ename, sal, sal*12 "ANNUAL" from emp;
as

-> ANSI SQL

-> optional in MySQL and Oracle

as

select ename, sal, sal *12 annual from emp;
select ename, sal, sal *12 "annual" from emp;
select ename, sal, sal *12 "Annual Salary" from emp;

select ename "EMPNAME"
sal "SALARY", sal 12 "ANNUAL" sal*12*0.4 "HRA", 
sal*12*0.2 "DA" sal*12 + sal *12*0.4 + sal*12*0.2 "NET" from emp; I


select ename "EMPNAME" sal "SALARY", sal 12 "ANNUAL" from emp where annual<500000;
you cannot use alias in the WHERE clause

select ename "EMPNAME",
sal "SALARY",
sal 12 "ANNUAL"
from emp
where sal*12 < 500000;

select job from emp;

to suppress the duplicate JOBS: -
select distinct job from emp;
when you use DISTINCT, sorting takes place internally in the server RAM

select distinct job from emp;
select


============================================================================
Root user and Create user in MySQL
=================================================================================
When you install MySQL, 2 users are automatically created:
root (password has to be specified at the time of installation)
root/cdac

* has DBA privileges 
* create users, assign permissions, 
  take backups, performance monitoring, performance tuning, etc.

mysql.sys

* most important user in MySQL
* owner of MySQL database
* startup database, shutdown database, perform Recovery, etc.


Creating user in DBMS:
1.MySQL cmd line
2.

=================================================================================
=================================================================================

=================================================================================
=================================================================================
=================================================================================
=================================================================================


	




