1) __Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
-- Ascending and DEPARTMENT Descending;
Select * from workers order by first_name asc, department desc;

-- 2.__Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table;
select * from workers where first_name in( 'vipul', 'satish');

-- 3.__ Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets;
select * FROM Workers where length(first_name)=6 and (first_name) like '%h';


-- 4.__ Write an SQL query to print details of the Workers whose SALARY lies between 75000 to 100000;
select * from workers where salary between 75000 and 100000;

-- 5.__ Write an SQL query to fetch duplicate records having matching data in some fields of a table;
select * from workers;
select first_NAME, LAST_NAME,SALARY,DEPARTMENT,count(*) from WORKERS group by first_NAME, LAST_NAME,SALARY,DEPARTMENT having count(*)>1;


-- 6.__ Write an SQL query to show the top 6 records of a table;
select * from workers order by salary desc limit 6;

-- 7. __Write an SQL query to fetch the departments that have less than five people in them;
select department,count(department) from workers group by department having count(department)<5;

-- 8,__ Write an SQL query to show all departments along with the number of people in there;
select department,count(department) from workers group by department;

-- 9__Write an SQL query to print the name of employees having the highest salary in each department;
SELECT FIRST_NAME, salary, Department
FROM workers
WHERE (department, salary) IN (
    SELECT department, MAX(salary)
    FROM workers
    GROUP BY department);
    
    create table school (std_id int, std_name varchar(20),sex varchar(20), percentage int, class int, sec varchar(20),streams varchar(20),DOB timestamp);
    insert into school(std_id, std_name, sex, percentage, class, sec, streams,DOB)
    values(1001,'surekha_joshi','female',82,12,'A','Science','1995-02-03'),
    (1002,'mahi_agrawal','female',56,11,'c','commerce','2008-11-23'),
    (1003,'sanam_verma','male',59,11,'c','commerce','2008-06-29'),
    (1004,'ronit kumar','male',63,11,'c','commerce','1997-05-11'), 
	(1005,'dipesh pulkit','male',78,11,'b','science','2003-09-14'), 
    (1006,'jahanvi puri','female',60,11,'b','commerce','2008-07-11'),
    (1007,'sanam kumar','male',23,12,'c','commerce','1997-03-03'),
	(1008,'sahil saras','male',23,11,'c','commerce','2007-07-11'),
    (1009,'Akshara agrawal','female',72,12,'c','commerce','1996-01-11'),
    (1010,'shruti misra','female',39,11,'f','science','2008-11-23'),
    (1011,'harsh agrawal','male',42,11,'c','science','1998-03-08'),
	(1012,'nikunj agrawal','male',49,12,'c','science','1998-06-28'),
	(1013,'akriti sakshena','female',89,12,'a','science','2008-11-23'),
    (1014,'tani rastogi','female',82,12,'a','science','2008-11-23');
    
-- 1 To display all the records form STUDENT table. SELECT * FROM student ; 
  select * from school;
  
-- 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB 
-- FROM student;
select Std_name, DOB from school where std_name like 'mahi_agrawal';

-- 3. To display all students record where percentage is greater of equal to 80 FROM student table
select * from school where percentage >=80;

-- 4. To display student name, stream and percentage where percentage of student is more than 80 
select std_name,streams,percentage from school where percentage > 80;

-- 5. To display all records of science students whose percentage is more than 75 form student table;
select * from school where streams = 'science' and percentage > 75;





    

    