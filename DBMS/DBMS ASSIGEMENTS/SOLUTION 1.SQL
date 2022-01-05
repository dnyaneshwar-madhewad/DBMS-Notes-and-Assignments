Instructions:-
This exam consists of 2 sections.  
All questions are compulsory. Total time for this test is 90 minutes.  
Connect to MySQL database with your respective username and password.


Section I									(30 marks)
===================================================================
1.	Create table DEPT with the following structure:-
DEPTNO			int
DNAME			varchar(15)
LOC				varchar(10)

Insert the following rows into the DEPT table:-
10	ACCOUNTING	NAGPUR
20	RESEARCH		DELHI
30	SALES		KOLKATA
40	OPERATIONS	MUMBAI

Answer:
Create table DEPT(Deptno int,DNAME varchar(15),LOC Varchar(10));
insert into DEPT values(10,'ACCOUNTING','NAGPUR');
insert into DEPT values(20,'RESEARCH','DELHI');
insert into DEPT values(30,'SALES','KOLKATA');
insert into DEPT values(40,'OPERATIONS','MUMBAI');
mysql> select * from dept;
+--------+------------+---------+
| Deptno | DNAME      | LOC     |
+--------+------------+---------+
|     10 | ACCOUNTING | NAGPUR  |
|     20 | RESEARCH   | DELHI   |
|     30 | SALES      | KOLKATA |
|     40 | OPERATIONS | MUMBAI  |
+--------+------------+---------+



===========================================================================

2.	Create table EMP with the following structure:-
EMPNO		int
ENAME		varchar(10)
JOB			varchar(9)
HIREDATE		date
SAL			float
COMM		float
DEPTNO		int



Insert the following rows into the EMP table:-
7839	KRISHNA		MANAGER	1991-11-17	5000	NULL	10
7698	BHAVANA		CLERK	1981-05-01	2850	NULL	30
7782	CHETAN		MANAGER	1981-06-09	2450	NULL	10
7566	JAMILA		CLERK	1981-04-02	2975	NULL 20
7654	MAHENDRA		SALESMAN	1981-09-28	1250	1400	30
7499	AJIT			SALESMAN	1981-02-20	1600	300	30

Solution:

drop table if exists emp;
CREATE table EMP(EMPNO int,ENAME varchar(10),JOB varchar(9),HIREDATE date,SAL float,COMM float,DEPTNO int);
insert into EMP values(7839,'KRISHNA','MANAGER','1991-11-17',5000,NULL,10);
insert into EMP values(7698,'BHAVANA','CLERK','1981-05-01',2850,NULL,30);
insert into EMP values(7782,'CHETAN','MANAGER','1981-06-09',2450,NULL,10);
insert into EMP values(7566,'JAMILA	','CLERK','1981-04-02',2975,NULL,20);
insert into EMP values(7654,'MAHENDRA','SALESMAN','1981-09-28',1250,1400,30);
insert into EMP values(7499,'AJIT','SALESMAN','1981-02-20',1600,300,30);
select * from EMP;

mysql> select * from EMP;
+-------+----------+----------+------------+------+------+--------+
| EMPNO | ENAME    | JOB      | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+----------+----------+------------+------+------+--------+
|  7839 | KRISHNA  | MANAGER  | 1991-11-17 | 5000 | NULL |     10 |
|  7698 | BHAVANA  | CLERK    | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CHETAN   | MANAGER  | 1981-06-09 | 2450 | NULL |     10 |
|  7566 | JAMILA   | CLERK    | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MAHENDRA | SALESMAN | 1981-09-28 | 1250 | 1400 |     30 |
|  7499 | AJIT     | SALESMAN | 1981-02-20 | 1600 |  300 |     30 |
+-------+----------+----------+------------+------+------+--------+



=================================================================================
Write SELECT statements to achieve the following:-

3.	Display the JOB column with duplicate values suppressed.
mysql> select distinct Job from emp;
+----------+
| Job      |
+----------+
| MANAGER  |
| CLERK    |
| SALESMAN |
+----------+

4.	Display the Enames and the corresponding Dnames.
mysql> Select ename,dname from emp e,dept d where d.deptno=e.deptno;
+----------+------------+
| ename    | dname      |
+----------+------------+
| KRISHNA  | ACCOUNTING |
| BHAVANA  | SALES      |
| CHETAN   | ACCOUNTING |
| JAMILA   | RESEARCH   |
| MAHENDRA | SALES      |
| AJIT     | SALES      |
+----------+------------+

