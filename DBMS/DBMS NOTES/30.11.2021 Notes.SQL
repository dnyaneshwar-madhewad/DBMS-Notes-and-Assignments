30.11.2021
=================================================
  System table
=================================================
Data is of 2 types
1. user data 
* user created
   e.g. tables and indexes

2. System data

* System created (MySQL created) data that is stored in the System tables
* 63 System tables in MySQL (automatically created when you install MySQL)
* system tables store complete information about the database 
* stored in information_schema
   e.g. statistics (stores indexes information), table_constraints,
   key_column_usage, table_privileges, etc.
* set of System tables is known as DATA DICTIONARY
(also known as DATABASE CATALOG)
* all the System tables are READ ONLY; you can only SELECT from the System tables, you cannot INSERT, UPDATE, and DELETE.
* DDL for user is DML for system table.



=========================================================
  Stored Objects
=========================================================
Stored Objects

USER 1:
Owner PGDAC1:

schema-Cdac Mumbai PGDAG SEP 2021

CREATE table emp(empno int(4),
                 ename varchar(20),
				 sal float,
				 deptno int(4));
				
insert into emp values(1,'A',5000,1);
insert into emp values(2,'B',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);

mysql> select * from emp;
+-------+-------+------+-------+
| empno | ename | sal  | depto |
+-------+-------+------+-------+
|     1 | A     | 5000 |     1 |
|     2 | B     | 6000 |     1 |
|     3 | C     | 7000 |     1 |
|     4 | D     | 9000 |     2 |
|     5 | E     | 8000 |     2 |
+-------+-------+------+-------+


User 2: SCOTT



==========================================
 View  (DDL cmd)
===========================================
* present in all RDBMS and some DBMS also
* view is handle to a table
* view is a hard disk pointer(stores the address of table)
* Hard disk pointer Known as a LOCATOR
* used for indirect access to the TABLE
* used for security purposes
* view is a stored query
* used to restrict the column ACCESS 
* view does not contain DATA
* only defination stores,data is not stores.
* view is a stored query
* select statement on which is based,it is stored in database IN
  the complied format.
* view is an executable format of select statement 
* DML operation can be performed on a VIEW
* DML operations done on a view will affect the base table
* Constraints that are specified on the table will be enforeced even
  when you insert via the view 
* Entire application is built using views
* used to restrict row access 
* view with check OPTION


Used of view
* used for security purposes
(explain with example in interview)

use: used to exceed the limits of SQL 
e.g: 1. function within function>255 levless
     2. Subqueries>255 leveles
	 3. union >255 Select statement


----------------------------------------------------
misperception:
* view slowdown SYSTEM(False)
ANS: compiled format that plan is ready...directly execute..hence is faster
----------------------------------------------------


Syantax:

crate view viewname..........;

PGDAC_MYSQL>Create view V1
             AS
			select empno,ename from emp;
			
PGDAC_MYSQL>view created
mysql> select * from V1;
+-------+-------+
| empno | ename |
+-------+-------+
|     1 | A     |
|     2 | B     |
|     3 | C     |
|     4 | D     |
|     5 | E     |
+-------+-------+

mysql>  desc v1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| empno | int         | YES  |     | NULL    |       |
| ename | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

PGDAC_MYSQL>grant select on V1 to scott;
mysql> SELECT user FROM mysql.user;
+------------------+
| user             |
+------------------+
| mysql.infoschema |
| mysql.session    |
| mysql.sys        |
| root             |
+------------------+

scott_mysql>select * from cdacmumbaipgdacsep2021.emp;<-error
scott_mysql>select * from cdacmumbaipgdacsep2021.V;<-RUN
scott_mysql>insert into cdacmumbaipgdacsep2021.emp values(6,'F');
scott_mysql>insert into cdacmumbaipgdacsep2021.V1 values(6,'F');




PGDAC_MYSQL>drop view v1;
*only ownner can drop view.

PGDAC_MYSQL>create view v2
            AS
			select * from emp where deptno=1 with check option;
PGDAC_MYSQL>view created
PGDAC_MYSQL>grant select,insert on v2 to Nanu,Dnyanu;
Nanu_MYSQL>Select * from cdacmumbaipgdacsep2021.v2;

* used to restrict row ACCESS

Nanu_MYSQL>insert into cdacmumbaipgdacsep2021.v2 values(6,'F',6000,2);
      Nanu tries to insert into department no=2....not allowed
* view with check option is similar to check CONSTRAINTS
  with the help of this features you can enforce different check for different users.
  
  
------------------------------------------------------------
 Nanu_MYSQL>drop view v2;
 
 create view v1 
 as 
 select ename from emp;
 
 to change the select statement on which the view is based:
 
 drop view v1;
 create view v1 as select ..............................;
 
