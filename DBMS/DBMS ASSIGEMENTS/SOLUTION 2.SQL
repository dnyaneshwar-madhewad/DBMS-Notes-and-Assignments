Instructions:- This exam consists of 2 sections.
 All questions are compulsory. Total time for this test is 90 minutes.
Connect to MySQL database with your respective username and password.
Section I (30 marks)


============================================================================
1. Create table DEPT with the following structure:-
DEPTNO int
DNAME varchar(15)
LOC varchar(10)

Insert the following rows into the DEPT table:-
10 ACCOUNTING NAINITAL
20 RESEARCH DEHRADUN
30 SALES CHENNAI
40 OPERATIONS BILASPUR

Answer:

drop table if exists dept ;
Create table DEPT(Deptno int,DNAME varchar(25),LOC Varchar(10));
insert into DEPT values(10,'ACCOUNTING','NAINITAL');
insert into DEPT values(20,'RESEARCH','DEHRADUN');
insert into DEPT values(30,'SALES','CHENNAI');
insert into DEPT values(40,'OPERATIONS','BILASPUR');
select * from dept;
mysql> select * from dept;
+--------+------------+----------+
| Deptno | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NAINITAL |
|     20 | RESEARCH   | DEHRADUN |
|     30 | SALES      | CHENNAI  |
|     40 | OPERATIONS | BILASPUR |
+--------+------------+----------+


============================================================================

2. Create table EMP with the following structure:-
EMPNO int
ENAME varchar(10)
JOB varchar(9)
HIREDATE date
SAL float
COMM float
DEPTNO int


Insert the following rows into the EMP table:-
7839 KAILASH MANAGER 1991-11-17 5000 NULL 10
7698 BELA CLERK 1981-05-01 2850 NULL 30
7782 CHETAN MANAGER 1981-06-09 2450 NULL 10
7566 JASPREET CLERK 1981-04-02 2975 NULL 20
7654 MAMTA SALESMAN 1981-09-28 1250 1400 30
7499 AMAR SALESMAN 1981-02-20 1600 300 30

drop table if exists emp;
CREATE table EMP(EMPNO int,ENAME varchar(10),JOB varchar(9),HIREDATE date,SAL float,COMM float,DEPTNO int);
insert into EMP values(7839,'KAILASH','MANAGER','1991-11-17',5000,NULL,10);
insert into EMP values(7698,'BELA','CLERK','1981-05-01',2850,NULL,30);
insert into EMP values(7782,'CHETAN','MANAGER','1981-06-09',2450,NULL,10);
insert into EMP values(7566,'JASPREET','CLERK','1981-04-02',2975,NULL,20);
insert into EMP values(7654,'MAMTA','SALESMAN','1981-09-28',1250,1400,30);
insert into EMP values(7499,'AMAR','SALESMAN','1981-02-20',1600,300,30);
select * from EMP;

mysql> select * from EMP;
+-------+----------+----------+------------+------+------+--------+
| EMPNO | ENAME    | JOB      | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+----------+----------+------------+------+------+--------+
|  7839 | KAILASH  | MANAGER  | 1991-11-17 | 5000 | NULL |     10 |
|  7698 | BELA     | CLERK    | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CHETAN   | MANAGER  | 1981-06-09 | 2450 | NULL |     10 |
|  7566 | JASPREET | CLERK    | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MAMTA    | SALESMAN | 1981-09-28 | 1250 | 1400 |     30 |
|  7499 | AMAR     | SALESMAN | 1981-02-20 | 1600 |  300 |     30 |
+-------+----------+----------+------------+------+------+--------+

============================================================================


Write SELECT statements to achieve the following:-
3. Display the last day of the month for every HIREDATE.
mysql> select last_day(Hiredate) from emp;
+--------------------+
| last_day(Hiredate) |
+--------------------+
| 1991-11-30         |
| 1981-05-31         |
| 1981-06-30         |
| 1981-04-30         |
| 1981-09-30         |
| 1981-02-28         |
+--------------------+

4. Display the annual SAL for each employee.
mysql> select ename,sal*12 from emp;
+----------+--------+
| ename    | sal*12 |
+----------+--------+
| KAILASH  |  60000 |
| BELA     |  34200 |
| CHETAN   |  29400 |
| JASPREET |  35700 |
| MAMTA    |  15000 |
| AMAR     |  19200 |
+----------+--------+


