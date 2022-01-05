SQL EXERCISE 1


Create table SEMP(EMPNO CHAR(4),EMPNAME CHAR(20),BASIC FLOAT,DEPTNO CHAR(2),DEPTHEAD CHAR(4));
insert into SEMP values('0001','SUNIL',6000,'10',null);
insert into SEMP values('0002','HIREN', 8000,'20',null);
insert into SEMP values('0003','ALI', 4000, 10,'0001');
insert into SEMP values('0004','GEORGE', 6000,null,'0002');


Create table SDEPT(DEPTNO CHAR(2),DEPTNAME CHAR(15));
insert into SDEPT values(10,'Development');
insert into SDEPT values(20,'Training');


create table S(`S#` varchar(10),SNAME varchar(10),STATUS int,CITY varchar(10));
mysql>insert into S values('s1','Smith',20,'London'), 
    ('s2','Jones',10,'Paris'),
	('s3','Blake',30,'Paris'),
	('s4','Clark',20,'London'),
	('s5','Adams',30,'Athens');
	
	
create table P(`P#` varchar(10),PNAME varchar(10),COLOR varchar(10),WEIGHT int,CITY varchar(10));
insert into P values('p1','nut','red',12,'London'),
                    ('p2','bolt','green',17,'Paris'), 
					('p3','screw','blue',17,'Rome'), 
					('p4','stapler','red',14,'London'),
					('p5','cam','blue',12,'Paris'), 
					('p6','cog','red',19,'London');


create table J(`J#` varchar(10),JNAME varchar(10),CITY varchar(10));
			  
insert into J values('j1','sorter','Paris'), 
                    ('j2','punch','Rome'), 
					('j3','reader','Athens'), 
					('j4','console','Athens'),
					('j5','collator','London'),
					('j6','terminal','Oslo'),
					('j7','tape','London');

create table SPJ(`S#` varchar(10),`P#` varchar(10),`J#` varchar(10),QTY int);
insert into SPJ values('s1','p1','j1',200),
                      ('s1','p1','j4',700),
					  ('s2','p3','j1',400),
					  ('s2','p3','j2',200),
					  ('s2','p3','j3',200),
					  ('s2','p3','j4',500),
					  ('s2','p3','j5',600),
					  ('s2','p3','j6',400),
					  ('s2','p3','j7',800),
					  ('s2','p5','j2',100),
					  ('s3','p3','j1',200),
					  ('s3','p4','j2',500),
					  ('s4','p6','j3',300);
select* from SPJ;


5. Display all the data from the S table.
mysql> select * from s;
+------+-------+--------+--------+
| S#   | SNAME | STATUS | CITY   |
+------+-------+--------+--------+
| s1   | Smith |     20 | London |
| s2   | Jones |     10 | Paris  |
| s3   | Blake |     30 | Paris  |
| s4   | Clark |     20 | London |
| s5   | Adams |     30 | Athens |
+------+-------+--------+--------+

6. Display only the S# and SNAME fields from the S table.
mysql> select 'S#',sname from s;
+----+-------+
| S# | sname |
+----+-------+
| S# | Smith |
| S# | Jones |
| S# | Blake |
| S# | Clark |
| S# | Adams |
+----+-------+

7. Display the PNAME and COLOR from the P table for the CITY=”London”.
mysql> select PNAME, COLOR from P where CITY = 'London';
+---------+-------+
| PNAME   | COLOR |
+---------+-------+
| nut     | red   |
| stapler | red   |
| cog     | red   |
+---------+-------+

8. Display all the Suppliers from London.
mysql> select * from s where city='London';
+------+-------+--------+--------+
| S#   | SNAME | STATUS | CITY   |
+------+-------+--------+--------+
| s1   | Smith |     20 | London |
| s4   | Clark |     20 | London |
+------+-------+--------+--------+


9. Display all the Suppliers from Paris or Athens.
mysql> select * from S where CITY = 'Paris' or CITY = 'Athens';
+------+-------+--------+--------+
| S#   | SNAME | STATUS | CITY   |
+------+-------+--------+--------+
| s2   | Jones |     10 | Paris  |
| s3   | Blake |     30 | Paris  |
| s5   | Adams |     30 | Athens |
+------+-------+--------+--------+

10. Display all the Projects in Athens.
mysql> select* from J where CITY = 'Athens';
+------+---------+--------+
| J#   | JNAME   | CITY   |
+------+---------+--------+
| j3   | reader  | Athens |
| j4   | console | Athens |
+------+---------+--------+

11. Display all the Partnames with the weight between 12 and 14 (inclusive of both).
mysql> select PNAME from P where WEIGHT between 12 and 14;
+---------+
| PNAME   |
+---------+
| nut     |
| stapler |
| cam     |
+---------+

12. Display all the Suppliers with a Status greater than or equal to 20.
mysql> select* from S where STATUS >= 20;
+------+-------+--------+--------+
| S#   | SNAME | STATUS | CITY   |
+------+-------+--------+--------+
| s1   | Smith |     20 | London |
| s3   | Blake |     30 | Paris  |
| s4   | Clark |     20 | London |
| s5   | Adams |     30 | Athens |
+------+-------+--------+--------+

13. Display all the Suppliers except the Suppliers from London.
mysql> select* from S where CITY !='London';
+------+-------+--------+--------+
| S#   | SNAME | STATUS | CITY   |
+------+-------+--------+--------+
| s2   | Jones |     10 | Paris  |
| s3   | Blake |     30 | Paris  |
| s5   | Adams |     30 | Athens |
+------+-------+--------+--------+


14. Display only the Cities from where the Suppliers come from.
mysql> select CITY from S;
+--------+
| CITY   |
+--------+
| London |
| Paris  |
| Paris  |
| London |
| Athens |
+--------+

15. Assuming that the Part Weight is in GRAMS, display the same in MILLIGRAMS and KILOGRAMS.
mysql> select WEIGHT"WEIGHT in GRAM", WEIGHT*0.001 "WEIGHT in KILOGRAMS", WEIGHT*1000"WEIGHT in MILLIGRAMS" from P;
+----------------+---------------------+----------------------+
| WEIGHT in GRAM | WEIGHT in KILOGRAMS | WEIGHT in MILLIGRAMS |
+----------------+---------------------+----------------------+
|             12 |               0.012 |                12000 |
|             17 |               0.017 |                17000 |
|             17 |               0.017 |                17000 |
|             14 |               0.014 |                14000 |
|             12 |               0.012 |                12000 |
|             19 |               0.019 |                19000 |
+----------------+---------------------+----------------------+


