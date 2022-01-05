
=======================================================================================
TRUNCATE-----------cut the DATA
=======================================================================================
mysql> select truncate(3.6,1) from dual;
+-----------------+
| truncate(3.6,1) |
+-----------------+
|             3.6 |
+-----------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,1) from dual;
+------------------------+
| truncate(3125.65555,1) |
+------------------------+
|                 3125.6 |
+------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,2) from dual;
+------------------------+
| truncate(3125.65555,2) |
+------------------------+
|                3125.65 |
+------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,3) from dual;
+------------------------+
| truncate(3125.65555,3) |
+------------------------+
|               3125.655 |
+------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,-1) from dual;
+-------------------------+
| truncate(3125.65555,-1) |
+-------------------------+
|                    3120 |
+-------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,-2) from dual;
+-------------------------+
| truncate(3125.65555,-2) |
+-------------------------+
|                    3100 |
+-------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3125.65555,-3) from dual;
+-------------------------+
| truncate(3125.65555,-3) |
+-------------------------+
|                    3000 |
+-------------------------+
1 row in set (0.00 sec)

mysql> select truncate(3.6,0) from dual;
+-----------------+
| truncate(3.6,0) |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.03 sec)



=============================================================================================================
SIGN funcion:
=============================================================================================================
1.check if num is +ve or -ve
2.sign(sp-cp)
3.sign(temperature)
4.sign(blood_group)
5.medical report

mysql> select sign(-15) from dual;
+-----------+
| sign(-15) |
+-----------+
|        -1 |
+-----------+
1 row in set (0.29 sec)

mysql> select sign(15) from dual;
+----------+
| sign(15) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

mysql> select sign(0) from dual;
+---------+
| sign(0) |
+---------+
|       0 |
+---------+
1 row in set (0.00 sec)



=======================================================================================
MOD FUNCTION------remainder
=======================================================================================
mysql> select mod(9,5) from dual;
+----------+
| mod(9,5) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

mysql> select mod(8.22,2.2) from dual;
+---------------+
| mod(8.22,2.2) |
+---------------+
|          1.62 |
+---------------+
1 row in set (0.00 sec)

mysql> select mod(-8.22,2.2) from dual;
+----------------+
| mod(-8.22,2.2) |
+----------------+
|          -1.62 |
+----------------+
1 row in set (0.00 sec)


=======================================================================================
SQRT  SQAURE ROOT
=======================================================================================
mysql> select sqrt(81) from dual;
+----------+
| sqrt(81) |
+----------+
|        9 |
+----------+
1 row in set (0.00 sec)



=======================================================================================
POWER----------POWER FUNCTION
=======================================================================================
mysql> select power(10,3) from dual;
+-------------+
| power(10,3) |
+-------------+
|        1000 |
+-------------+
1 row in set (0.00 sec)

mysql> select round(power(1000,1/3)) from dual;
+------------------------+
| round(power(1000,1/3)) |
+------------------------+
|                     10 |
+------------------------+

mysql> select power(12,3) from dual;
+-------------+
| power(12,3) |
+-------------+
|        1728 |
+-------------+
1 row in set (0.00 sec)



=======================================================================================
CUBE ROOT----cube root
=======================================================================================
mysql> select power(1000,1/3) from dual;
+------------------+
| power(1000,1/3)  |
+------------------+
| 9.99999997697415 |
+------------------+
1 row in set (0.00 sec)



=======================================================================================
ABS---absolute value--alwasy return postive value
=======================================================================================
mysql> select abs(-10) from dual;
+----------+
| abs(-10) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)

mysql> select abs(-45) from dual;
+----------+
| abs(-45) |
+----------+
|       45 |
+----------+
1 row in set (0.00 sec)



=======================================================================================
Date FUNCTION---MYSQL
=======================================================================================

default date format
1.'YYYY/MM/DD'
2.range of date '1000/01/01 to '9999/12/31'';
3. date1-date 2===number of days
4.internally date is stored as fixed length NUMBER
  (number of days since 1st jan 1000 AD)
5. 7bytes Stores
6. date and time is stored together
7. default value=12am midnight
8. 1970 is the cut off year UNIX AandAT LAB
9. cut off year meeans what??


