01.12.2021

==============================================================
   Program 6  -->
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
drop table if exists emp;

CREATE table emp(ename varchar(20),sal int(10),
job varchar(20),deptno int(4));
insert into emp values('NANU',8000,'Cleark',1);

Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/
delimiter //
create procedure abc()
begin 
  declare x int;
  select sal into x from emp 
   where ename='NANU';  or  where ename=y;
   /* processing,e.g. set hra=x*0.4,etc.   set hra=y*z;*/

  insert into tempp values(x,'NANU');
end;//
delimiter ;
/*...................................................................*/




call abc();
call abc('NANU');
select * from tempp;



==============================================================
   Program 7  -->
==============================================================


/*...................................................................*/

drop procedure if exists abc;
drop table if exists tempp ;
drop table if exists emp;
Create table tempp
(
fir int,
sec varchar(20)
);


CREATE table emp(ename varchar(20),sal int(10),
job varchar(20),deptno int(4));
insert into emp values('NANU',8000,'Cleark',1);
insert into emp values('KING',7000,'MANAGER',2);



/*...................................................................*/
delimiter //
create procedure abc()
begin
    declare x int;
    declare y char(15);
         select sal, job into x, y from emp
         where ename = 'NANU' ;
         /* processing, e.g. set hra = x*0.4; set y = lower(y), etc. */
         insert into tempp values(x , y);
    end; //
delimiter ;
/*...................................................................*/




call abc();
select * from tempp;
/*...................................................................*/

+------+--------+
| fir  | sec    |
+------+--------+
| 8000 | Cleark |
+------+--------+




==============================================================
   Program 8  -->if else  demo
==============================================================
drop table if exists emp;
drop procedure  if exists abc;
drop table if exists  tempp;
Create table tempp
(
fir int,
sec varchar(20)
);


CREATE table emp(ename varchar(20),sal int(10),
job varchar(20),deptno int(4));
insert into emp values('NANU',8000,'Cleark',1);
insert into emp values('KING',7000,'MANAGER',2);



/*...................................................................*/
delimiter //
create procedure abc()
begin
     declare x int;
     select sal into x from emp
     where ename = 'KING' ;

     if x > 4000 then
           insert into tempp values(x , 'High Sal');
     end if;
end; //
delimiter ;
/*...................................................................*/




call abc();
select * from tempp;

+------+----------+
| fir  | sec      |
+------+----------+
| 7000 | High Sal |
+------+----------+


==============================================================
   Program 9  -->if elseif else demo
==============================================================
if ................. then
.......................... ;
elseif................................. then
...........................;
elseif................................. then
...........................;
elseif................................. then
...........................;
elseif................................. then
...........................;
end if;

-----------------------------------------------------------------

drop procedure if exists abc;
drop table if exists tempp ;
drop table if exists emp;

Create table tempp
(
fir int,
sec varchar(20)
);


CREATE table emp(ename varchar(20),sal int(10));
insert into emp values('KING',5000);



/*...................................................................*/
delimiter //
create procedure abc()
begin
   declare x int;
       select sal into x from emp
       where ename = 'KING' ;
   if x > 4000 then
       insert into tempp values(x , 'High Sal');

   elseif x < 4000 then
       insert into tempp values(x , 'Low Sal');

   else
       insert into tempp values(x , 'Medium Sal');
   end if;
end; //
delimiter ;
/*...................................................................*/



call abc();
select * from tempp;

mysql> select * from tempp;
+------+----------+
| fir  | sec      |
+------+----------+
| 5000 | High Sal |
+------+----------+







==============================================================
   Program 10  -->Boolean Variable Deafault
==============================================================
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/

delimiter //
create procedure abc()
begin
      declare x boolean default TRUE;
      if x then
             insert into tempp values(1 , 'Mumbai');
     end if;
end; //
delimiter ;

/*...................................................................*/


call abc();
select * from tempp;

+------+--------+
| fir  | sec    |
+------+--------+
|    1 | Mumbai |
+------+--------+




==============================================================
   Program 11  -->While Loop DEMO
==============================================================

WHILE loop:

* check for condition before entering the loop
Syntax: -
     WHILE expression DO
         ............................................;
         ............................................;
     END WHILE;
* if you go inside infinite loop, you program still running
   on server. it will insert again agin till.it going cause server crash.
* call admin to kill program on server side   

--------------------------------------------------------------



drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/
delimiter //
create procedure abc()
begin
declare x int default 1;
while x < 10 do
insert into tempp values(x , 'in while loop');
set x = x+1;
end while;
end; //
delimiter ;

/*...................................................................*/


call abc();
select * from tempp;

mysql> select * from tempp;
+------+---------------+
| fir  | sec           |
+------+---------------+
|    1 | in while loop |
|    2 | in while loop |
|    3 | in while loop |
|    4 | in while loop |
|    5 | in while loop |
|    6 | in while loop |
|    7 | in while loop |
|    8 | in while loop |
|    9 | in while loop |
+------+---------------+



==============================================================
   Program 12  -->Nested While loop Demo
==============================================================


drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/
delimiter //
create procedure abc()
begin
         declare x int default 1;
         declare y int default 1;
         while x < 10 do
                 while y < 10 do
                       insert into tempp values(y , 'in y loop');
                       set y = y+1;
                 end while;
                 insert into tempp values (x, 'in x loop');
                 set x = x+1;
         end while;
end; //
delimiter ;
/*...................................................................*/


call abc();
select * from tempp;
mysql> select * from tempp;
+------+-----------+
| fir  | sec       |
+------+-----------+
|    1 | in y loop |
|    2 | in y loop |
|    3 | in y loop |
|    4 | in y loop |
|    5 | in y loop |
|    6 | in y loop |
|    7 | in y loop |
|    8 | in y loop |
|    9 | in y loop |
|    1 | in x loop |
|    2 | in x loop |
|    3 | in x loop |
|    4 | in x loop |
|    5 | in x loop |
|    6 | in x loop |
|    7 | in x loop |
|    8 | in x loop |
|    9 | in x loop |
+------+-----------+

==============================================================
   Program 12 -->Repeat Loop Similar to DO While loop
==============================================================
* there no condition to enter the loop, but there is conditon to 
  exit the LOOP
* it will execute atleast once(e.g. Outerjoin /Master-Deatails report)

Syatnax:

REPEAT
            ..................;
            ..................;
UNTIL expression_is_not_satisfied
END REPEAT;

----------------------------------------------------------------


drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/
delimiter //
create procedure abc()
begin
         declare x int default 1; 
         repeat
                insert into tempp values(x , 'in loop');
                set x = x+1;
         until x > 5
         end repeat;
end; //
delimiter ;

/*...................................................................*/


call abc();
select * from tempp;

mysql> select * from tempp;
+------+---------+
| fir  | sec     |
+------+---------+
|    1 | in loop |
|    2 | in loop |
|    3 | in loop |
|    4 | in loop |
|    5 | in loop |
+------+---------+


==============================================================
   Program 13 -->Loop, Leave and Iterative statements
==============================================================

* Leave statement allows you to exit the loop 
  (similar to 'break' statement)
* Iterate statement allows you to skip the entire code under it,
   and start a new iteration (similar to 'continue' statement)
* Loop statement executes a block of code repeatedly with an additional flexibilty of using LOOP
  LABEL (you can give a name to a loop)
  
-------------------------------------------------------------------------
  
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



/*...................................................................*/
delimiter //
create procedure abc()
  begin
         declare x int default 1;
            pqr_loop:loop
                   if x > 10 then
                        leave pqr_loop;
                   end if;
                        set x = x + 1;
                           if mod(x,2) != 0 then
                                 iterate pqr_loop;
                           else
                                 insert into tempp values (x , 'inside loop');
                   end if;
            end loop;
end; //
delimiter ;

/*...................................................................*/




call abc();
select * from tempp;

mysql> select * from tempp;
+------+-------------+
| fir  | sec         |
+------+-------------+
|    2 | inside loop |
|    4 | inside loop |
|    6 | inside loop |
|    8 | inside loop |
|   10 | inside loop |
+------+-------------+




==============================================================
      Session Variables
==============================================================

* Global variables

set @x = 10;
* @x remain in the RAM till you exit(end of session)
* can be accessed in all procedures


select @x from dual;
* you will have to create and initialize at the same time 



-----------------------------------------------------------------
drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);
set @x = 10;
select @x from dual;
insert into tempp values (@x, 'Hello World!');
select * from tempp;


mysql> set @x = 10;
mysql> select @x from dual;
+------+
| @x   |
+------+
|   10 |
+------+
mysql> insert into tempp values (@x, 'Hello World!');
mysql> select * from tempp;
+------+--------------+
| fir  | sec          |
+------+--------------+
|   10 | Hello World! |
+------+--------------+

Mysql > @x = x + 1;


============================================================================
    Cursor--- Most Important
============================================================================

* present in all RDBMS and also other some DBMS
* Cursor is a type of a variable
* Cursor can store multiple rows
* Cursor is similar to 2D ARRAY
* Cursor are used for processing multiple rows
* Cursor are used for storing multiple rows
* Cursor are used for handling multiple rows
* Cursor are used for storing the data temporarily
* Cursor is based on SELECT statement in MySQL



* Cursor is a READ_ONLY variable
* data that is present in cursor,it cannot be manipulated
* you will have to fetch 1 row at a time into some intermediate varaibles and do your processing with those variables
* can only fetch sequentially (top to bottom)
* YOU CANNOT FETCH BACKWARDS IN A Cursor
* can only fetch 1 row at a time


Create table tempp
(
fir int,
sec varchar(20)
);


CREATE table emp(empno int(4),
ename varchar(20),
sal float,
deptno int(4));

mysql> Select * from emp;
+-------+-------+------+--------+
| empno | ename | sal  | deptno |
+-------+-------+------+--------+
|     1 | A     | 5000 |      1 |
|     2 | B     | 6000 |      1 |
|     3 | C     | 7000 |      1 |
|     4 | D     | 9000 |      2 |
|     5 | E     | 8000 |      2 |
+-------+-------+------+--------+


