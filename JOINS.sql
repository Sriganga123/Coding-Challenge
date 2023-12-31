use [batch_1];
CREATE TABLE EMPLOYEES
(
 EID INT PRIMARY KEY,
 ENAME VARCHAR(50),
 DNO INT,
 SALARY INT,
 MANAGER_ID INT,
 CITY VARCHAR(50),
 FOREIGN KEY(DNO) REFERENCES
 DEPARTMENT(DNO) ON DELETE CASCADE
 );
 CREATE TABLE DEPARTMENT
 (
   DNO INT PRIMARY KEY,
   DNAME VARCHAR(50) UNIQUE NOT NULL
   );
 INSERT INTO [dbo].[DEPARTMENT] VALUES(100,'IT'); 
 SELECT * FROM [dbo].[DEPARTMENT];
 SELECT * FROM [dbo].[EMPLOYEES];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES] AS E
   INNER JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]=D.[DNO];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES] AS E
   INNER JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]>D.[DNO];
   SELECT * FROM [dbo].[EMPLOYEES];
   SELECT * FROM [dbo].[DEPARTMENT];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES] AS E
   LEFT JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]=D.[DNO];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES] AS E
   RIGHT JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]=D.[DNO];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES] AS E
   FULL JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]=D.[DNO];
   SELECT [ENAME],[DNAME] FROM [dbo].[EMPLOYEES]
   CROSS JOIN [dbo].[DEPARTMENT];
   SELECT E1.[ENAME],E2.[ENAME] FROM [dbo].[EMPLOYEES] AS E1
   INNER JOIN [dbo].[EMPLOYEES] AS E2
   ON E2.[EID]=E1.[MANAGER_ID];


   SELECT [DNAME],COUNT([DNAME]) 'TOTAL'FROM [dbo].[EMPLOYEES]
   AS E INNER JOIN [dbo].[DEPARTMENT] AS D ON E.[DNO]=D.[DNO]
   GROUP BY [DNAME]
   ORDER BY 2;
   
   

  