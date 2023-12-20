use [SCHOOL];
select * from [dbo].[StudentMaster];
select * from [dbo].[CourseMaster];
select * from [dbo].[EnrollmentMaster];
--1.List the course wise total no. of Students enrolled. Provide the information only for students of foreign origin and only if the total exceeds 10.
select C.CID,C.CourseName,Count(E.SID) as Total_Count from CourseMaster C
JOIN EnrollmentMaster E on E.CID=C.CID
JOIN StudentMaster S on S.SID=E.SID
where S.Origin='F'
group by C.CID,C.CourseName
having COUNT(E.sid)>10;

--2.List the names of the Students who have not enrolled for Java course
select S.SID,S.StudentName from StudentMaster S 
where S.SID not IN (Select E.sid from EnrollmentMaster E join CourseMaster C on C.CID=E.CID where C.CourseName='Java');

--3.List the name of the advanced course where the enrollment by foreign students is the highest.
select C.CID,C.CourseName,COUNT(E.cid) as Enrolled_Count from CourseMaster C
join EnrollmentMaster E on E.CID=C.CID
JOIN StudentMaster S on S.SID=E.SID
where S.Origin='F' and C.Category='A'
group by C.CID,C.CourseName
order by Enrolled_Count DESC
offset 0 ROWS
fetch next 1 rows only;

--4.List the names of the students who have enrolled for at least one basic course in the current month.
select S.SID,S.studentName from StudentMaster S
join EnrollmentMaster E on E.SID=S.SID
join CourseMaster C on C.CID=E.CID
where C.Category='B' and MONTH(DOE)=MONTH(getdate());

--5.List the names of the Undergraduate, local students who have got a “C” grade in any basic course.
select S.SID,S.StudentName from StudentMaster S
join EnrollmentMaster E on E.SID=S.SID
join CourseMaster C on C.CID=E.CID
where S.type='U' and S.origin='L' and C.Category='B' and E.Grade='C';

--6.List the names of the courses for which no student has enrolled in the month of May 2020.
select C.CourseName from CourseMaster C 
where C.CID NOT IN ( select E.CID from EnrollmentMaster E where MONTH(E.DOE)=5 and year(E.DOE)=2020);

--8.List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days.
select S.StudentName,C.CourseName,DATEDIFF(day,E.DOE,getdate()) as age from StudentMaster S
JOIN EnrollmentMaster E on E.SID=S.SID
join CourseMaster C on C.CID=E.CID
order by age desc
offset 0 rows
fetch next 1 rows only;

--9.List the names of the Local students who have enrolled for exactly 3 basic courses. 
select S.StudentName from StudentMaster S join EnrollmentMaster E on E.SID=S.SID
join CourseMaster c on c.CID=e.CID
where S.Origin='L' and C.Category='B'
group by S.StudentName
having COUNT(distinct E.CID)=3;

--10.List the names of the Courses enrolled by all (every) students.
select C.courseName from CourseMaster C 
join EnrollmentMaster E on E.CID=C.CID
group by C.CourseName
having count(distinct E.cid)=(select count(distinct cid) from CourseMaster);

--11.For those enrollments for which fee have been waived, provide the names of students who have got ‘O’ grade.
select S.StudentName from StudentMaster S join EnrollmentMaster E on E.SID=S.SID
where E.FWF=1 and E.grade='O';

--12.List the names of the foreign, undergraduate students who have got grade ‘C’ in any basic course.
select S.studentName from StudentMaster S
join EnrollmentMaster E on E.SID=S.SID
join CourseMaster C on C.CID=E.CID
where S.Origin='F'and S.type='U' and E.Grade='C' and C.Category='B';

--13.List the course name, total no. of enrollments in the current month.
select C.courseName,COUNT(E.CID)as Total from CourseMaster C
join EnrollmentMaster E on E.CID=C.CID
where MONTH(E.DOE)=MONTH(getDate())
group by C.CourseName;

--7.	List name, Number of Enrollments and Popularity for all Courses.
--Popularity has to be displayed as “High” if number of enrollments is higher than 50,  
--“Medium” if greater than or equal to 20 and less than 50, and “Low” if the no.  Is less than 20.

SELECT CourseName,COUNT(E.CID) AS NumberOfEnrollments,
 CASE
        WHEN COUNT(E.CID) > 50 THEN 'High'
        WHEN COUNT(E.CID) >= 20 AND COUNT(E.CID) <= 50 THEN 'Medium'
        ELSE 'Low'
    END AS Popularity
FROM CourseMaster C
LEFT JOIN  EnrollmentMaster E ON C.CID = E.CID
GROUP BY C.CID, C.CourseName;