==============================================================
   Program 14 -->Cursor Program
==============================================================

drop procedure if exists abc;
drop table if exists tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



drop table if exists emp;
CREATE table emp(empno int(4),
ename varchar(20),
sal float,
deptno int(4));
insert into emp values(1,'A',5000,1);
insert into emp values(2,'B',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);

Select * from emp;



/*...................................................................*/

delimiter //
delimiter //
create procedure abc()
begin
        declare a int;
        declare b varchar(15);
        declare c int;
        declare d int;
        declare y int default 0;
        declare c1 cursor for select * from emp; 
		/* cursor declaration/defination */
        /* (at this point,the cursor No contain data) */

            open c1;  /* it will execute select statement,and */
            		  /* it will populate the cursor C1 */
                while y < 5 do 
                    fetch c1 into a,b,c,d;
                    /* First row Fetech ...processing, e.g. set hra = c*0.4, etc */
                    insert into tempp values(a, b);
                    set y = y + 1;
                end while;
            close c1;
end; //
delimiter ;

/*...................................................................*/
call abc();
select * from tempp;

mysql> select * from tempp;
+------+------+
| fir  | sec  |
+------+------+
|    1 | A    |
|    2 | B    |
|    3 | C    |
|    4 | D    |
|    5 | E    |
+------+------+



==============================================================
   Program 15 -->cursor program with 3 row
==============================================================
drop procedure if exists abc;
drop table if exists  tempp ;
Create table tempp
(
fir int,
sec varchar(20)
);



drop table if exists emp;
CREATE table emp(empno int(4),
ename varchar(20),
sal float,
deptno int(4));
insert into emp values(1,'A',5000,1);
insert into emp values(2,'B',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);

Select * from emp;


/*...................................................................*/

delimiter //
create procedure abc()
begin
        declare a int;
        declare b varchar(15);
        declare c int;
        declare d int;
        declare y int default 0;
        declare c1 cursor for select * from emp;
            open c1;  
                while y < 3 do 
                    fetch c1 into a,b,c,d;
                       insert into tempp values(a, b);
                    set y = y + 1;
                end while;
            close c1;
end; //
delimiter ;

/*...................................................................*/
call abc();
select * from tempp;
mysql> select * from tempp;
+------+------+
| fir  | sec  |
+------+------+
|    1 | A    |
|    2 | B    |
|    3 | C    |
|    4 | D    |
|    5 | E    |
+------+------+


==============================================================
   Program 16 -->it will work for any number of rows 
==============================================================

drop procedure if exists abc;
drop table if exists  tempp ;
drop table if exists emp;

Create table tempp
(
fir int,
sec varchar(20)
);

CREATE table emp(empno int(4),
ename varchar(20),
sal float,
deptno int(4));
insert into emp values(1,'A',5000,1);
insert into emp values(2,'B',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);


/*...................................................................*/

delimiter //
create procedure abc()
begin
	declare a int;
	declare b varchar(15);
	declare c int;
	declare d int;
	declare y int default 0;
	declare z int;
	declare c1 cursor for select * from emp;
	select count(*) into z from emp;
	open c1;
	while y < z do
          fetch c1 into a,b,c,d;
          insert into tempp values(a, b);
          set y = y + 1;
	end while;
	close c1;
end; //
delimiter ;
/*...................................................................*/
call abc();
select * from tempp;

mysql> select * from tempp;
+------+------+
| fir  | sec  |
+------+------+
|    1 | A    |
|    2 | B    |
|    3 | C    |
|    4 | D    |
|    5 | E    |
+------+------+


=========================================================================
   Program 17 Continue Handler for not found exception(Cusor attributes)
========================================================================

drop procedure if exists abc;
drop table if exists  tempp ;
drop table if exists emp;

Create table tempp
(
fir int,
sec varchar(20)
);

CREATE table emp(empno int(4),
ename varchar(20),
sal float,
deptno int(4));
insert into emp values(1,'A',5000,1);
insert into emp values(2,'B',6000,1);
insert into emp values(3,'C',7000,1);
insert into emp values(4,'D',9000,2);
insert into emp values(5,'E',8000,2);


/*...................................................................*/
delimiter //
create procedure abc()
begin
	declare a int;
	declare b varchar(15);
	declare c int;
	declare d int;
	declare finished int default 0;
	declare c1 cursor for select * from emp;
	declare continue handler for not found set finished = 1;
		open c1;
			cursor_c1_loop : loop
			fetch c1 into a,b,c,d;
			if finished = 1 then
				leave cursor_c1_loop;
			end if;
				insert into tempp values(a, b);
			end loop cursor_c1_loop;
		close c1;
	end; //
delimiter ;

/*...................................................................*/
call abc();
select * from tempp ;

mysql> select * from tempp ;
+------+------+
| fir  | sec  |
+------+------+
|    1 | A    |
|    2 | B    |
|    3 | C    |
|    4 | D    |
|    5 | E    |
+------+------+

*NOT FOUND is a cursor attribute, it returns a boolean TRUE value if the last fetch was unsuccessful,
 and FALSE value it the last fetch was successful
