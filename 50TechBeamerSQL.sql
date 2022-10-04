CREATE TABLE Worker(
	WORKER_ID INT IDENTITY(001,1) NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(50),
	LAST_NAME CHAR(50),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(50)
)

CREATE TABLE Bonus (
	WORKER_REF_ID INT FOREIGN KEY REFERENCES Worker(WORKER_ID),
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	);

INSERT INTO Worker 
	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		('Niharika', 'Verma', 80000, '06-14-11 09:00:00', 'Admin'),
		('Vishal', 'Singhal', 300000, '02-14-20 09:00:00', 'HR'),
		('Amitabh', 'Singh', 500000, '02-14-20 09:00:00', 'Admin'),
		('Vivek', 'Bhati', 500000, '06-14-11 09:00:00', 'Admin'),
		('Vipul', 'Diwan', 200000, '06-14-11 09:00:00', 'Account'),
		('Satish', 'Kumar', 75000, '01-14-20 09:00:00', 'Account'),
		('Geetika', 'Chauhan', 90000, '04-14-11 09:00:00', 'Admin');

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '02-16-20'),
		(002, 3000, '06-16-11'),
		(003, 4000, '02-16-20'),
		(001, 4500, '02-16-20'),
		(002, 3500, '06-16-11');

CREATE TABLE Title (
WORKER_REF_ID INT FOREIGN KEY REFERENCES Worker(WORKER_ID),
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
);

select * from Worker

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (1, 'Manager', '2016-02-20 00:00:00'),
 (2, 'Executive', '2016-06-11 00:00:00'),
 (5, 'Manager', '2016-06-11 00:00:00'),
 (4, 'Asst. Manager', '2016-06-11 00:00:00'),
 (7, 'Executive', '2016-06-11 00:00:00'),
 (6, 'Lead', '2016-06-11 00:00:00'),
 (3, 'Lead', '2016-06-11 00:00:00');

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

SELECT UPPER(FIRST_NAME) FROM Worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT(DEPARTMENT) FROM Worker

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

SELECT SUBSTRING(FIRST_NAME,1,3) FROM Worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
--COLLATE Makes it case-sensitive
SELECT CHARINDEX('a', FIRST_NAME COLLATE Latin1_General_CS_AS) FROM Worker WHERE FIRST_NAME = 'Amitabh'

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

SELECT RTRIM(FIRST_NAME) FROM Worker

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

SELECT LTRIM(DEPARTMENT) FROM Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

SELECT DISTINCT(DEPARTMENT), LEN(DEPARTMENT) FROM Worker

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

Select REPLACE(FIRST_NAME,'a','A') from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(TRIM(FIRST_NAME), ' ', TRIM(LAST_NAME)) COMPLETE_NAME FROM Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM Worker ORDER BY FIRST_NAME

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul', 'Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

SELECT * FROM Worker WHERE DEPARTMENT = 'ADMIN'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT COUNT(WORKER_ID) FROM Worker WHERE DEPARTMENT = 'ADMIN'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT WORKER_ID, FIRST_NAME, SALARY FROM worker 
WHERE Salary BETWEEN 50000 AND 100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT COUNT(WORKER_ID) AS COUNT, DEPARTMENT 
FROM Worker
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT DESC

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT * FROM Worker
SELECT * FROM Title

SELECT * FROM Worker W 
JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID
WHERE T.WORKER_TITLE = 'Manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.

SELECT * FROM Worker WHERE WORKER_ID%2 = 1

--Q-27. Write an SQL query to show only even rows from a table.

SELECT * FROM Worker WHERE WORKER_ID%2 = 0

--Q-28. Write an SQL query to clone a new table from another table.

SELECT * INTO WORKER_CLONE FROM Worker
-- WITHOUT DATA
SELECT * INTO WorkerClone FROM Worker WHERE 1 = 0;

--Q-29. Write an SQL query to fetch intersecting records of two tables.

SELECT * FROM Worker
INTERSECT
SELECT * FROM WORKER_CLONE

--Q-30. Write an SQL query to show records from one table that another table does not have.

SELECT * FROM Worker W 
LEFT JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID
EXCEPT
SELECT * FROM Worker W 
RIGHT JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID

--Q-31. Write an SQL query to show the current date and time.

SELECT GETDATE()

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP 10 * FROM Worker ORDER BY Salary DESC

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT TOP 1 Salary
FROM Worker WHERE SALARY IN (
 SELECT DISTINCT TOP 3 Salary
 FROM Worker 
 ORDER BY Salary DESC
 )
 ORDER BY SALARY ASC
 SELECT * FROM Worker

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )

--Q-35. Write an SQL query to fetch the list of employees with the same salary.

SELECT FIRST_NAME, SALARY
FROM Worker 
WHERE Salary IN (SELECT Salary
    FROM Worker
    GROUP BY Salary
    HAVING COUNT(*) > 1
)

Select distinct(W.WORKER_ID), W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

--Q-36. Write an SQL query to show the second highest salary from a table.

SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN
(SELECT MAX(SALARY) FROM WORKER)

SELECT * FROM (  
SELECT dense_rank() OVER (ORDER BY SALARY DESC) AS rownumber,Salary  
FROM Worker )  
AS foo  
WHERE rownumber = 2

--Q-37. Write an SQL query to show one row twice in results from a table.

SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker

--Q-38. Write an SQL query to fetch intersecting records of two tables.

SELECT * FROM Worker
INTERSECT
SELECT * FROM Worker

SELECT * FROM Worker
INTERSECT
SELECT * FROM WORKER_CLONE

--Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM Worker
WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM Worker)

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.

SELECT DEPARTMENT, COUNT(WORKER_ID) AS NUMBER_OF_PEOPLE 
FROM Worker 
GROUP BY DEPARTMENT 
HAVING COUNT(WORKER_ID) < 5

--Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(WORKER_ID) AS NUMBER_OF_PEOPLE 
FROM Worker 
GROUP BY DEPARTMENT

--Q-42. Write an SQL query to show the last record from a table.

SELECT * FROM Worker WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker)

--Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker)

--Q-44. Write an SQL query to fetch the last five records from a table.

SELECT TOP 5 * FROM Worker ORDER BY WORKER_ID DESC

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

--Q-46. Write an SQL query to fetch three max salaries from a table.

SELECT DISTINCT TOP 3 SALARY FROM Worker ORDER BY SALARY DESC

--Q-47. Write an SQL query to fetch three min salaries from a table.

SELECT DISTINCT TOP 3 SALARY FROM Worker ORDER BY SALARY ASC

--Q-48. Write an SQL query to fetch nth max salaries from a table.

--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

 