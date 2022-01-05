29.11.2021
=================================================
       SQL CONSTRAINTS(v.v.Imp)
=================================================
* limitation/restrictions imposed 

====================================================================
   Primary key(Primary column)
====================================================================
* column or set of columns that uniquely indentifies a ROW
* duplicate values are not allowed(has to be unique)
* null values are not allowed(has to be unique)
* its recommended that every table should have a primary key(helps from a 
  long term perspective)
* Purpose of primary key is row uniqueness (with the help of primary
  key you can distinguish between 2 rows of a table)  
* its recommended that every table should have a primary KEY
  (helps from long-term perspective)
* text and blob cannot be primary key.
* unique index automatically created.
* Composite Primary key-> combine 2 or more columns together to server the purpose of primary KEY
* can combine upto 32 columns in a composite key.
* if you have a composite primary key,then composite unique index automatically created
* you can have only 1 primary key constraint per table


=================================================================
  Candidate Key
================================================================

Candidate Key->is not a CONSTRAINTS
Candidate Key->is a defination
CANDIDATE KEY -> besides the Primary column, any other coumn in the table that can also serve
           the purpose of Primary key, is a good candidate for Primary key, is known as Candidate key


Steps for identifying Primary key: -
1. Key element will be Primary key of your table
2. If you cannot identify some element, then try for Composite Primary key
3. If you cannot identify Composite Primary key, then add an extra column to the table to serve the purpose of Primary key



================================================================
   SURROGATE KEY 
=================================================================

SURROGATE KEY -> is not a constraint
SURROGATE KEY -> is a definition
SURROGATE KEY -> if you add an extra column to the table to serve the purpose of Primary key,
                 then such a Primary key is known as Surrogate key(char datatype is recommended)
		
		
CREATE table emp(empno int(4) primary key,
                 ename varchar(20),
				 sal float,
				 deptno int(4));
				
insert into emp values(1,'A',5000,1);
insert into emp values(2,'A',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);	
mysql> select * from emp;
+-------+-------+------+--------+
| empno | ename | sal  | deptno |
+-------+-------+------+--------+
|     1 | A     | 5000 |      1 |
|     2 | A     | 6000 |      1 |
|     3 | C     | 7000 |      1 |
|     4 | D     | 9000 |      2 |
|     5 | E     | 8000 |      2 |
+-------+-------+------+--------+
5 rows in set (0.00 sec)

mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | int         | NO   | PRI | NULL    |       |
| ename  | varchar(20) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

insert into emp values(5,'F',8000,2);<--error
ERROR 1062 (23000): Duplicate entry '5' for key 'emp.PRIMARY'


* all constraints are at server level (you may perform the DML operations using any front-end s/w, the constraints will always be valid)
*internally a constraint is a MySQL created function; it performs the validations.

Select * from information_schema.table_constraints;
Select * from information_schema.table_constraints;
where table_schema=

Select * from information_schema.key_column_usage
where table_name='emp';
+-------------------------+-----------------------+------------------------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME | TABLE_CATALOG | TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME | ORDINAL_POSITION | POSITION_IN_UNIQUE_CONSTRAINT | REFERENCED_TABLE_SCHEMA | REFERENCED_TABLE_NAME | REFERENCED_COLUMN_NAME |
+--------------------+-------------------+-----------------+---------------+--------------+------------+-------------+------------------+-------------------------------+-------------------------+-----------------------+------------------------+
| def                | dbms              | PRIMARY         | def           | dbms         | emp        | empno       |                1 |                          NULL | NULL                    | NULL                  | NULL                   |
+--------------------+-------------------+-----------------+---------------+--------------+------------+-------------+------------------+-------------------------------+-------------------------+-----------------------+------------------------+

* show indexes from emp;

create table emp( empno char (4),
                 ename varchar (25),
				  sal float, 
				  deptno int, 
				  primary key (deptno, empno));


				  
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+



Constraints are of 2 types:
1. Column level constraint (specified on 1 column)
2. Table level constraint (specified on 2 or more columns) (composite) (has to

be specified at the end of the structure)



===================================================================
  Not NULL
===================================================================

* null values are not allowed(is a mandatory column)(smiliar to Primary key)
* duplicate values are allowed(unlike Primary key)
* you can have any number of not null constraints per table(unlike primary key)
* always a column level constraints


CREATE table emp(empno int(4),
                 ename varchar(20) not null,
				 sal float not null,
				 deptno int(4));
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | int         | YES  |     | NULL    |       |
| ename  | varchar(20) | NO   |     | NULL    |       |
| sal    | float       | NO   |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


* in MySQL nullabaity is part of the datatype
to see the not null columns:-
desc emp;



--------------------------------------------------
to add the not null constraint afterward to an existinf table;
--------------------------------------------------

alter table emp modify ename varchar(25) not null;
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(25) | NO   |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+



==========================================================
   to drop the not null constraint 
==========================================================

