MySQL SQL -
============================================================================================
Read and Write Consistency :
============================================================================================
* in a multi-user environment,
  when you SELECT from a table, you can view only the committed data of other users
  plus the changes made by you

* when you UPDATE or DELETE a row, that row is automatically locked for other users ROW 
  LOCKING IS AUTOMATIC IN MySQL AND ORACLE

* when you UPDATE or DELETE a row, that row becomes READ ONLY for other users

* other users can SELECT from that table; they will view the old data before your changes

* other users can INSERT rows into that table

* other users can UPDATE/DELETE "other" rows from that table no other user can 
  UPDATE or DELETE your locked row, till you have issued a Rollback or Commit

* LOCKS ARE AUTOMATICALLY RELEASED WHEN YOU ROLLBACK OR COMMIT


OPTMISTIC ROW LOCKING MECHANISM OF MySQL -> automatic row locking
PESIMISTIC ROW LOCKING -> you manually lock the rows in advance BEFORE issuing UPDATE or DELETE


* To lock the rows manually, you have to use SELECT statement with the FOR UPDATE clause
e.g. select * from dept for update; select from emp for update;

SQL> select from emp where deptno = 10 for update wait;
SQL> select from emp where deptno = 10 for update nowait;
SQL> select from emp where deptno = 10 for update wait 60;<- seconds



--> if row is avilable, then it will acquire the lock if row is unavailable,
    then it will wait in the Request queue for the specified time period; 
     accordingly it will acquire the lock or abort the operation


SQL> select from emp where deptno = 10 for update nowait;
--> if row is avilable, then it will acquire the lock if row is unavailable, then it will abort the operation

* To try out Row locking in MySQL Workbench: -
Click on Query (menu at the top) -> 
New tab to current server >
click on it now you have 2 query windows to try out locking



Type here to search
To try out Row locking in MySQL Workbench, if you get stuck in the Request Queue, to abor the oprtation: -
Click on Query (menu at the top) -> Click on Stop
Manual row locking in MySQL :
WAIT and NOWAIT options are not available in MySQL


============================================================================================
MySQL - SQL - Character Functions
============================================================================================
1. Rouutine that Returns a value (return statement) 
2. You can parameters/arguments to a function
3. Function can be overloaded

create table emp(fname varchar(20),lname varchar(20));
mysql> insert into emp values('Arun','Purun'),('Tarun','Arun'),('Sirun','Kirun'),('Nutan','Puran');
mysql> select * from emp;
+-------+-------+
| fname | lname |
+-------+-------+
| Arun  | Purun |
| Tarun | Arun  |
| Sirun | Kirun |
| Nutan | Puran |
+-------+-------+
select fname,lname from emp;
mysql> select fname,lname from emp;
+-------+-------+
| fname | lname |
+-------+-------+
| Arun  | Purun |
| Tarun | Arun  |
| Sirun | Kirun |
| Nutan | Puran |
+-------+-------+
============================================================================================
Concatenate-to join
============================================================================================
Concat(str1,str2)
Select concat(fname,lname)from emp;
mysql> Select concat(fname,lname)from emp;
+---------------------+
| concat(fname,lname) |
+---------------------+
| ArunPurun           |
| TarunArun           |
| SirunKirun          |
| NutanPuran          |
+---------------------+
to blankspace in the middle
Select concat(fname,'',lname)from emp;--will not work because to accecpt two parameters/arguments

* use nested function outerfunction and innerfunction
* innerfunction will executed then outer function executed
* max upto 255 leveles for function withib function(common for all RBBMS)
* upper limit will exceeded by views


concat(str1,str2,str3........strn)

mysql> select concat(concat(fname,' '),lname) from emp;
+---------------------------------+
| concat(concat(fname,' '),lname) |
+---------------------------------+
| Arun Purun                      |
| Tarun Arun                      |
| Sirun Kirun                     |
| Nutan Puran                     |
+---------------------------------+

mysql> Select concat('Mr. ',fname,' ',lname)from emp;
+--------------------------------+
| concat('Mr. ',fname,' ',lname) |
+--------------------------------+
| Mr. Arun Purun                 |
| Mr. Tarun Arun                 |
| Mr. Sirun Kirun                |
| Mr. Nutan Puran                |
+--------------------------------+
mysql> select upper(fname) from emp;
+--------------+
| upper(fname) |
+--------------+
| ARUN         |
| TARUN        |
| SIRUN        |
| NUTAN        |
+--------------+

update emp set fname=upper(fname);
mysql> select * from emp;
+-------+-------+
| fname | lname |
+-------+-------+
| ARUN  | Purun |
| TARUN | Arun  |
| SIRUN | Kirun |
| NUTAN | Puran |
+-------+-------+