-----------------------------------------------------------
 Best solution:
 
 Create or replace view v1
 as 
 select ename,sal from emp;
 
 desc v1;
-----------------------------------------------------------
 
 Create or replace view v1
 as 
 select ename,sal*12 from emp;
 
 mysql> select * from v1;
+-------+--------+
| ename | sal*12 |
+-------+--------+
| A     |  60000 |
| B     |  72000 |
| C     |  84000 |
| D     | 108000 |
| E     |  96000 |
+-------+--------+

 
 insert into v1('NANU',1000)<---Oracle allwed not in mySQL
 
 * view based on computed COLUMNS
 * you can only select from this view
 * DML Operations are not allowed(common for all RDBMS)
 * in oracle you can perform DML Operations on this view by writting insted of trigger
 * DML operation are not allowed(Common for all RDBMS)

--------------------------------------------------------------
 create or replace view v1
 AS
 select dname,ename from emp,dept
 where dept.deptno=emp.deptno;
 
  * view based on JOIN
  * you can only select from this view
  * DML operation are not allowed(Common for all RDBMS)
 
 show tables <--will shows tables and views but it wont tell which is which
 show full tables;<--will show with type
 
 
 mysql>  show full tables;
+----------------+------------+
| Tables_in_dbms | Table_type |
+----------------+------------+
| customers      | BASE TABLE |
| dept           | BASE TABLE |
| salespeople    | BASE TABLE |
| spj            | BASE TABLE |
| v1             | VIEW       |
| v2             | VIEW       |
+----------------+------------+

to see the select statement on which the view is based:
show create view v1;



----------------------------------------------------------------
   Q. Can i create view based on view?
----------------------------------------------------------------
ans: yes
use: used to exceed the limits of SQL 
e.g: 1. function within function>255 levless
     2. Subqueries>255 leveles
	 3. union >255 Select statement
	
	
* view basesd on view to simplify the writing of complex SELECT statement 
  e.g.join of 20 TABLES
  
---------------------------------------------------------------



mysql> use information_schema;
Database changed
mysql> show tables;
mysql> show full tables;



======================================================================
   MySQL-PL  (Procedural Language)
======================================================================

* product of MySQL
* works only with MySQL RDBMS
* MySQL- programming Language
* programming language of MySQL
* used for databases programming
  e.g. HRA_CALC,ATTENDANCE_CALC, TAX_CAL etc
* used for server-side data processing
* MySQL PL programm can be called from  MySQL command Line Client
* MySQL Workbench,Oracle Forms, Oracle Reports, Menus, Graphics
  Oracle Apex(Oracle Application Express),java, MS .Net etc
* cab be called through any front-end software
* 4th Generation Language(JAVA,C++)...Support few OOPS features...not powerful as java
* execute top to bottom..(no main function)
* you can have block wihtin block(Nesting block)
* block level Language
* screen input and screen output is not allowed
  (e.g. scanf,printf,system.out.println....not allowed)
* MySQL-PL is used only for processing 
* can use SELECT statement inside the block but its not recommended
* SQL commands that are allowed inside the block
   DDL, DML, DQL, DTL/TCL
* DCL commands are not allowed inside the block

  


MSSQL Server->TSQL->Transact SQL
ORACLE->PL/SQL->Procedural Language SQL
MySQL>call hra_calc();


------------------------------------------------------------

Syantax:

......................................................
BEGIN
Insert into dept values(1,'A','B');
END;
......................................................

//this is known as MySQL Block  BEGIN...END;
// this program will add a row into department 



------------------------------------------------------------
   You can have block wihtin block(Nesting block)
------------------------------------------------------------


....................................................
BEGIN  //Main block...Parent block....Outer Block
   
    BEGIN  //Sub Block....Child block....Inner Block
         Insert into dept values(1,'A','B');
    END;
	
END;
...................................................



* upper limit for subbock 4095....(1024*4)-1=4095
* block level Language
-------------------------------------------------------------------
  Q. benifit block level language
-------------------------------------------------------------------
1. Modularity..Large programming can be breoken into tiny unit(seprate block for attendacne tax)
2. Control the Scope of variable
   Encapsulation(form of Data hinding)
3. Exception(efficient error management)
-------------------------------------------------------------------
To store the output of MySQL-PL program

Create table tempp
(
fir int,
sec char(15)
);


mysql> desc tempp;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| fir   | int      | YES  |     | NULL    |       |
| sec   | char(15) | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+



--------------------------------------------------------------------
   Stored PROCEDURE 
-------------------------------------------------------------------

* MySQL-PL program is writtern in the form of stored PROCEDURE 
* object stored that are stored in the database in stored OBJECT
* CREATE....tables,indexed,views