5. Display the ENAME and JOB for all employees who belong to the same DEPTNO as employee ‘KAILASH’.
 mysql> select ename,job from emp where deptno=(select deptno from emp where ename='KAILASH');
+---------+---------+
| ename   | job     |
+---------+---------+
| KAILASH | MANAGER |
| CHETAN  | MANAGER |
+---------+---------+

6. Display the names of all employees replacing any ‘A’ with ‘a’
mysql> select replace(ename,'A','a') from emp;
+------------------------+
| replace(ename,'A','a') |
+------------------------+
| KaILaSH                |
| BELa                   |
| CHETaN                 |
| JaSPREET               |
| MaMTa                  |
| aMaR                   |
+------------------------+


7. Display the employee name and employee number of the employees with the headings as NUMBER and NAME.
select empno "Number",ename "NAME" from emp;
mysql> select empno "Number",ename "NAME" from emp;
+--------+----------+
| Number | NAME     |
+--------+----------+
|   7839 | KAILASH  |
|   7698 | BELA     |
|   7782 | CHETAN   |
|   7566 | JASPREET |
|   7654 | MAMTA    |
|   7499 | AMAR     |
+--------+----------+

8. Find the name of the employee who is receiving the maximum salary.
 mysql> select ename,max(sal) from emp;
+---------+----------+
| ename   | max(sal) |
+---------+----------+
| KAILASH |     5000 |
+---------+----------+

9. Display the sum of SAL for all the employees belonging to DEPTNO 10.
mysql> select deptno,sum(sal) from emp where deptno=10;
+--------+----------+
| deptno | sum(sal) |
+--------+----------+
|     10 |     7450 |
+--------+----------+

10. Display the rows where JOB column ends with the letter ‘T’.
select * from emp where job like '%T';
mysql> select * from emp where job like '%T';
Empty set (0.00 sec)



============================================================================
Section II (10 marks)



1. Write a stored procedure by the name of HRA_calc. The Empno, Deptno and Sal should be passed 
   as parameters to your stored procedure. The formulae are as follows:-
   If deptno = 10 then HRA = 20% of sal,
   If deptno = 20 then HRA = 30% of sal,
For all other deptnos, HRA = 10% of sal.
Your stored procedure should insert the Empno, Deptno, Sal and 
the HRA into a suitable TEMPP output table. Calling program for the stored procedure need not be written.

Answer:

drop procedure if exists abc;
drop table if exists tempp;
Create table tempp
(
Empno int,
Deptno int,
sal int,
hra int
);



/* ............................................................. */
delimiter //
create procedure abc(empno float, Deptno float, sal float)
begin 
  declare hra float;
     if deptno=10 then
        set hra=sal*0.2;
		insert into tempp values(Empno,Deptno,sal,hra);
   
    elseif deptno=20 then
        set hra=sal*0.3;
		insert into tempp values(Empno,Deptno,sal,hra);
   else
        set hra=sal*0.1;
		insert into tempp values(Empno,Deptno,sal,hra);
   end if;
end;//
delimiter ;
/* ............................................................. */


call abc(1,10,3000);
call abc(2,20,3000);
call abc(3,30,3000);
select * from tempp;
mysql> select * from tempp;

+-------+--------+------+------+
| Empno | Deptno | sal  | hra  |
+-------+--------+------+------+
|     1 |     10 | 3000 |  600 |
|     2 |     20 | 3000 |  900 |
|     3 |     30 | 3000 |  300 |
+-------+--------+------+------+




=================================================================================================

2. Write a stored function by the name of Num_cube. The stored function should return the cube of a number ‘N’. 
The number ‘N’ should be passed to the stored function as a parameter. 
Calling program for the stored function need not be written.

Answer:
drop function if exists Num_cube;
drop PROCEDURE if exists pqr;
drop table if exists tempp;
Create table tempp
(
Num varchar(20),
Num_cube int
);


/* ............................................................. */
delimiter //
create function Num_cube(N int)
   returns int
   deterministic
   begin
		return N*N*N;
   end; //
delimiter ;

/* ............................................................. */

mysql> select Num_cube(10) from dual;
+--------------+
| Num_cube(10) |
+--------------+
|         1000 |
+--------------+
=================================================================================================