mysql> select lower(fname)from emp;
+--------------+
| lower(fname) |
+--------------+
| arun         |
| tarun        |
| sirun        |
| nutan        |
+--------------+

In orcale 
Solutuion for case-insensitive query in oracle:
mysql> select * from emp where lower(fname)='arun';
+-------+-------+
| fname | lname |
+-------+-------+
| Arun  | Purun |
+-------+-------+
In oracle
select initcap(fanme)from emp;
select Ucase(Sname) from Salespeople;
select Ucase(left(Sname,1)) from Salespeople;
select substring(sname,2) from Salespeople;
select Concat(substring(sname,2,5)) from Salespeople;
select Concat(Ucase(left(Sname,1)),substring(sname,2)) from Salespeople;

mysql> select * from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  |  San Jose | 0.13 |
+-------+-------++-------++-------++-
============================================================================================
Leftpad and rightpad
============================================================================================
Uses
left pad use;
1. right justification output
2. billing receipt
3. cheque printing

Right pad use;
1.left justification
2.to convert varchar to char(varible length to fixed length)


mysql> select lpad(fname,25,' ')from emp;
+---------------------------+
| lpad(fname,25,' ')        |
+---------------------------+
|                      Arun |
|                     Tarun |
|                     Sirun |
|                     Nutan |
+---------------------------+

mysql> select lpad(fname,25,'*')from emp;
+---------------------------+
| lpad(fname,25,'*')        |
+---------------------------+
| *********************Arun |
| ********************Tarun |
| ********************Sirun |
| ********************Nutan |
+---------------------------+

mysql> select rpad(fname,25,' ')from emp;
+---------------------------+
| rpad(fname,25,' ')        |
+---------------------------+
| Arun                      |
| Tarun                     |
| Sirun                     |
| Nutan                     |
+---------------------------+

mysql> select rpad(fname,25,'*')from emp;
+---------------------------+
| rpad(fname,25,'*')        |
+---------------------------+
| Arun********************* |
| Tarun******************** |
| Sirun******************** |
| Nutan******************** |
+---------------------------+

============================================================================================
left trim and right trim
============================================================================================4
select rtrim(ename)from emp;
============================================================================================
use:
* char data(not columns) to varchar convert(data type convert)
* fixed length to fixed LENGTH
* right justification of char COLUMNS
  lpad(rtrim(ename),....,...)
  
  (*interview Question)



mysql>  select rtrim(fname)from emp;
+--------------+
| rtrim(fname) |
+--------------+
| Arun         |
| Tarun        |
| Sirun        |
| Nutan        |
+--------------+

mysql>  select ltrim(fname)from emp;
+--------------+
| ltrim(fname) |
+--------------+
| Arun         |
| Tarun        |
| Sirun        |
| Nutan        |
+--------------+



============================================================================================
Substring
============================================================================================

select substr(ename,'un') from emp;(not work in mysql only works with ORACLE)
* 3rd paramter compulsaory

select substr(ename,'un') from emp;
returns starting position of string if string is not found then it return 0.

Use:
1.to check if one string exists in another string
2.substr(instr(experience,'oracle'))

mysql> select substr(fname,3) from emp;
+-----------------+
| substr(fname,3) |
+-----------------+
| un              |
| run             |
| run             |
| tan             |
+-----------------+

mysql> select substr(fname,4) from emp;
+-----------------+
| substr(fname,4) |
+-----------------+
| n               |
| un              |
| un              |
| an              |
+-----------------+


(fname,3,2) 
* starting postition
* number of characters
*  minus sign start from end


mysql> select substr(fname,3,2) from emp;
+-------------------+
| substr(fname,3,2) |
+-------------------+
| un                |
| ru                |
| ru                |
| ta                |
+-------------------+
4 rows in set (0.00 sec)

mysql> select substr(fname,3,5) from emp;
+-------------------+
| substr(fname,3,5) |
+-------------------+
| un                |
| run               |
| run               |
| tan               |
+-------------------+

(fname,-3)
* last character 
* stop character
* use exact part of string to executed

mysql> select substr(fname,-3) from emp;
+------------------+
| substr(fname,-3) |
+------------------+
| run              |
| run              |
| run              |
| tan              |
+------------------+
mysql> select substr(fname,-3,2) from emp;
+--------------------+
| substr(fname,-3,2) |
+--------------------+
| ru                 |
| ru                 |
| ru                 |
| ta                 |
+--------------------+

mysql> select substr('Dnyaneshwar',-3) from emp;
+--------------------------+
| substr('Dnyaneshwar',-3) |
+--------------------------+
| war                      |
| war                      |
| war                      |
| war                      |
+--------------------------+