2021/11/24-Optional
21/11/24

60/11/24
2060/11/24 will be stored

EMP TABLE
---------------------------------------------
HIRE DATE
--------------------------------------------------
2019-10-15
2019-12-31
2020-01-15
---------------------------------------------------



==========================================================================================
SYSDATE:  RETURN THE DB SERVER DATE AND TIME
==========================================================================================
-----------------------------------------------------------------
mysql> select sysdate() from dual;
+---------------------+
| sysdate()           |
+---------------------+
| 2021-11-24 15:11:06 |
+---------------------+
date and time when statmenet executed;


=======================================================================================
mysql> select now() from dual;
=======================================================================================
+---------------------+
| now()               |
+---------------------+
| 2021-11-24 15:18:34 |
+---------------------+
1 row in set (0.00 sec)

date and time when began statmenet executed;
sysdate----current Date and TIME
now()------log operations insert delete update etc;


mysql> select sysdate(),now(),sleep(10),Sysdate(), now() from dual;
+---------------------+---------------------+-----------+---------------------+---------------------+
| sysdate()           | now()               | sleep(10) | Sysdate()           | now()               |
+---------------------+---------------------+-----------+---------------------+---------------------+
| 2021-11-24 15:22:38 | 2021-11-24 15:22:38 |         0 | 2021-11-24 15:22:48 | 2021-11-24 15:22:38 |
+---------------------+---------------------+-----------+---------------------+---------------------+



=======================================================================================
ADDDATE:
=======================================================================================
mysql> select adddate(sysdate(),1)from dual;
+----------------------+
| adddate(sysdate(),1) |
+----------------------+
| 2021-11-25 15:26:20  |
+----------------------+

mysql> select adddate(sysdate(),2)from dual;
+----------------------+
| adddate(sysdate(),2) |
+----------------------+
| 2021-11-26 15:27:13  |
+----------------------+
1 row in set (0.00 sec)
mysql> select adddate(sysdate(),7)from dual;
+----------------------+
| adddate(sysdate(),7) |
+----------------------+
| 2021-12-01 15:28:28  |
+----------------------+


mysql> select adddate(sysdate(),-1)from dual;
+-----------------------+
| adddate(sysdate(),-1) |
+-----------------------+
| 2021-11-23 15:29:00   |
+-----------------------+



========================================================
DATEDIFF
===========================================================
mysql> select datediff(sysdate(),odate) "TOTAL NUMBER OF DAYS " from orders;
+-----------------------+
| TOTAL NUMBER OF DAYS  |
+-----------------------+
|                 11375 |
|                 11375 |
|                 11375 |
|                 11375 |
|                 11375 |
|                 11374 |
|                 11374 |
|                 11373 |
|                 11372 |
|                 11372 |
+-----------------------+
10 rows in set (0.00 sec)

Sysdate():25.11.2021
mysql> select datediff(sysdate(),'2021-11-21') "DATE" from orders;
+------+
| DATE |
+------+
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
|    4 |
+------+



=======================================================================================
DATE_ADD
=======================================================================================
adding two month:
mysql> select date_add(odate,interval 2 month)from orders;
+----------------------------------+
| date_add(odate,interval 2 month) |
+----------------------------------+
| 1990-12-03                       |
| 1990-12-03                       |
| 1990-12-03                       |
| 1990-12-03                       |
| 1990-12-03                       |
| 1990-12-04                       |
| 1990-12-04                       |
| 1990-12-05                       |
| 1990-12-06                       |
| 1990-12-06                       |
+----------------------------------+

removing two month
mysql> select date_add(odate,interval -2 month)from orders;
+-----------------------------------+
| date_add(odate,interval -2 month) |
+-----------------------------------+
| 1990-08-03                        |
| 1990-08-03                        |
| 1990-08-03                        |
| 1990-08-03                        |
| 1990-08-03                        |
| 1990-08-04                        |
| 1990-08-04                        |
| 1990-08-05                        |
| 1990-08-06                        |
| 1990-08-06                        |
+-----------------------------------+