alter table emp modify ename varchar(25)  null;
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+



Solution for candidate key columns:
------------------------------------------------------
* Prgrammer older days use primary key =>not null constraint + unique index
------------------------------------------------------
* with the help of above,you can "indireclty" have multiple primary key
constraints in a table


Alternate Key->is not a CONSTRAINTS
Alternate key->is a defination
Alternate key->for the candidate key column if you specify a not null CONSTRAINTS and you 
               create an unique index,then it becomes an alternative to primary key,then such
               a candidate key is known as alternate key.



==========================================================================
   Super key
==========================================================================

Super Key->is not a CONSTRAINTS
Super  key->is a defination
Alternate key->if you have an alternate key in the table,then the primary key column is known as super key.



==========================================================================
  Unique Constraints 
==========================================================================

* duplicate values are not allowed(smiliar to pk)
* null values allowed(you can specify any number )
* text and blob cannot be UNIQUE
* unique index is created automatically
* you can combine upte 32 Columns in a composite UNIQUE
* you can have any number of unique constraints per table(unlike primary key)


create table emp( empno char (4),
                 ename varchar (25),
				  sal float, 
				  deptno int, 
				  mob_no char(15) unique,
				  unique(deptno, empno));
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | YES  |     | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  | MUL | NULL    |       |
| mob_no | char(15)    | YES  | UNI | NULL    |       |
+--------+-------------+------+-----+---------+-------+

* unique index is created automatically;
show indexes from emp;
mysql> show indexes from emp;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| emp   |          0 | mob_no   |            1 | mob_no      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| emp   |          0 | deptno   |            1 | deptno      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| emp   |          0 | deptno   |            2 | empno       | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+----
MOBNO
DEPTNO

Unique constraint is aslo an index,so to drop the unique CONSTRAINTS
drop index mob_no on emp;
drop index deptno on emp;

to add the constarint afterwards

alter table emp add unique(mob_no);

OR
alter table emp add constraint u_emp_mob_no unique(mob_no);

Constraint u_emp_mob_no->this is the constraint name
constraint u_emp_mob_no->optional

				  
Mob no<-column level CONSTRAINTS
unique(deptno, empno));<-table level constraints 

* column level constraint can be specified at table level (at the end f the structure), but a table level 
  composite constraint can never be specified at column level column level constraint 
* column level constraint can be specified at table level (at the end of the structure),except for the 
  not null constraint, which is always a column level constraint, and therefore the syntax will not support
  specifying it at table level (at the end of Structure)



===========================================================================
  FOREIGN key
===========================================================================

drop table emp;
CREATE table emp(empno int(4) primary key,
                 ename varchar(20),
				 sal float,
				 depto int(4),
				 mgr int(4));
				
insert into emp values(1,'A',5000,1,1);
insert into emp values(2,'B',6000,1,1);
insert into emp values(3,'C',7000,1,1);
insert into emp values(4,'D',9000,2,2);
insert into emp values(5,'E',8000,2,2);
insert into emp values(6'F',8000,2,2);

CREATE table dept(deptno int(4),dname varchar(20),loc VARCHAR(20));
insert into dept values(1,'TRN','Bby');
insert into dept values(2,'EXP','Dlh');
insert into dept values(3,'MKTG','Cal');


* FOREIGN KEY (foreign column)(column that has been drived from elsewhere)
* column or set of column that REFERENCES a column or set of columns of some table
* Foregin key constraint is specified on child column not the paretn column
* parent column has to be primary key or UNIQUE
  (this is pre-requisite for foregin key)		
* Foregin key(child column) will allow duplicate values(unless specified otherwise)
* text and blob cannot be Foreign key
* index for the child column is nor created automatically over here
  (if you want the index then you will have to create it manully)
* Foreign key (child column) may reference column of same table(known as self -REFERENCES)




Step 1: (Parent table)


CREATE table dept(deptno int primary key,dname varchar(20),loc VARCHAR(20));
insert into dept values(1,'TRN','Bby');
insert into dept values(2,'EXP','Dlh');
insert into dept values(3,'MKTG','Cal');
 mysql> select * from dept;
+--------+-------+------+
| deptno | dname | loc  |
+--------+-------+------+
|      1 | TRN   | Bby  |
|      2 | EXP   | Dlh  |
|      3 | MKTG  | Cal  |
+--------+-------+------+
mysql> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| deptno | int         | NO   | PRI | NULL    |       |
| dname  | varchar(20) | YES  |     | NULL    |       |
| loc    | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


step 2: 

CREATE table emp(empno char(4) primary key,
                 ename varchar(20),
				 sal float,
				 deptno int,
				 mgr char(4),
				 constraint fk_emp_deptno foreign key(deptno) references dept(deptno),
				 constraint fk_emp_mgr foreign key(mgr) references emp(empno) );
				 