5.	Show the salaries of all employees rounding it to the nearest 1000.
select round()
mysql> select Round(sal,-3) from emp;
//select truncate(sal,-3) from emp;
//select ceil(sal,-3) from emp;
+---------------+
| Round(sal,-3) |
+---------------+
|          5000 |
|          3000 |
|          2000 |
|          3000 |
|          1000 |
|          2000 |
+---------------+
6.	Find the names of all employees who do not receive any commission.
mysql> select ename from emp where comm is null;  //isnull function....not null
+---------+
| ename   |
+---------+
| KRISHNA |
| BHAVANA |
| CHETAN  |
| JAMILA  |
+---------+

7.	Display the names of all employees right-aligning them to 15 characters.
mysql> select lpad(ename,15,'*') from emp;
+--------------------+
| lpad(ename,15,'*') |
+--------------------+
| ********KRISHNA    |
| ********BHAVANA    |
| *********CHETAN    |
| *********JAMILA    |
| *******MAHENDRA    |
| ***********AJIT    |
+--------------------+

8.	Display the remainder of 9 divided by 5.
mysql> select Mod(9,5) from dual;
+----------+
| Mod(9,5) |
+----------+
|        4 |
+----------+

9.	Display the minimum SAL jobwise. 
mysql> select job,min(sal) from emp group by job;
+----------+----------+
| job      | min(sal) |
+----------+----------+
| MANAGER  |     2450 |
| CLERK    |     2850 |
| SALESMAN |     1250 |
+----------+----------+
   

10.	Display the DNAME and the corresponding ENAME.  
  All rows of DEPT table are to be displayed even if a particular DEPTNO has no employees.

mysql> (select dept.deptno,dept.dname,loc,ename from dept Right outer join emp on (dept.deptno=emp.deptno))
         UNION
       (select dept.deptno,dept.dname,loc,ename from dept left outer join emp on (dept.deptno=emp.deptno));
	   
+--------+------------+---------+----------+
| deptno | dname      | loc     | ename    |
+--------+------------+---------+----------+
|     10 | ACCOUNTING | NAGPUR  | KRISHNA  |
|     30 | SALES      | KOLKATA | BHAVANA  |
|     10 | ACCOUNTING | NAGPUR  | CHETAN   |
|     20 | RESEARCH   | DELHI   | JAMILA   |
|     30 | SALES      | KOLKATA | MAHENDRA |
|     30 | SALES      | KOLKATA | AJIT     |
|     40 | OPERATIONS | MUMBAI  | NULL     |
+--------+------------+---------+----------+

(select * from dept) union (select ename from emp);


==========================================================================================

Section II									(10 marks)

1. Write a stored procedure by the name of Simp_intr to calculate the amount of interest on a bank account. The formulae are:- 

	Intr = p*t*r/100
	Amt = p + Intr
    where:-
	Intr is the total interest earned.
	p is the principal, t is the number of years the money is earning interest, and r is the rate of interest.
    Your stored procedure should accept the values of p, t and r as parameters and insert the Interest and
	Total amount into a suitable TEMPP output table.  Calling program for the stored procedure need not be written.
	
	
Answer:

	
drop procedure if exists abc;
drop table if exists tempp;
Create table tempp
(
Principal float,
Time float,
Rate float,
Intrest float,
Amount float
);

delimiter //
    create procedure abc(p float, t float, r float)
         begin
			declare amt float;
			declare Intr float;
				set Intr=P*t*r/100;
				set Amt=p+Intr;
				
				insert into tempp values(p,t,r,Intr,amt);
	     end; //
delimiter ;

call abc(3000,2,10);
select * from tempp;

mysql> select * from tempp;
+-----------+------+------+---------+--------+
| Principal | Time | Rate | Intrest | Amount |
+-----------+------+------+---------+--------+
|      3000 |    2 |   10 |     600 |   3600 |
+-----------+------+------+---------+--------+


===========================================================================================
2.	Write a stored function by the name of Days_between.  
    The stored function should accept ‘D1’ and ‘D2’ as date parameters.  
	The stored function should return the number of days between the two dates.  
	Calling program for the stored function need not be written.
	
	drop function if exists Days_between;
drop PROCEDURE if exists pqr;
drop table if exists tempp;
Create table tempp
(
Num varchar(20),
Days_between int
);


/* ............................................................. */
delimiter //
create function Days_between(D1 date,D2 date)
   returns int
   deterministic
   begin
		return datediff(D1,D2);
	
   end; //
delimiter ;

/* ............................................................. */

select Days_between('2021-12-03','2021-12-01') "TOTAL DAYS" from dual;
select Days_between('2021-11-10','2012-11-11') "TOTAL DAYS"from dual;


	
	
==========================================================================================