USE HR;
-- 1__ Display all information in the tables EMP and DEPT;
select * from employees;
select * from departments;

-- 2__ Display only the hire date and employee name for each employee;
select first_name,hire_date from employees;

-- 3__ Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title;
select concat(first_name,' , ',job_id) from employees as employee_tital;

-- 4__ Display the hire date, name and department number for all clerks;
select hire_date,first_name,department_id from employees where job_id LIKE '%CLERK';

-- 5__ Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT;
select concat_ws(' , ',employee_id, first_name, last_name, email, phone_number,hire_date, job_id, salary, commission_pct, manager_id,department_id) from employees;

-- 6__Display the names and salaries of all employees with a salary greater than 2000;
select first_name, salary from employees where salary > 2000;

-- 7 Display the names and dates of employees with the column headers Name and Start Date;
select first_name as name,hire_date as start_date from employees;

-- 8__Display the names and hire dates of all employees in the order they were hired;
select first_name,hire_date from employees order by hire_date;

-- 9__ Display the names and salaries of all employees in reverse salary order;
select first_name,salary from employees order by salary desc;

-- 10__ Display ename and deptno who are all earned commission and display salary in reverse order;
select first_name ,department_id,salary from employees where commission_pct is not null order by salary desc;

-- 11__ Display the last name and job title of all employees who do not have a manager;
select last_name,job_id from employees where job_id not like '%MAN';

-- 12__ Display the last name, job, and salary for all employees whose job is sales representative 
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000;
select last_name,job_id,salary from employees where job_id like 'SA_MAN' and salary <> 2500 <>3500 <>5000;

-- 1__ Display the maximum, minimum and average salary and commission earned;
select min(salary),max(salary),avg(salary) as avg_salary,
max(commission_pct) as max_commission,min(commission_pct) as min_commission, avg(commission_pct) as avg_commission from employees;

-- 2__ Display the department number, total salary payout and total commission payout for 
-- each department;
select department_id, sum(salary) As total_salary_payout,sum(commission_pct) as total_commission_payout from employees group by department_id;

-- 3__ Display the department number and number of employees in each department;
select department_id,count(first_name)from employees group by department_id order by department_id;

-- 4__ Display the department number and total salary of employees in each department;
select department_id,sum(salary) from employees group by department_id;

-- 5__ Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name;
select first_name from employees where commission_pct is null order by first_name;

-- 6__ Display the employees name, department id and commission. If an Employee doesnt 
-- earn the commission, then display as 'No commission'. Name the columns appropriately;
select first_name,employee_id,commission_pct,case when commission_pct is null then 'No commission' else 'commission' end as 'commission' from employees;

-- 7__ Display the employees name, salary and commission multiplied by 2 If an Employee doesnt earn the commission, then display as No -- -- --commission. Name the columns appropriately;
select first_name,salary * 2,commission_pct * 2, case when commission_pct is null then 'No commission'else 'commission' end as 'commission' from employees;

-- 8__ Display the employee name, department id who have the first name same as another 
-- employee in the same department;
SELECT first_name ,department_id from employees where first_name in (select first_name from employees where department_id = department_id group by first_name having count(*) > 1);

-- 9__ Display the sum of salaries of the employees working under each Manager;
select sum(salary), Job_id from employees where job_id like '%MAN' group by Job_id;

-- 10__ Select the Managers id, the count of employees working under and the department 
-- ID of the manager;
select first_name, count(*), department_id from employees where 
job_id like '%man' and department_id in (select department_id from employees 
group by department_id having count(department_id) > 1) group by first_name, department_id;

-- 11__ Select the employee name, department id, and the salary. Group the result with the 
-- manager id and the employee last name should have second letter a!; 
select first_name, department_id,salary,manager_id from employees where substring(last_name,2,1) ='a' group by first_name, manager_id,department_id,salary;

-- 12__ Display the average of sum of the salaries and group the result with the department id
-- Order the result with the department id;
select department_id, avg(salary), sum(salary) from employees group by department_id order by department_id;

-- 13__ Select the maximum salary of each department along with the department id;
select department_id, max(Salary) from employees group by department_id;

-- 14__ Display the commission, if not null display 10% of salary, if null display a default value 1;
select commission_pct,case when commission_pct is not null then 10% salary else 1 end as 'commission' from employees;

-- 1__ Write a query that displays the employee's last names only from the string's 2-5th 
-- position with the first letter capitalized and all other letters lowercase, Give each column an 
-- appropriate label;
SELECT CONCAT(UPPER(SUBSTRING(last_name, 2, 1)), LOWER(SUBSTRING(last_name, 3, 4))) from employees;

-- 2__Write a query that displays the employees first name and last name along with a in 
-- between for eg first name  Ram last name : Kumar then Ram-Kumar. Also displays the 
-- month on which the employee has joined;
select concat(first_name,' - ',last_name),month(hire_date) from employees;

-- 3__Write a query to display the employeeS last name and if half of the salary is greater than 
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
-- 1500 each. Provide each column an appropriate label;
select last_name, case when (salary/2)>10000 then round(salary * 0.1+ salary) else round(salary * 0.115+salary) end as 'updated salary',1500 as bonus_amount from employees;