ADD 2 YEAR 
mysql> select date_add(odate,interval 2 year)from orders;
+---------------------------------+
| date_add(odate,interval 2 year) |
+---------------------------------+
| 1992-10-03                      |
| 1992-10-03                      |
| 1992-10-03                      |
| 1992-10-03                      |
| 1992-10-03                      |
| 1992-10-04                      |
| 1992-10-04                      |
| 1992-10-05                      |
| 1992-10-06                      |
| 1992-10-06                      |
+---------------------------------+
10 rows in set (0.00 sec)


remove -2 YEAR
mysql> select date_add(odate,interval -2 year)from orders;
+----------------------------------+
| date_add(odate,interval -2 year) |
+----------------------------------+
| 1988-10-03                       |
| 1988-10-03                       |
| 1988-10-03                       |
| 1988-10-03                       |
| 1988-10-03                       |
| 1988-10-04                       |
| 1988-10-04                       |
| 1988-10-05                       |
| 1988-10-06                       |
| 1988-10-06                       |
+----------------------------------+


adding days in DATE
mysql> select date_add(odate,interval -2 day)from orders;
+---------------------------------+
| date_add(odate,interval -2 day) |
+---------------------------------+
| 1990-10-01                      |
| 1990-10-01                      |
| 1990-10-01                      |
| 1990-10-01                      |
| 1990-10-01                      |
| 1990-10-02                      |
| 1990-10-02                      |
| 1990-10-03                      |
| 1990-10-04                      |
| 1990-10-04                      |
+---------------------------------+
10 rows in set (0.00 sec)



=======================================================================================
LAST_DATE....last date of the month
=======================================================================================
this functiom avalable on only MYSQL and ORACLE ONLYYYYYYYY
USE ---attendance calculation,intrest calcaulation,overtime
mysql> select last_day(odate)from orders;
+-----------------+
| last_day(odate) |
+-----------------+
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
| 1990-10-31      |
+-----------------+


=======================================================================================
DAYNAME:the day of th weeks
=======================================================================================
initcap:DEFAULT
mysql> select dayname(sysdate())from dual;
+--------------------+
| dayname(sysdate()) |
+--------------------+
| Wednesday          |
+--------------------+


ALL CASE UPPPER CASE FORMAT
mysql> select upper(dayname(sysdate()))from dual;
+---------------------------+
| upper(dayname(sysdate())) |
+---------------------------+
| WEDNESDAY                 |
+---------------------------+


UPTO 3 SUBTRING----WEDNESDAY
mysql> select substr(dayname(sysdate()),1,3) from dual;
+--------------------------------+
| substr(dayname(sysdate()),1,3) |
+--------------------------------+
| Wed                            |
+--------------------------------+


=======================================================================================
ADD TIME
=======================================================================================
ADD ONE SECOND TO TIME 
mysql> select addtime('2010-01-15 11:00:00','1') from dual;
+------------------------------------+
| addtime('2010-01-15 11:00:00','1') |
+------------------------------------+
| 2010-01-15 11:00:01                |
+------------------------------------+

ADD 1 HOUR TO TIME
mysql> select addtime('2010-01-15 11:00:00','1:00:00') from dual;
+------------------------------------------+
| addtime('2010-01-15 11:00:00','1:00:00') |
+------------------------------------------+
| 2010-01-15 12:00:00                      |
+------------------------------------------+

SUBTRACT MINUS TIME
mysql> select addtime('2010-01-15 11:00:00','-1:43:25') from dual;
+-------------------------------------------+
| addtime('2010-01-15 11:00:00','-1:43:25') |
+-------------------------------------------+
| 2010-01-15 09:16:35                       |
+-------------------------------------------+

UPTO 6 DIGIT WE CAN ADD
mysql> select addtime('2010-01-15 11:00:00','1:43:12.123456') from dual;
+-------------------------------------------------+
| addtime('2010-01-15 11:00:00','1:43:12.123456') |
+-------------------------------------------------+
| 2010-01-15 12:43:12.123456                      |
+-------------------------------------------------+



=======================================================================================
LIST FUNCTIONS
=======================================================================================
* any comprarision done with null,returns null.

select * from emp where comm=null;
pessimistic query->searching for null values;


Special treatment:

mysql> select * from orders where cnum=null;
Empty set (0.00 sec)(no output)
mysql> select * from orders where cnum is null;
will give output:
is null->its special operator