insert into emp values(1,'A',5000,1,1);
insert into emp values(2,'B',6000,1,1);
insert into emp values(3,'C',7000,1,1);
insert into emp values(4,'D',9000,2,2);
insert into emp values(5,'E',8000,2,2);
insert into emp values(6,'F',8000,2,2);

Constraint fk_emp_deptno-> is optional
Constraint fk_emp_mgr-> is optional

* select * from information_schema.table_constraints;
* select * from information_schema.table_constraints
  where table_schema='dbms';
* select * from information_schema.table_constraints
  where table_name='emp';



mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(20) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  | MUL | NULL    |       |
| mgr    | char(4)     | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+

mysql> select * from emp;
+-------+-------+------+--------+------+
| empno | ename | sal  | deptno | mgr  |
+-------+-------+------+--------+------+
| 1     | A     | 5000 |      1 | 1    |
| 2     | B     | 6000 |      1 | 1    |
| 3     | C     | 7000 |      1 | 1    |
| 4     | D     | 9000 |      2 | 2    |
| 5     | E     | 8000 |      2 | 2    |
| 6     | F     | 8000 |      2 | 2    |
+-------+-------+------+--------+------+



======================================================
   Drop the constraints 
=====================================================
alter table emp drop foreign key fk_emp_deptno;


======================================================
   Update the constraints 
=====================================================
if want the constraint afterwards to an existing table:

alter table emp 
   add constraint fk_emp_deptno
         foreign key(deptno) references dept(deptno);
		 
		 
		 
=====================================================
   delete the constraints 
=====================================================

* If you delete the parent row then MySQl will automatically
  delete the child rows also
* you can delete the parent row when child rows EXISTS

1. delete from emp where deptno=2;
2. delete from dept where deptno=2;



=====================================================
   On DELETE Cascade
=====================================================
* if you delete Pareent row then MySQL will automtically delete the child row also
1. delete from dept where deptno=2;

CREATE table emp
(empno char(4) primary key,
 ename varchar(20),
 sal float,
 deptno int,
 mgr char(4),
 constraint fk_emp_deptno foreign key(deptno) references dept(deptno) on delete cascade,
 constraint fk_emp_mgr foreign key(mgr) references emp(empno) );
 
 mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(20) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  | MUL | NULL    |       |
| mgr    | char(4)     | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+

delete from dept where deptno=2;

to preserve the child rows:
1. update emp set deptno=null where deptno=2;
2. delete from dept where deptno=2;

* you can update the parent column provided the child rows dont EXISTS
  update dept set deptno=4 where deptno=3;

* you cannot update the parent column provided the child rows EXISTS
  update dept set deptno=4 where deptno=2;



=====================================================
   On Update Cascade
=====================================================
if you update the parent column then MySQL will updte the chils rows also


CREATE table emp
(empno char(4) primary key,
 ename varchar(20),
 sal float,
 deptno int,
 mgr char(4),
 constraint fk_emp_deptno foreign key(deptno) references dept(deptno) on delete cascade on update cascade,
 constraint fk_emp_mgr foreign key(mgr) references emp(empno));



update dept set deptno=4 where deptno=2;



================================================
  Check constarint
===============================================
* used for validations(used for checking purpose)
* e.g. delydate>=orderdate, age>21 etc



create table emp 
(
empno int,
ename varchar(25) check (ename=upper(ename)),
sal FLOAT check (sal>5000 and sal<20000),
deptno int,
status char(1) default 'T',
mob_no char(15),
comm float,
check(sal+comm <30000));


mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | int         | YES  |     | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
| status | char(1)     | YES  |     | T       |       |
| mob_no | char(15)    | YES  |     | NULL    |       |
| comm   | float       | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


follwing is possible

* sal FLOAT check (sal>5000 and sal<20000),
* sal FLOAT check (sal between 5000 and 20000),
sal FLOAT default 2000


* status char(1) default 'T'
* status char(1) check (status in('T','P','R')),

ename varchar(25) check (ename=upper(ename)),
T TEMPORARY
P PERMANENT
R retried
check (sal>5000 OR sal<20000),



* if you specit
* deault is not a constraint 
* default is a clause that you can use with create table
* to make use of deafault value use the follwing



create table emp 
(
empno int,
ename varchar(25) check (ename=upper(ename)),
sal FLOAT check (sal>5000 and sal<20000),
deptno int,
status char(1) default 'T',
mob_no char(15),
comm float,
check(emp.sal+emp.comm<30000)
);

mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | int         | YES  |     | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
| status | char(1)     | YES  |     | T       |       |
| mob_no | char(15)    | YES  |     | NULL    |       |
| comm   | float       | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

* if you specify some value, then it will take that value,
* if nothing is specified, then it will take DEFAULT value 
* DEFAULT is not a constraint
* DEFAULT is a clause that you can use with CREATE TABLE
* to make use of DEFAULT value and AUTO INCREMENT, use the following
  INSERT statement: -

insert into emp (ename, deptno, comm, mob_no)
values(......................................);
=============================================================================