mysql> select substr('Dnyaneshwar',3) from emp;
+-------------------------+
| substr('Dnyaneshwar',3) |
+-------------------------+
| yaneshwar               |
| yaneshwar               |
| yaneshwar               |
| yaneshwar               |
+-------------------------+


mysql> select substr('Dnyaneshwar',3,1) from emp;
+---------------------------+
| substr('Dnyaneshwar',3,1) |
+---------------------------+
| y                         |
| y                         |
| y                         |
| y                         |
+---------------------------+
mysql> select substr('Dnyaneshwar',3,5) from emp;
+---------------------------+
| substr('Dnyaneshwar',3,5) |
+---------------------------+
| yanes                     |
| yanes                     |
| yanes                     |
| yanes                     |
+---------------------------+

mysql> select substr('Dnyaneshwar',1,5) from emp;
+---------------------------+
| substr('Dnyaneshwar',1,5) |
+---------------------------+
| Dnyan                     |
| Dnyan                     |
| Dnyan                     |
| Dnyan                     |
+---------------------------+
mysql> select substr('Dnyaneshwar',-5) from emp;
+--------------------------+
| substr('Dnyaneshwar',-5) |
+--------------------------+
| shwar                    |
| shwar                    |
| shwar                    |
| shwar                    |
+--------------------------+

mysql> select substr('Dnyaneshwar',-5,2) from emp;
+----------------------------+
| substr('Dnyaneshwar',-5,2) |
+----------------------------+-
| sh                         |
| sh                         |
| sh                         |
| sh                         |
+----------------------------+


============================================================================================
Replace
============================================================================================
mysql> select replace('Dnyaneshwar','ane','abc') from emp;
+------------------------------------+
| replace('Dnyaneshwar','ane','abc') |
+------------------------------------+
| Dnyabcshwar                        |
| Dnyabcshwar                        |
| Dnyabcshwar                        |
| Dnyabcshwar                        |
+------------------------------------+


============================================================================================
length
============================================================================================
select length(ename) from emp;
============================================================================================
USE
length of string

mysql> select length(fname) from emp;
+---------------+
| length(fname) |
+---------------+
|             4 |
|             5 |
|             5 |
|             5 |
+---------------+

============================================================================================
Ascii function
============================================================================================
* Ascii first character

mysql> select * from emp;
+-------+-------+
| fname | lname |
+-------+-------+
| Arun  | Purun |
| Tarun | Arun  |
| Sirun | Kirun |
| Nutan | Puran |
+-------+-------+
4 rows in set (0.00 sec)

mysql> select ascii(fname) from emp;
+--------------+
| ascii(fname) |
+--------------+
|           65 |
|           84 |
|           83 |
|           78 |
+--------------+

mysql> select ascii(substr(fname,2)) from emp;
+------------------------+
| ascii(substr(fname,2)) |
+------------------------+
|                    114 |
|                     97 |
|                    105 |
|                    117 |
+------------------------+
4 rows in set (0.00 sec)

mysql> select ascii(substr(fname,-1)) from emp;
+-------------------------+
| ascii(substr(fname,-1)) |
+-------------------------+
|                     110 |
|                     110 |
|                     110 |
|                     110 |
+-------------------------+
4 rows in set (0.00 sec)

mysql> select ascii(substr(fname,-4)) from emp;
+-------------------------+
| ascii(substr(fname,-4)) |
+-------------------------+
|                      65 |
|                      97 |
|                     105 |
|                     117 |
+-------------------------+
4 rows in set (0.00 sec)

return ascii value of small ZONE
it will work for each in emp table;

mysql> select ascii('z') from emp;
+------------+
| ascii('z') |
+------------+
|        122 |
|        122 |
|        122 |
|        122 |
+------------+
why 3 times output?
it will work for each in emp table.
total number of ROWS

mysql> select distinct ascii('z') from emp;
+------------+
| ascii('z') |
+------------+
|        122 |
+------------+


* dual is a system TABLE(common for RDBMS)
* it contains only 1 row and 1 COLUMNS
* dual is a dummy table

mysql> select 3*12 from dual;
+------+
| 3*12 |
+------+
|   36 |
+------+

mysql> select 'welcome Dnyaneshwar' from dual;
+---------------------+
| welcome Dnyaneshwar |
+---------------------+
| welcome Dnyaneshwar |
+---------------------+

============================================================================================
Char function --opposite to ascii function--
============================================================================================

mysql> select char(65) from dual;
+--------------------+
| char(65)           |
+--------------------+
| 0x41               |
+--------------------+
select * from emp where soundex(fname)=soundex('aruun');
mysql> select * from emp where soundex(fname)=soundex('aruun');
+-------+-------+
| fname | lname |
+-------+-------+
| Arun  | Purun |
+-------+-------+
============================================================================================