mysql> select * from orders where cnum!=null;
Empty set (0.00 sec)
mysql> select * from orders where cnum is not null;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3010 |  309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
it will show zero also; if available



======================================================

mysql> select * from orders where cnum is not null;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
mysql> select amt+snum from orders;
+----------+
| amt+snum |
+----------+
|  1025.69 |
|  1768.19 |
|  2904.10 |
|  6162.45 |
|  2105.16 |
|  2716.23 |
|  1077.75 |
|  5724.00 |
|  1311.95 |
| 10892.88 |
+----------+

mysql> select amt+ifnull(snum,0) from orders;
+--------------------+
| amt+ifnull(snum,0) |
+--------------------+
|            1025.69 |
|            1768.19 |
|            2904.10 |
|            6162.45 |
|            2105.16 |
|            2716.23 |
|            1077.75 |
|            5724.00 |
|            1311.95 |
|           10892.88 |
+--------------------+

if null works with all datatypes;

ifnull(comm,0);
ifnull(comm,100);
ifnull(comm,'mumbai');
ifnull(comm,'2021-04-01');



=======================================================================================
least and greatest
=======================================================================================
select least(amt,3000) from orders;
mysql> select least(amt,1000) from orders;
+-----------------+
| least(amt,1000) |
+-----------------+
|           18.69 |
|          767.19 |
|         1000.00 |
|         1000.00 |
|         1000.00 |
|         1000.00 |
|           75.75 |
|         1000.00 |
|          309.95 |
|         1000.00 |
+-----------------+
select greatest (amt,300)from orders;
mysql> select greatest(amt,1000) from orders;
+--------------------+
| greatest(amt,1000) |
+--------------------+
|            1000.00 |
|            1000.00 |
|            1900.10 |
|            5160.45 |
|            1098.16 |
|            1713.23 |
|            1000.00 |
|            4723.00 |
|            1000.00 |
|            9891.88 |
+--------------------+



=======================================================================================
Case Expression
=======================================================================================

select 
CASE
when deptno=10 then 'Training'
when deptno=20 then 'sales'
when deptno=30 then 'experts'
else 'OTHERS'
end
from emp;

Training
Training
OTHERS

mysql> select
    -> case
    -> when onum=3001 then 'dnyansh'
    -> when onum=3005 then 'nano'
    -> when onum=3010 then 'dnyaneshwar'
    -> else 'others'
    -> end "case expression"
    -> from orders;
+-----------------+
| case expression |
+-----------------+
| dnyansh         |
| others          |
| others          |
| nano            |
| others          |
| others          |
| others          |
| others          |
| dnyaneshwar     |
| others          |
+-----------------+


=======================================================================================
Enviroment FUNCTION
=======================================================================================
mysql> select user() from dual;
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+

