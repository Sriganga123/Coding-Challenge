create database SCHOOL;
use school;
create table CourseMaster
(
  CID INT PRIMARY KEY,
  CourseName VARCHAR(40) NOT NULL,
  Category CHAR(1) NOT NULL CHECK(Category IN('B','M','A')) ,
  Fee SmallMoney CHECK(Fee>=0) NOT NULL
  );

  create table StudentMaster
  (
    SID tinyint PRIMARY KEY,
	StudentName VARCHAR(40) NOT NULL,
	Origin CHAR(1) CHECK(Origin IN('L','F') ) NOT NULL,
	type CHAR(1) CHECK(type IN('U','G')) NOT NULL
	);

	CREATE TABLE EnrollmentMaster 
	(
    CID INT NOT NULL,
    SID TINYINT NOT NULL,
    DOE DATETIME NOT NULL,
    FWF BIT NOT NULL,
    Grade CHAR(1) CHECK (Grade IN ('O', 'A', 'B', 'C')),
    FOREIGN KEY (CID) REFERENCES CourseMaster (CID),
    FOREIGN KEY (SID) REFERENCES StudentMaster (SID)
    );

	INSERT INTO CourseMaster([CID],[CourseName],[Category],[Fee]) VALUES (100,'Java','A',17);
	INSERT INTO CourseMaster([CID],[CourseName],[Category],[Fee]) VALUES (101,'Python','B',175),
	(103,'SQL','M',678),
	(104,'Data Structures','M',89),
	(105,'Algorithms','A',67),
	(106,'Flowchart','M',899),
	(107,'CN','B',980),
	(108,'FLAT','M',768),
	(109,'CD','A',456),
	(110,'DAA','B',564),
	(111,'MFCS','M',543);
	select * from CourseMaster;
INSERT INTO StudentMaster([SID],[StudentName],[Origin],[type]) VALUES (200,'Sid','L','U');
INSERT INTO StudentMaster([SID],[StudentName],[Origin],[type]) VALUES (201,'Kaira','F','G'),
(202,'Mishra','F','U'),
(203,'Amit','F','G'),
(204,'Sagar','F','U'),
(205,'Raha','L','G'),
(206,'Samath','F','U'),
(207,'Agarwal','F','G'),
(208,'Kash','F','U'),
(209,'Maaya','F','G'),
(210,'Mahi','F','U'),
(211,'sana','F','U'),
(212,'Somya','F','G'),
(213,'Karthik','F','U'),
(214,'Fara','F','G');

INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(101,203,'2022-08-07',0,'O');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(101,202,'2021-09-12',1,'A');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(102,203,'2020-05-2',1,'C');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(103,204,'2002-06-012',0,'B');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(101,205,'2006-09-1',1,'A');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(105,204,'2021-07-05',0,'A');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(101,206,'2003-02-09',1,'C');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(107,204,'2005-07-08',0,'A');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(109,202,'2021-09-012',1,'O');
INSERT INTO EnrollmentMaster([CID],[SID],[DOE],[FWF],[Grade]) VALUES(100,209,'2020-07-04',0,'A');

select * from EnrollmentMaster;

--QUERIES ON SCHOOL CASE STUDY
--1.List the course wise total no. of Students enrolled. Provide the information only for students of foreign origin and only if the total exceeds 10
select coursename,count(E.sid) as StudentsEnrolled from CourseMaster C
JOIN EnrollmentMaster E ON C.cid=E.cid
JOIN StudentMaster S ON E.sid=S.sid
where S.origin='F'
group by C.CourseName
having count(E.sid)>10;

--2.List the names of the Students who have not enrolled for Java course
select s.studentname from StudentMaster S
where sid not in(
                  select sid from EnrollmentMaster E 
				  JOIN CourseMaster c on E.cid=C.cid
				  where c.CourseName='Java');

--3.	List the name of the advanced course where the enrollment by foreign students is the highest.
select c.coursename,count(E.cid) as countenrolled from CourseMaster C
JOIN EnrollmentMaster E on C.cid=E.cid
Join StudentMaster S on E.sid=S.sid
where C.category='A' and S.origin='F'
group by c.coursename
order by countenrolled DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--4.List the names of the students who have enrolled for at least one basic course in the current month.
select s.studentname from StudentMaster S 
JOIN EnrollmentMaster E on s.sid=e.sid
JOIN CourseMaster C on C.cid=E.cid
where category='b' and month(doe)=month(getdate());

--5.List the names of the Undergraduate, local students who have got a “C” grade in any basic course

select s.StudentName from StudentMaster S
JOIN EnrollmentMaster E on E.sid=S.sid
JOIN CourseMaster C on C.cid=E.cid
where s.origin='L' and S.type='U' and C.Category='B';

--8.List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days

select s.studentName,C.courseName,E.doe,DATEDIFF(DAY,e.doe,GETDATE()) from StudentMaster S
JOIN EnrollmentMaster E on e.sid=s.sid
JOIN CourseMaster C on e.cid=c.cid
order by e.doe;

--9.List the names of the Local students who have enrolled for exactly 3 basic courses.

select s.StudentName from StudentMaster S
JOIN EnrollmentMaster E on s.sid=E.sid
JOIN CourseMaster C on E.cid=C.cid 
where S.Origin='L' and C.Category='B'
group by s.StudentName
having COUNT(distinct C.cid)=3;

--11.For those enrollments for which fee have been waived, provide the names of students who have got ‘O’ grade.

select s.studentName from StudentMaster S
JOIN EnrollmentMaster E on S.sid=E.sid
where e.fwf=1 and e.grade='O';

--12.List the names of the foreign, undergraduate students who have got grade ‘C’ in any basic course

select s.StudentName from StudentMaster S
JOIN EnrollmentMaster E on S.sid=E.sid
JOIN CourseMaster C on C.cid=E.cid
where s.origin='F' and s.type='U' and E.grade='C';

--13.List the course name, total no. of enrollments in the current month
select C.courseName,COUNT(E.sid) as Total_Enrolled from EnrollmentMaster E
JOIN CourseMaster C on C.CID=E.CID 
where month(E.Doe)=month(getDate())
group by C.courseName;

--6.List the names of the courses for which no student has enrolled in the month of May 2020.
select C.courseName from CourseMaster C
WHERE NOT EXISTS ( SELECT 1 FROM EnrollmentMaster E where C.cid=E.cid and Month(e.doe)=5 and Year(e.doe)=2020);

--10.List the names of the Courses enrolled by all (every) students.

select c.courseName from CourseMaster C 
where NOT EXISTS (SELECT 1 from StudentMaster S
					where not exists ( select 1 from EnrollmentMaster E where E.cid=C.cid and E.sid=S.sid));
		