-- 4__ Display the employee ID by Appending two zeros after 2nd digit and E in the end, 
-- department id, salary and the manager name all in Upper case, if the Manager name 
-- consists of z replace it with $!;
select concat(substring(employee_id,1,2),'00',substring(employee_id,3),'E') as new_id, 
department_id, salary, 
If (instr(upper(last_name),'Z')>0, replace(upper(last_name),'Z','$!'), Upper(last_name)) as last_name from employees;

-- 5__ Write a query that displays the employees last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name 
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
-- employees last names;
SELECT CONCAT(UPPER(SUBSTRING(last_name,1,1)), LOWER(SUBSTRING(last_name,2,11))),last_name,concat(first_name,' ',last_name) as names,(select length(names)) from employees where last_name like 'j%' or last_name like 'A%' or last_name like 'M%' order by last_name;

-- 6__Create a query to display the last name and salary for all employees. Format the salary to 
-- be 15 characters long, left-padded with $. Label the column SALARY;
select last_name, lpad(salary,15,'$') AS salary from employees;

-- 7__Display the employees name if it is a palindrome;
select first_name from employees where first_name in (select first_name from employees where 
replace(lower(first_name),'  ',' ') = reverse(replace(lower(first_name),'  ',' ')));

-- 8__ Display First names of all employees with initcaps;
 select concat(upper(SUBSTRING(first_name,1,1)),lower(substring(first_name,2,10))) from employees;

-- 9__From LOCATIONS table, extract the word between first and second space from the 
-- STREET ADDRESS column;
select substring_index(substring_index(street_address,' ' ,2),' ',-1) from locations;

-- Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
-- be in lower case. Display this along with their First Name;
select lower(concat(first_name, last_name,'@systechusa.com')) as email_address, first_name from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna;
select first_name,last_name from employees where job_id=(select job_id from employees where first_name ='Trenna');

-- 12. Display the names and department name of all employees working in the same city as Trenna;
select e.first_name, d.department_name, d.location_id FROM employees e
JOIN departments d ON e.department_id = d.department_id
where d.location_id = (select d2.location_id from departments d2 join employees e2 on e2.department_id = d2.department_id 
where e2.first_name = 'Trenna');

-- 13. Display the name of the employee whose salary is the lowest;
select first_name,salary from employees where salary =(select min(salary) from employees);

-- 14. Display the names of all employees except the lowest paid.;
select first_name,salary from employees where salary not in(select min(salary) from employees);

-- 1. Write a query to display the last name, department number, department name for all 
-- employees;
select e.last_name, d.department_name,d.department_id from employees e
join departments d on e.department_id =d.department_id;

-- 3. Write a query to display the employee last name,department name,location id and city of 
-- all employees who earn commission;
select e1.employee_id, e1.last_name, d1.department_name, d1.location_id, l1.city from employees e1 
join departments d1 on d1.department_id = e1.department_id join locations l1 on d1.location_id = l1.location_id
where e1.commission_pct is not null;
 
 -- 4. Display the employee last name and department name of all employees who have an 'a' 
 -- in their last name;
  select e.last_name, d.department_name from employees e
  join departments d on e.department_id =d.department_id
  where last_name like '%a%';
 
-- 5. Write a query to display the last name,job,department number and department name for
-- all employees who work in Southlake;
select e1.last_name, e1.job_id, e1.department_id, d1.department_name from employees e1 
join departments d1 on d1.department_id = e1.department_id join locations l1 on d1.location_id = l1.location_id
where l1.city = 'Southlake';

-- 6. Display the employee last name and employee number along with their manager's and manager number;
select e1.last_name, e1.employee_id, e1.manager_id, e2.last_name as managers_last_name from employees e1
join employees e2 on e1.manager_id = e2.employee_id;

-- 7. Display the employee last name and employee number along with their manager's last 
-- name and manager number (including the employees who have no manager);
select e.last_name,e.employee_id,d.manager_id from employees e
left join departments d on e.manager_id = d.manager_id;

-- 8. Create a query that displays employees last name,department number,and all the 
-- employees who work in the same department as a given employee;
select e.last_name, e.department_id, e2.last_name as collegue_last_name from employees e join employees e2 
on e.department_id = e2.department_id where e.employee_id = 100;

-- 9. Create a query that displays the name,job,department name,salary,grade for all 
-- employees. Derive grade based on salary(>=5000=A, >=3000=B,<3000=C);

SELECT e.first_name, e.job_id, d.department_name, e.salary,
CASE
    WHEN e.salary >= 5000 THEN 'A'
    WHEN e.salary >= 3000 THEN 'B'
    ELSE 'C'END AS grade FROM employees e
join departments d ON e.department_id = d.department_id;

-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date.Label the columns as Employee 
-- name, emp_hire_date,manager name,manager_hire_date;

select e.first_name,e.hire_date from employees e 
join departments d on e. manager_id = d.manager_id
where e. hire_date < e. hire_date;