=======================================================================================
show character set total 41
=======================================================================================
mysql> show character set;
+----------+---------------------------------+---------------------+--------+
| Charset  | Description                     | Default collation   | Maxlen |
+----------+---------------------------------+---------------------+--------+
| armscii8 | ARMSCII-8 Armenian              | armscii8_general_ci |      1 |
| ascii    | US ASCII                        | ascii_general_ci    |      1 |
| big5     | Big5 Traditional Chinese        | big5_chinese_ci     |      2 |
| binary   | Binary pseudo charset           | binary              |      1 |
| cp1250   | Windows Central European        | cp1250_general_ci   |      1 |
| cp1251   | Windows Cyrillic                | cp1251_general_ci   |      1 |
| cp1256   | Windows Arabic                  | cp1256_general_ci   |      1 |
| cp1257   | Windows Baltic                  | cp1257_general_ci   |      1 |
| cp850    | DOS West European               | cp850_general_ci    |      1 |
| cp852    | DOS Central European            | cp852_general_ci    |      1 |
| cp866    | DOS Russian                     | cp866_general_ci    |      1 |
| cp932    | SJIS for Windows Japanese       | cp932_japanese_ci   |      2 |
| dec8     | DEC West European               | dec8_swedish_ci     |      1 |
| eucjpms  | UJIS for Windows Japanese       | eucjpms_japanese_ci |      3 |
| euckr    | EUC-KR Korean                   | euckr_korean_ci     |      2 |
| gb18030  | China National Standard GB18030 | gb18030_chinese_ci  |      4 |
| gb2312   | GB2312 Simplified Chinese       | gb2312_chinese_ci   |      2 |
| gbk      | GBK Simplified Chinese          | gbk_chinese_ci      |      2 |
| geostd8  | GEOSTD8 Georgian                | geostd8_general_ci  |      1 |
| greek    | ISO 8859-7 Greek                | greek_general_ci    |      1 |
| hebrew   | ISO 8859-8 Hebrew               | hebrew_general_ci   |      1 |
| hp8      | HP West European                | hp8_english_ci      |      1 |
| keybcs2  | DOS Kamenicky Czech-Slovak      | keybcs2_general_ci  |      1 |
| koi8r    | KOI8-R Relcom Russian           | koi8r_general_ci    |      1 |
| koi8u    | KOI8-U Ukrainian                | koi8u_general_ci    |      1 |
| latin1   | cp1252 West European            | latin1_swedish_ci   |      1 |
| latin2   | ISO 8859-2 Central European     | latin2_general_ci   |      1 |
| latin5   | ISO 8859-9 Turkish              | latin5_turkish_ci   |      1 |
| latin7   | ISO 8859-13 Baltic              | latin7_general_ci   |      1 |
| macce    | Mac Central European            | macce_general_ci    |      1 |
| macroman | Mac West European               | macroman_general_ci |      1 |
| sjis     | Shift-JIS Japanese              | sjis_japanese_ci    |      2 |
| swe7     | 7bit Swedish                    | swe7_swedish_ci     |      1 |
| tis620   | TIS620 Thai                     | tis620_thai_ci      |      1 |
| ucs2     | UCS-2 Unicode                   | ucs2_general_ci     |      2 |
| ujis     | EUC-JP Japanese                 | ujis_japanese_ci    |      3 |
| utf16    | UTF-16 Unicode                  | utf16_general_ci    |      4 |
| utf16le  | UTF-16LE Unicode                | utf16le_general_ci  |      4 |
| utf32    | UTF-32 Unicode                  | utf32_general_ci    |      4 |
| utf8     | UTF-8 Unicode                   | utf8_general_ci     |      3 |
| utf8mb4  | UTF-8 Unicode                   | utf8mb4_0900_ai_ci  |      4 |
+----------+---------------------------------+---------------------+--------+


=======================================================================================
Aggregate FUNCTION
=======================================================================================
CREATE table emp(empno int(4),ename varchar(20),sal int(10),deptno int(4),job VARCHAR(20),mgr VARCHAR(20));
insert into emp values(1,'arun',8000,1,'M','4');
insert into emp values(2,'ali',7000,1,'C','1');
insert into emp values(3,'kiran',3000,1,'C','1');
insert into emp values(4,'jack',9000,2,'M',null);
insert into emp values(5,'Thomas',8000,2,'C',4);

mysql> select * from emp;
+-------+--------+------+--------+------+------+
| empno | ename  | sal  | deptno | job  | mgr  |
+-------+--------+------+--------+------+------+
|     1 | arun   | 8000 |      1 | M    | 4    |
|     2 | ali    | 7000 |      1 | C    | 1    |
|     3 | kiran  | 3000 |      1 | C    | 1    |
|     4 | jack   | 9000 |      2 | M    | NULL |
|     5 | Thomas | 8000 |      2 | C    | 4    |
+-------+--------+------+--------+------+------+

arun is reporting to jack
ali is reporting to arun
emp jack is not reporting to any one because he may be CEO of company
mgr=manager


SINGLE ROW FUNCTION
will operate on 1 row at a TIME
number date list enviromenet FUNCTION
e.g. upper(ename)

Multi ROW FUNCTION



Q. how does select statment internally working?
Ans. 
ALL data is Server Hardisk
All processing is done at server Ram
Server RAM: Only SUM(SAL) colums will load on Server RAM
that empno,empname,deptno,job,mgr will not load in ram.
MYSQL will put this into array this will be one dimesional ARRAY.
then it goes inside for loop and then done calculation
only 5 bytes will send server to client.



