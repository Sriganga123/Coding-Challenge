create database sis;
use [sis];
create table Students
(
  StudentID INT PRIMARY KEY,
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  DateOfBirth DATE,
  Email	VARCHAR(30),
  PhoneNumber CHAR(10)
  );
  CREATE table Courses
  (
    courseID INT PRIMARY KEY,
	CourseName VARCHAR(40),
	credits INT,
	teacherID INT,
	FOREIGN KEY(teacherID) REFERENCES Teacher(teacherID)
	ON DELETE CASCADE
	);
	CREATE table Enrollments
	(
	  enrollmentID INT PRIMARY KEY,
	  studentID INT,
	  CourseID INT,
	  EnrollmentDate DATE,
	  FOREIGN KEY([StudentID]) REFERENCES [dbo].[Students]([StudentID]),
	  FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
	  ON DELETE CASCADE
	  );

	  CREATE TABLE Teacher
	  (
	    teacherID INT PRIMARY KEY,
		firstname VARCHAR(30),
		lastname VARCHAR(40),
		email VARCHAR(50)
		);
	CREATE TABLE Payments
	(
	  PaymentID INT PRIMARY KEY,
	  StudentID INT,
	  Amount INT,
	  PaymentDate DATE,
	  FOREIGN KEY([StudentID]) REFERENCES [dbo].[Students]([StudentID])
	  ON DELETE CASCADE
	  );
	INSERT INTO [dbo].[Students]([StudentID],[firstname],[lastname],[DateOfBirth],[Email],[PhoneNumber])
	VALUES(101,'Vyshnavi','Bacchu','2000-09-17','vysh@gmail.com','9876543210'),
	(102,'Avanthi','Mishra','2001-06-27','avanthi@gmail.com','9800043210'),
	(103,'Ashraf','Syed','2003-08-12','syed@gmail.com','9811143210'),
	 (104,'Nithin','Soma','2007-06-02','soma@gmail.com','9876500000'),
	 (105,'Maaya','Maaru','2000-01-01','maaya@gmail.com','8247238787'),
	 (106,'Rani','Vutture','2000-11-13','rani@gmail.com','9912247371'),
	 (107,'Archana','Puppala','2000-06-16','archana@gmail.com','9182320242'),
	 (108,'Snigha','Vole','2000-09-19','vole@gmail.com','9177364130'),
	 (109,'Sandhya','Vara','2000-06-11','vara@gmail.com','9701168624'),
	 (110,'Aryan','Sai','2000-12-19','sai@gmail.com','9870011122');

	 INSERT INTO [dbo].[Teacher]([teacherID],[firstname],[lastname],[email]) 
	 VALUES(401,'Dhana','Laxmi','dhana@gmail.com'),
	 (402,'Raja','Shekar','raja@gmail.com'),
	 (403,'Swapna','Reddy','swapna@gmail.com'),
	 (404,'Latha','Sura','latha@gmail.com'),
	 (405,'Rekha','Goud','rekha@gmail.com'),
	 (406,'Renuka','Goud','renuka@gmail.com'),
	 (407,'Sunitha','Shetty','sunitha@gmail.com'),
	 (408,'Anjali','Reddy','anjali@gmail.com'),
	 (409,'Anu','Laxmi','anu@gmail.com'),
	 (410,'Manjula','Shetty','manjulaa@gmail.com');

	 INSERT INTO [dbo].[Courses]([courseID],[CourseName],[credits],[teacherID])
	 VALUES(201,'Java',3,402),
	 (202,'Python',4,403),
	 (203,'C',2,405),
	 (204,'C++',5,406),
	 (205,'R',1,401),
	 (206,'DBMS',0,402),
	 (207,'Operating Systems',3,403),
	 (208,'Design Analysis',1,407),
	 (209,'AI',2,409),
	 (210,'Machine Learning',4,410);

	 INSERT INTO [dbo].[Enrollments]([enrollmentID],[studentID],[CourseID],[EnrollmentDate])
	 VALUES(301,101,201,'2022-09-12'),
	 (302,104,203,'2021-11-21'),
	 (303,102,204,'2020-10-17'),
	 (304,108,206,'2021-09-13'),
	 (305,104,208,'2022-08-11'),
	 (306,109,209,'2023-07-12'),
	 (307,110,201,'2022-05-28'),
	 (308,102,202,'2021-06-26'),
	 (309,107,203,'2022-03-11'),
	 (310,106,205,'2022-02-19');
	 INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES(501,101,8900,'2022-09-15');
INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES	 (502,104,9000,'2021-11-21');
	 INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES(503,102,7500,'2020-10-17');
	INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES (504,107,6200,'2022-08-11');
	INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES (505,108,29000,'2022-08-11');
	INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES (506,109,12000,'2023-07-12');
	INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES (507,110,43222,'2022-05-28');
	INSERT INTO [dbo].[Payments]([PaymentID],[StudentID],[Amount],[PaymentDate])
	 VALUES (508,102,5600,'2021-06-26');
	 (509,103,8900,'2022-03-11'),
	 (510,105,9050,'2022-02-19');
	 
select * from [dbo].[Students];
select * from[dbo].[Courses];
select * from[dbo].[Teacher];
select * from[dbo].[Enrollments];
select * from[dbo].[Payments];

--Queries
--1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John b. Last Name: Doe c. Date of Birth: 1995-08-15 d. Email: john.doe@example.com
--e. Phone Number: 1234567890
INSERT INTO [dbo].[Students]([StudentID],[firstname],[lastname],[DateOfBirth],[Email],[PhoneNumber])
VALUES(111,'John','Doe','1995-08-15','john.doe@example.com','1234567890');
select * from [dbo].[Students];
select * from Students;

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
--insert a record into the "Enrollments" table with the enrollment date.
select * from Students;
select * from Courses;

DECLARE @new_SID INT;
DECLARE @new_CID INT;
SET @new_SID=103;
SET @new_CID=204;
INSERT INTO Enrollments([enrollmentID],[studentID],[CourseID],[EnrollmentDate]) VALUES(311,@new_SID,@new_CID,'2022-12-12');
SELECT * from Enrollments;
--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address
update Teacher set [email]='laxmi@gmail.com' where [teacherID]=401;
select * from Teacher;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course.
delete from [dbo].[Enrollments] where [StudentID]=103 and [courseID]=204;
select * from [dbo].[Enrollments];

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
update [dbo].[Courses] set [teacherID]=404 where [CourseName]='Java';
select * from [dbo].[Courses];

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
delete from Enrollments where [StudentID]=107;
delete from [dbo].[Students] where [StudentID]=107;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
update [dbo].[Payments] set [Amount]=44000 where [PaymentID]=507;
select * from [dbo].[Payments];

