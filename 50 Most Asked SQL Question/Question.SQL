CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES 
	(001,'Monika','Arora',100000,'14-02-20 09.00.00','HR'),
	(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
	(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
	(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
	(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
	(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
	(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
	(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select *from Worker;

CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) 
ON DELETE CASCADE 
);

INSERT INTO  Bonus
(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

SELECT *FROM Bonus;

CREATE TABLE Title(
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) 
ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

SELECT *FROM Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker; 

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case. 
SELECT UPPER(FIRST_NAME) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME,1,3) FROM WORKER;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,"B") FROM WORKER WHERE FIRST_NAME="AMITABH";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM WORKER;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(FIRST_NAME) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT , LENGTH(DEPARTMENT) FROM WORKER;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT *FROM WORKER ORDER BY FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending. 
SELECT * FROM WORKER ORDER BY FIRST_NAME, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT *FROM WORKER WHERE FIRST_NAME IN('VIPUL','SATISH');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL','SATISH');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM WORKER WHERE DEPARTMENT LIKE "ADMIN%";

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A%";

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "_____H";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT="ADMIN";

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000. 
SELECT CONCAT(FIRST_NAME, ' ' ,LAST_NAME) FROM WORKER 
WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) FROM WORKER GROUP BY DEPARTMENT ORDER BY COUNT(WORKER_ID) DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT W.* FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID=T.WORKER_REF_ID WHERE T.WORKER_TITLE='MANAGER';
-- INNER JOIN SELECT * FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID=T.WORKER_REF_ID;

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, COUNT(*) AS COUNT FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE MOD (WORKER_ID,2) !=0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM WORKER WHERE MOD (WORKER_ID,2) =0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WORKER_CLONE LIKE WORKER;
INSERT INTO WORKER_CLONE SELECT * FROM WORKER;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER.* FROM WORKER INNER JOIN WORKER_CLONE USING(WORKER_ID);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT WORKER.*  FROM WORKER LEFT JOIN WORKER_CLONE USING(WORKER_ID) WHERE WORKER_CLONE.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
SELECT CURDATE();
SELECT NOW();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select * from worker w1
where 4=(
select count(distinct(w2.salary))
from worker w2 
where w2.salary>=w1.salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from worker w1,worker w2 where w1.salary=w2.salary and  w1.worker_id!=w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker 
where salary not in (select max(salary) from worker);

select * from worker order by salary  desc limit 2,1;

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker 
union all
select * from worker order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id <=(select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department,count(department) as depth_count from worker group by department having depth_count<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,count(department) as depth_count from worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
 select * from worker where worker_id=(select max(worker_id) from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id=(select min(worker_id) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(select * from worker order by worker_id desc limit 5 ) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select w.department,w.first_name,w.salary from 
(select max(salary) as maxsal,department from worker group by department)temp 
inner join worker w on temp.department=w.department and temp.maxsal=w.salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker w1 
where 3>=(select count(distinct salary) from worker w2 where w1.salary<=w2.salary) order by w1.salary desc;

select distinct salary from worker order by salary desc limit 3;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker w1 
where 3>=(select count(distinct salary) from worker w2 where w1.salary>=w2.salary) order by w1.salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select disticnt salary from worker w1 
where n>=(select count(distinct salary) from worker w2 where w1.salary<=w2.salary) order by w1.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department ,sum(salary) as sumsal from worker group by department order by sumsal desc;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name , salary from worker where salary=(select max(salary) from worker);