-- Find the date difference between the hire date and today's_date for all the 
-- employees. Display in no. of days, months and year(1 year 3 months 5 days)
-- Emp_ID Hire Date Resignation_Date;

SELECT 
    employee_id,
    hire_date,
    resignation_date,
    DATEDIFF(resignation_date, hire_date) AS total_days,
    FLOOR(DATEDIFF(resignation_date, hire_date) / 30) AS total_months,
    FLOOR(DATEDIFF(resignation_date, hire_date) / 365) AS total_years
FROM employees;

-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900);

SELECT
    employee_name,
    CASE
        WHEN hire_date IS NULL THEN 'DEC, 01th 1900'
        ELSE FORMAT(hire_date, 'MM/dd/yyyy')
    END AS formatted_hire_date,
    CASE
        WHEN resignation_date IS NULL THEN 'DEC, 01th 1900'
        ELSE FORMAT(resignation_date, 'MMM dd, yyyy')
    END AS formatted_resignation_date
FROM
    employees;
    
-- Calcuate experience of the employee till date in Years and months(example 1 year and 3 
-- months;

select
    employee_name,
    hire_date,
    resignation_date,
    DATEDIFF(MONTH, hire_date, COALESCE(resignation_date, curdate())) AS total_months_experience,
    CONCAT(
        DATEDIFF(YEAR, hire_date, COALESCE(resignation_date, curdate())),
        ' year(s) and ',
        DATEDIFF(MONTH, hire_date, COALESCE(resignation_date, curdate())) % 12,
        ' month(s)') AS experience
FROM
    employees;
    
--  Display the count of days in the previous quarter;

SELECT
    DATEDIFF(DAY, StartDate, EndDate) + 1 AS DaysInPreviousQuarter
FROM
    (
        SELECT
            DATEADD(QUARTER, DATEDIFF(QUARTER, 0, curdate()) - 1, 0) AS StartDate,
            DATEADD(DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, curdate()), 0)) AS EndDate
    ) AS PreviousQuarter;
    
-- Fetch the previous Quarter's second week's first day's date;
SELECT
    DATEADD(DAY, 1, StartDateOfSecondWeek) AS FirstDayOfSecondWeek
FROM
    (
        SELECT
            DATEADD(WEEK, 1, StartDateOfQuarter) AS StartDateOfSecondWeek
        FROM
            (
                SELECT
                    DATEADD(QUARTER, DATEDIFF(QUARTER, 0, curdate()) - 1, 0) AS StartDateOfQuarter
            ) AS PreviousQuarter
    ) AS SecondWeekOfPreviousQuarter;
    
    --  Fetch the financial year's 15th week's dates (Format: Mon DD YYYY);
    
 -- DECLARE @FinancialYearStart DATE = '2023-04-01';  -- Replace with your financial year start date

WITH Week15Dates AS (
    SELECT
        DATEADD(WEEK, 14, @FinancialYearStart) AS StartDate,
        DATEADD(DAY, 6, DATEADD(WEEK, 14, @FinancialYearStart)) AS EndDate
)
SELECT
    FORMAT(StartDate, 'ddd MM dd yyyy') AS StartDateFormatted,
    FORMAT(EndDate, 'ddd MM dd yyyy') AS EndDateFormatted
FROM
    Week15Dates;
    
-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with 
-- clause;

WITH LastSaturdayOfJanuary AS (
    SELECT
        MAX(DateColumn) AS LastSaturday
    FROM
        (SELECT
            DATEADD(DAY, 1 - DATEPART(WEEKDAY, '2015-01-01'), '2015-01-01') AS DateColumn
        UNION ALL
        SELECT
            DATEADD(DAY, 1 - DATEPART(WEEKDAY, '2015-01-02'), '2015-01-02')
        UNION ALL
        SELECT
            DATEADD(DAY, 1 - DATEPART(WEEKDAY, '2015-01-03'), '2015-01-03')
        -- Continue for the rest of the days in January
        ) AS AllJanuaryDates
    WHERE
        DATEPART(WEEKDAY, DateColumn) = 7
)
SELECT
    LastSaturday
FROM
    LastSaturdayOfJanuary;
   
-- 8) Find the number of days elapsed between first and last flights of a passenger;

WITH FirstLastFlights AS (
    SELECT
        passenger_id,
        MIN(flight_date) AS first_flight_date,
        MAX(flight_date) AS last_flight_date
    FROM
        flights
    GROUP BY
        passenger_id
)

SELECT
    passenger_id,
    DATEDIFF(DAY, first_flight_date, last_flight_date) AS days_elapsed
FROM
    FirstLastFlights;
    
	-- Find the total duration in minutes and in seconds of the flight from Rostov to Moscow;
    
    SELECT
    DATEDIFF(MINUTE, MIN(departure_time), MAX(arrival_time)) AS total_duration_minutes,
    DATEDIFF(SECOND, MIN(departure_time), MAX(arrival_time)) AS total_duration_seconds
FROM
    flights
WHERE
    departure_airport = 'Rostov' AND arrival_airport = 'Moscow';




  
  

  