--Joins
--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID
select S.studentID,S.firstname,S.lastname,SUM(P.amount) as Total_payments from [dbo].[Students] S
JOIN [dbo].[Payments] P on S.StudentID=P.StudentID
group by S.[StudentID],S.[firstname],S.[lastname];

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
select C.courseID,C.courseName,COUNT(E.studentID) as EnrollmentCount from [dbo].[Enrollments] E
join [dbo].[Courses] C on C.[courseID]=E.CourseID
group by C.courseID,C.CourseName;

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select S.[StudentID],S.[firstname],S.[lastname] from [dbo].[Students] S
LEFT JOIN [dbo].[Enrollments] E ON E.studentID=S.StudentID
where E.studentID is NULL;
--OR
select s.studentID,S.firstname,S.lastname from Students S left join Enrollments E on E.studentID=S.StudentID
group by S.StudentID,S.firstname,S.lastname
having COUNT(E.studentID)=0;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select S.[firstname],S.[lastname],C.[CourseName] from Courses C 
JOIN Enrollments E on C.courseID=E.CourseID
JOIN Students S on E.studentID=S.StudentID
group by S.firstname,S.lastname,C.CourseName;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table
select T.[firstname],T.[lastname],C.[CourseName] from [dbo].[Courses] C 
JOIN [dbo].[Teacher] T on T.[teacherID]=C.teacherID

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
select S.[StudentID],S.[firstname],S.[lastname],E.[EnrollmentDate] from Students S
JOIN Enrollments E on E.studentID=S.StudentID
JOIN Courses C ON E.CourseID=C.CourseID
where C.CourseName='R';

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select S.[firstname],S.[lastname] from Students S 
LEFT JOIN Payments P on P.StudentID=S.StudentID
where P.StudentID is null;
--OR 
select S.firstName,S.lastName from Students S
LEFT JOIN Payments P on P.StudentID=S.studentID
group by S.firstName,S.lastName
having count(P.studentID)=0;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records
select C.[courseID],C.[CourseName] from Courses C 
LEFT JOIN [dbo].[Enrollments] E on E.CourseID=C.courseID
where E.CourseID is null;
--OR
select C.[courseID],C.[CourseName] from Courses C 
LEFT JOIN [dbo].[Enrollments] E on E.CourseID=C.courseID
group by C.courseID,C.CourseName
having count(E.CourseID) =0;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.select S.[StudentID],S.[firstname],S.[lastname] from Students S
JOIN Enrollments E on E.studentID=S.StudentID
group by S.StudentID,S.firstname,S.lastname
having count(DISTINCT E.CourseID)>1;

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.select T.[teacherID],T.[firstname],T.[lastname] from Teacher TLEFT JOIN Courses C on T.teacherID=C.teacherIDwhere C.teacherID is null;--AGGREGATE FUNCTIONS--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.select C.courseID,C.courseName,AVG(total_count) as Avg_Enrolled from Courses Cjoin ( select courseID,count(studentID) as total_count from Enrollments group by courseID ) E on C.courseID=E.courseIDgroup by C.courseID,C.CourseName;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount
select S.studentID,S.firstname,S.lastname,P.amount from Students S JOIN Payments P on P.studentID=S.StudentIDwhere P.amount=( select MAX(amount) from Payments);--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment countselect C.coursename,COUNT(E.studentID) as EnrollCount from Enrollments E JOIN Courses C on E.CourseID=C.courseIDgroup by C.CourseNameorder by EnrollCount DESCoffset 0 rowsfetch next 1 rows only; --ORselect C.coursename,COUNT(E.studentID) as EnrollCount  from Enrollments Ewhere EnrollCount=( select MAX(E.courseID) from Courses C);--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's coursesselect t.teacherID ,t.firstname,t.lastname,SUM(P.amount) as Total_Payments from Teacher T JOIN Courses C on T.teacherID=C.teacherIDJOIN Enrollments E on E.CourseID=C.courseIDJoin Payments P on P.StudentID=E.studentIDgroup by t.teacherID,t.firstname,t.lastname;--ORselect teacherID,firstname,lastname,SUM(Payment_Amount) as Total_Payments from( select teacherID,firstname,lastname,courseID,SUM(amount) as Payment_Amount from Teacher T	JOIN Courses C on C.teacherID=T.teacherID	JOIN Enrollments E on E.CourseID=C.courseID	JOIN Payments P on P.StudentID=E.studentID	group by teacherID,firstname,lastname,courseID) as TeacherPaymentsgroup by teacherID,firstname,lastname;--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of coursesselect S.studentID,S.firstname,S.lastname from Students Swhere S.StudentID In (select E.studentID from Enrollments E group by E.studentID						having COUNT(distinct E.CourseID)=(select COUNT(DISTINCT CourseID) from Courses));--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.select t.[teacherID],t.[firstname],t.[lastname] from Teacher Twhere t.teacherID not in ( select C.[teacherID] from Courses C where C.teacherID is not null);--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth  select AVG(age) as Avg_Age from  (    select studentID,DATEDIFF(year,[DateOfBirth],getdate()) as age from Students ) as StudentAges;--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment recordsselect C.courseID,C.courseName from Courses C where C.courseID not in (select E.courseID from Enrollments E where courseID is not null);--9. Calculate the total payments made by each student for each course they are enrolled in.Select S.studentID,S.firstName,S.lastname,C.CourseID,C.CourseName,SUM(P.amount) as Total_Payments fromPayments P join Students S on P.StudentID=S.StudentIDjoin Enrollments E on E.studentID=S.StudentIDjoin Courses C on E.CourseID=C.courseIDgroup by S.studentID,S.firstname,S.lastname,C.CourseID,C.CourseName;--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than oneselect S.studentID,S.firstname,S.lastname from Students Swhere S.studentID in ( select P.studentID from Payments P group by studentID having count(P.StudentID)>1); --11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.select S.studentID,S.firstname,S.lastname,SUM(P.amount) as Total_Payments from Students SJOIN Payments P on S.StudentID=P.StudentIDgroup by S.StudentID,S.firstname,S.lastname;--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.select C.courseName,COUNT(Distinct E.studentID) as EnrolledCount from Enrollments EJOIN Courses C on C.courseID=E.CourseID group by CourseName;--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the averageselect S.studentID,S.firstname,S.lastname, AVG(P.amount) as Avg_Amount from Payments PJOIN Students S on S.StudentID=P.StudentID group by S.StudentID,S.firstname,S.lastname;