mysql> select sum(sal) from emp;
+----------+
| sum(sal) |
+----------+
|    35000 |
+----------+

mysql> select avg(sal) from emp;
+-----------+
| avg(sal)  |
+-----------+
| 7000.0000 |
+-----------+
1 row in set (0.00 sec)

mysql> select max(sal) from emp;
+----------+
| max(sal) |
+----------+
|     9000 |
+----------+
1 row in set (0.00 sec)

mysql> select min(sal) from emp;
+----------+
| min(sal) |
+----------+
|     3000 |
+----------+
1 row in set (0.00 sec)

mysql> select count(sal) from emp;
+------------+
| count(sal) |
+------------+
|          5 |
+------------+
1 row in set (0.00 sec)

mysql> insert into emp values(6,'Dnyanshwar',null,2,'M',null);
Query OK, 1 row affected (0.18 sec)

mysql> select * from emp;
+-------+------------+------+--------+------+------+
| empno | ename      | sal  | deptno | job  | mgr  |
+-------+------------+------+--------+------+------+
|     1 | arun       | 8000 |      1 | M    | 4    |
|     2 | ali        | 7000 |      1 | C    | 1    |
|     3 | kiran      | 3000 |      1 | C    | 1    |
|     4 | jack       | 9000 |      2 | M    | NULL |
|     5 | Thomas     | 8000 |      2 | C    | 4    |
|     6 | Dnyanshwar | NULL |      2 | M    | NULL |
+-------+------------+------+--------+------+------+
mysql> select sum(sal) from emp;
+----------+
| sum(sal) |
+----------+
|    35000 |
+----------+

that is no need of IFNULL statment
Null values are not counted by group funcion.out will same as above

mysql> select avg(ifnull(sal,0)) from emp;
+--------------------+
| avg(ifnull(sal,0)) |
+--------------------+
|          5833.3333 |
+--------------------+
it will put 0 where sal=null 

mysql> select count(*) from emp;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
it will return total number of rows. also count the null VALUE;


mysql> select sum(sal) from emp where deptno=1;
+----------+
| sum(sal) |
+----------+
|    18000 |
+----------+
Q.how does internally works with where clause?
Server RAM will search SAL and DEPTNO 1 will loaded only in RAM
calculation done.
import thing is here all salary column will not loaded in RAM.only deptno 1 will loaded;

select count(*) from emp where sal>7000;

mysql> select count(*) from emp where sal>7000;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
COUNT QUERY(counting the number query hits)


RATIO.
select max(sal)/min(sal) from emp;
mysql> select max(sal)/min(sal) from emp;
+-------------------+
| max(sal)/min(sal) |
+-------------------+
|            3.0000 |
+-------------------+

select max(sal)/count(*) from emp;

AVG:
mysql> select sum(sal)/count(*) from emp;
+-------------------+
| sum(sal)/count(*) |
+-------------------+
|         5833.3333 |
+-------------------+
function within function(slower)


select avg(ifnull(sal,0)) from emp;
mysql> select avg(ifnull(sal,0)) from emp;(recommded because fater)
+--------------------+
| avg(ifnull(sal,0)) |
+--------------------+
|          5833.3333 |
+--------------------+

mysql> select stddev(sal) from emp;
+-------------------+
| stddev(sal)       |
+-------------------+
| 2097.617696340303 |
+-------------------+
1 row in set (0.00 sec)

mysql> select variance(sal) from emp;
+---------------+
| variance(sal) |
+---------------+
|       4400000 |
+---------------+


min,max,count with works all data types
sum avg stddev.variance works with int data types.

assumption last row sal is 8000

SUMMERY report
select count(*),min(sal),max(sal),sum(sal), avg(sal) "Summery Report" from emp;
mysql> select count(*),min(sal),max(sal),sum(sal), avg(sal) "Summery Report" from emp;
+----------+----------+----------+----------+----------------+
| count(*) | min(sal) | max(sal) | sum(sal) | Summery Report |
+----------+----------+----------+----------+----------------+
|        5 |     3000 |     9000 |    35000 |      7000.0000 |
+----------+----------+----------+----------+----------------+
=======================================================================================