Stored Procedures:
* Routine(set of commands) that has to be called explicitly
* stored in the database 
* global procedure 
* can be called through MySQL command Line Client,MySQL Workbench
  JAVA, MS.NET, etc.
* Can be called through any front-end software
* stored in the database in the COMPILED format
* hence the execution will be very fast
* hiding source code from end user 
* execution is in server RAM
* stroed procedure can have local variables
* within the procedure you can have any processing
  all MySQL Pl statement allowed
  e.g. If statement, loops, cursors, etc
* one procedure can call another procedure 
* procedure can call itself(known as recursion)
* you can pass parameters to a procedure
* OVERLOADING of procedure is not allowed because its a stored OBJECT








-------------------------------------------------------------------
   Create PROCEDURE
-------------------------------------------------------------------

..................................
Create procedure abc()
begin
     insert into tempp values(1,'Hello');
end;
...................................

Procedure created-->>Read,compile, plan store it in DB in the Complied format
end;--> (; delimiter end of Command)


MySQL>Call abc();
MySQL>select * from tempp;
drop procedure abc;

------------------------------------------------------------------
==============================================================
   Program 1
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec char(15)
);



/* ............................................................. */
delimiter //
Create procedure abc()
begin
     insert into tempp values(1,'Hello');
end;//
delimiter ;
/*.............................................................*/

call abc;
select * from tempp;


+------+-------+
| fir  | sec   |
+------+-------+
|   1  | Hello |
+------+-------+



==============================================================
   Program 2 -->initialize x value
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec char(15)
);



/* ............................................................. */
delimiter //
create procedure abc()
begin 
  declare x int;
  set x=10;
  insert into tempp values(x,'Hello');
end;//
delimiter ;
/* ............................................................. */

call abc;
select * from tempp;



* in MySQL PL
  when you declare a variable ,if you dont initialize it,then it
  will stored a null value 
  
  mysql> create procedure abc()
    -> begin
    ->   declare x int;
    ->   set x=10;
    ->   insert into tempp values(x,'Hello');
    -> end;//
Query OK, 0 rows affected (0.13 sec)

mysql> delimiter ;
mysql> call abc;
Query OK, 1 row affected (0.17 sec)

mysql> select * from tempp;
+------+-------+
| fir  | sec   |
+------+-------+
|   10 | Hello |
+------+-------+

  
==============================================================
   Program 3  -->Char CDAC Mumbai 
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec char(15)
);



/* ............................................................. */
delimiter //
create procedure abc()
begin 
  declare x char(15) default 'CDAC Mumbai';
  insert into tempp values(1,x);
end;//
delimiter ;
/* ............................................................. */


call abc;
select * from tempp;

mysql> select * from tempp;
+------+-------------+
| fir  | sec         |
+------+-------------+
|    1 | CDAC Mumbai |
+------+-------------+





==============================================================
   Program 4 -->HRA Calculation
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec char(15)
);



/* ............................................................. */
delimiter //
create procedure abc()
begin 
  declare x char(15) default 'Dnyanesh';
  declare y float default 3000;
  declare z float default 0.4;
  declare hra float;
  set hra=y*z;
  insert into tempp values(y,x);
  insert into tempp values(hra,'HRA');
end;//
delimiter ;
/* ............................................................. */


call abc;
select * from tempp;

mysql> select * from tempp;
+------+----------+
| fir  | sec      |
+------+----------+
| 3000 | Dnyanesh |
| 1200 | HRA      |
+------+----------+



==============================================================
   Program 5  --> Paramter Passing
==============================================================

drop procedure if exists abc;
drop table if exists tempp;
Create table tempp
(
Name char(15),
fir int,
sec int
);



/* ............................................................. */
delimiter //
create procedure abc(x char(15), y float, z float)
begin 
  declare hra float;
  set hra=y*z;
  insert into tempp values(x,y,hra);
end;//
delimiter ;
/* ............................................................. */


call abc('Dnyanu',3000,0.25);
call abc('Dny',4000,0.20);
call abc('Nanu',5000,0.40);
select * from tempp;

mysql> select * from tempp;
+--------+------+------+
| Name   | fir  | sec  |
+--------+------+------+
| Dnyanu | 3000 |  750 |
| Dny    | 4000 |  800 |
| Nanu   | 5000 | 2000 |
+--------+------+------+


=====================================================================
drop procedure abc;
create procedure abc().........


to see which all procedures are avialable:
show procedure status;<-show all procedure in all DATABASE
show procedure status where db='cdacmumbaipgdacsep2021';
show procedure status where name like 'A%';


1
to view the source code of store procedure:
show  create procedure abc;


======================================================================================