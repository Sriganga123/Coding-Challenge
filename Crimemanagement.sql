create database CrimeManagement;
use [CrimeManagement];
CREATE TABLE Crime 
(
 CrimeID INT PRIMARY KEY,
 IncidentType VARCHAR(255),
 IncidentDate DATE,
 Location VARCHAR(255),
 Description TEXT,
 Status VARCHAR(20)
);
CREATE TABLE Victim 
(
 VictimID INT PRIMARY KEY,
 CrimeID INT,
 Name VARCHAR(255),
 ContactInfo VARCHAR(255),
 Injuries VARCHAR(255),
 FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);
CREATE TABLE Suspect 
(
 SuspectID INT PRIMARY KEY,
 CrimeID INT,
 Name VARCHAR(255),
 Description TEXT,
 CriminalHistory TEXT,
 FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);
INSERT INTO Crime (CrimeID, IncidentType, IncidentDate, Location, Description, 
Status)
VALUES
 (1, 'Robbery', '2023-09-15', '123 Main St, Cityville', 'Armed robbery at a 
convenience store', 'Open'),
 (2, 'Homicide', '2023-09-20', '456 Elm St, Townsville', 'Investigation into a 
murder case', 'Under Investigation'),
 (3, 'Theft', '2023-09-10', '789 Oak St, Villagetown', 'Shoplifting incident at a 
mall', 'Closed');
INSERT INTO Victim (VictimID, CrimeID, Name, ContactInfo, Injuries)
VALUES
 (1, 1, 'John Doe', 'johndoe@example.com', 'Minor injuries'),
 (2, 2, 'Jane Smith', 'janesmith@example.com', 'Deceased'),
 (3, 3, 'Alice Johnson', 'alicejohnson@example.com', 'None');
INSERT INTO Suspect (SuspectID, CrimeID, Name, Description, CriminalHistory)
VALUES
 (1, 1, 'Robber 1', 'Armed and masked robber', 'Previous robbery convictions'),
 (2, 2, 'Unknown', 'Investigation ongoing', NULL),
 (3, 3, 'Suspect 1', 'Shoplifting suspect', 'Prior shoplifting arrests');

 select * from Crime;
 select * from Victim;
 select * from Suspect;

 --1. Select all open incidents.
 select * from Crime where status='open';

 --2. Find the total number of incidents.
select COUNT(CrimeID) as Total_Number_of_Incidents from Crime;

--3. List all unique incident types
select distinct IncidentType from Crime;

--4. Retrieve incidents that occurred between '2023-09-01' and '2023-09-10'.
select * from Crime where [IncidentDate] between '2023-09-01' and '2023-09-10';

--5. List persons involved in incidents in descending order of age
select V.name,DATEDIFF(year,C.IncidentDate,getDate()) as age from Victim V join Crime C on C.CrimeID=V.CrimeID
order by DATEDIFF(year,C.IncidentDate,getDate()) DESC;

--7. List incident types and their counts, only for open cases.
select IncidentType,COUNT(IncidentType) as IncidentCount from Crime
where status='open'
group by IncidentType;
 update Suspect set Name='Mary Doe' where Name='Unknown';
--8. Find persons with names containing 'Doe'
select name from Victim where name like 'd%';
union 
select name from Suspect where name like '%Doe%';

--9. Retrieve the names of persons involved in open cases and closed cases.

select V.name,S.name from Victim V join Suspect S on S.CrimeID=V.CrimeID
join crime c on c.CrimeID=S.CrimeID
where c.Status in ('open','closed');


SELECT Name FROM Victim
WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE Status = 'Open')
UNION
SELECT Name AS PersonName FROM Suspect
WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE Status = 'Open');
SELECT Name FROM  Victim
WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE Status = 'Closed')
UNION
SELECT Name FROM Suspect
WHERE CrimeID IN (SELECT CrimeID FROM Crime WHERE Status = 'Closed');


--11.Find persons involved in incidents of the same type as 'Robbery'.
select * from Victim;
select * from Crime;
select Name from Victim where CrimeID in (select CrimeID from Crime where IncidentType='Robbery')
union 
select Name from Suspect where CrimeID in ( select CrimeID from Crime where IncidentType='Robbery');

--12.List incident types with more than one open case.
select * from Crime;
select IncidentType,COUNT(IncidentType) as Count_IncidentType from Crime 
where IncidentType='open'
group by IncidentType
having COUNT(IncidentType)>1;

--13.List all incidents with suspects whose names also appear as victims in other incidents.
SELECT C.*,V.Name AS VictimName FROM Crime C
JOIN Suspect S ON C.CrimeID = S.CrimeID
JOIN Victim V ON C.CrimeID = V.CrimeID AND S.Name = V.Name;

--14. Retrieve all incidents along with victim and suspect details.
select C.*,V.*,S.* from Crime C
join Suspect S on S.CrimeID=C.CrimeID
join Victim V on V.CrimeID=C.CrimeID;

--15.Find incidents where the suspect is older than any victim.select IncidentType from Crime C
JOIN Suspect S on S.CrimeID=C.CrimeID
join Victim V on V.CrimeID=C.CrimeID
where S.age>V.age;

--16.Find suspects involved in multiple incidents
select S.SuspectID from Suspect S 
join Crime C on C.CrimeID=S.CrimeID
group by S.SuspectID
having COUNT(S.CrimeID)>1;

--17.List incidents with no suspects involved.select C.* from Crime C join Suspect S on C.CrimeID=S.CrimeIDwhere S.SuspectID is null;--orselect C.CrimeID,C.IncidentType from Crime C join Suspect S on C.CrimeID=S.CrimeIDgroup by C.CrimeID,C.IncidentTypehaving COUNT(S.suspectID)=0;--20.List all suspects who have been involved in incidents with incident types 'Robbery' or 'Assault
select S.suspectID,S.name from Suspect S join Crime C
on C.CrimeID=S.CrimeID
where C.IncidentType in ('Robbery','Assault');

--.List all cases where at least one incident is of type 'Homicide' and all other incidents are of type 'Robbery'.
SELECT C.*FROM Crime C
WHERE C.IncidentType = 'Homicide'AND NOT EXISTS (
													SELECT 1 FROM Crime
													WHERE CrimeID = C.CrimeID AND IncidentType <> 'Robbery'
													 );



