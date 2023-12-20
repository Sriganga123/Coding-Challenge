create database crimeReporting;
use [crimeReporting];

create table Incidents
(
 IncidentID INT PRIMARY KEY,
 IncidentType VARCHAR(30),
 IncidentDate DATE,
 Location VARCHAR(50),
 Description VARCHAR(50),
 Status VARCHAR(30),
 VictimID INT,
 SuspectID INT,
 FOREIGN KEY(VictimID) REFERENCES Victims(VictimID),
 FOREIGN KEY(SuspectID) REFERENCES Suspects(SuspectID)
 );

 Create table Victims
 (
   VictimID INT PRIMARY KEY,
   FirstName VARCHAR(30),
   LastName VARCHAR(30),
   DateOfBirth DATE,
   Gender CHAR,
   ContactInformation VARCHAR(50)
   );

 Create table Suspects
 (
   SuspectID INT PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
    DateOfBirth DATE,
   Gender CHAR,
   ContactInformation VARCHAR(50)
   );

   Create table LawEnforcementAgencies
   (
     AgencyID INT PRIMARY KEY,
	 AgencyName VARCHAR(50),
	 Jurisdiction VARCHAR(40),
	 ContactInformation VARCHAR(100)
	 );
	create table Officers
	(
	  OfficerID INT PRIMARY KEY,
	  FirstName VARCHAR(50),
	  LastName VARCHAR(50),
	  BadgeNumber VARCHAR(30),
	  Rank INT,
	  ContactInformation VARCHAR(60),
	  AgencyID INT,
	  FOREIGN KEY([AgencyID]) REFERENCES [dbo].[LawEnforcementAgencies]([AgencyID])
	  );

	create table Evidence
	(
	  EvidenceID INT PRIMARY KEY,
	  Description VARCHAR(30),
	  LocationFound VARCHAR(50),
	  IncidentID INT,
	  FOREIGN KEY([IncidentID]) REFERENCES [dbo].[Incidents]([IncidentID])
	  );

	create table Reports
	(
	  ReportID INT PRIMARY KEY,
	  IncidentID INT,
	  ReportingOfficer INT,
	  ReportDate DATE,
	  ReportDetails VARCHAR(50),
	  Status VARCHAR(50),
	  FOREIGN KEY(ReportingOfficer) REFERENCES [dbo].[Officers]([OfficerID]),
	  FOREIGN KEY([IncidentID]) REFERENCES [dbo].[Incidents]([IncidentID])
	  );

INSERT INTO [dbo].[Incidents]([IncidentID],[IncidentType],[IncidentDate],[Location],[Description],
[Status],[VictimID],[SuspectID])
VALUES(100,'Robbery','2022-03-19','12.22222','At mid night','Open',200,300),
(101,'Homicide','2021-08-14','-67.111','Murder','Under Investigation',201,301),
(102,'Theft','2020-06-14','-60.11671','Lost gold','Under Investigation',202,302),
(103,'Homicide','2019-08-18','67.111','Brutal Murder','Closed',203,303),
(104,'Robbery','2018-06-17','45.8998','Pick pocketing','Under Investigation',204,304),
(106,'Homicide','2021-08-14','-98.111','Murder','Under Investigation',205,305),
(107,'Theft','2016-02-11','234.1788','Thief not found','Open',206,306),
(108,'Homicide','2021-08-14','54.342','Murder','Under Investigation',207,307),
(109,'Theft','2021-04-28','-67.111','Murder','Under Investigation',208,308),
(105,'Robbery','2012-01-26','90.78788','Ran away thief','Closed',209,309);

INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])
VALUES(200,'Riya','Manoj','2001-09-06','F','9898989898');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(201,'Arya','Manu','2000-08-17','F','9834349898');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(202,'Akhil','Sagar','2005-11-06','M','9294989391');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(203,'Sara','Varath','2006-12-19','F','9546709198');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(204,'Avanthi','Reddy','2000-02-23','F','7878655898');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(205,'Vyshnavi','Gopal','2001-09-06','F','9123189898');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(206,'Nithin','Pancha','2003-12-09','M','9098652898');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(207,'Ashraff','Mayu','2004-07-27','M','9177364120');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(208,'Lokesh','Katkam','2006-04-06','M','9898121212');
INSERT INTO Victims([VictimID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])VALUES(209,'Reshma','Manoj','2001-09-06','F','8247238787');

INSERT INTO Suspects([SuspectID],[FirstName],[LastName],[DateOfBirth],[Gender],[ContactInformation])
VALUES(300,'Reshma','Manoj','2001-09-06','F','8247238787'),
(301,'Lokesh','Katkam','2006-04-06','M','9898121212'),
(302,'Ashraff','Mayu','2004-07-27','M','9177364120'),
(303,'Nithin','Pancha','2003-12-09','M','9098652898'),
(304,'Vyshnavi','Gopal','2001-09-06','F','9123189898'),
(305,'Avanthi','Reddy','2000-02-23','F','7878655898'),
(306,'Sara','Varath','2006-12-19','F','9546709198'),
(307,'Akhil','Sagar','2005-11-06','M','9294989391'),
(308,'Arya','Manu','2000-08-17','F','9834349898'),
(309,'Karan','MAlaya','2001-11-10','M','9912247371');

select * from Incidents;
select * from Victims;
select * from Suspects;

INSERT INTO [dbo].[LawEnforcementAgencies]([AgencyID],[AgencyName],[Jurisdiction],[ContactInformation])
VALUES(400,'Home office','County wide','8247238787'),
(401,'Essex office','State wide','9440004540'),
(402,'West Midlands Police','Country wide','9290726515'),
(403,'Kempston Police','State wide','9652124315'),
(404,'Warrington Police','Country wide','8341880883'),
(405,'Histon service','State wide','9703387657'),
(406,'Cumbria Constabulary','Country wide','6203386657'),
(407,'Leicestershire Police','State wide','9177364127'),
(408,'Dorset Police','Country wide','9182320242'),
(409,'West Mercia Police','State wide','9390513735');

INSERT INTO [dbo].[Officers]([OfficerID],[FirstName],[LastName],[BadgeNumber],[Rank],[ContactInformation],[AgencyID])
VALUES(500,'Sundar','Pal','A123',1,'9199199934',400),
(501,'Ramesh ','Kumar','D564',34,'9182320243',405),
(502,'Raghav','Chandra','C689',32,'9303368634',407),
(503,'Sachin','Guptha','F453',24,'9198456342',403),
(504,'Aryan','Sriram','S342',56,'9290736243',404),
(505,'Syed','Ashraf','D463',19,'9032593735',406),
(506,'Nithin','Patel','R432',28,'9640482089',402),
(507,'Pendem','Saiteja','J897',30,'9248025243',405),
(508,'Tirunagiri','Lokesh','E564',26,'9734527456',407),
(509,'Ramadugu','Saisriteja','H643',76,'9998450348',403);
Select *from[dbo].[LawEnforcementAgencies];
Select *from[dbo].[Officers];

INSERT INTO [dbo].[Evidence]([EvidenceID],[Description],[LocationFound],[IncidentID])
VALUES(600,'Finger prints','Banglore',101),
(601,'Items of thief','Banglore',101),
(602,'Finger prints','Banglore',108),
(603,'CCTV footage','Banglore',104),
(604,'Finger prints','Banglore',103),
(605,'Eye Witness','Banglore',102),
(606,'CCTV Footage','Banglore',101),
(607,'Finger prints','Banglore',106),
(608,'Eye witness','Banglore',101),
(609,'Finger prints','Banglore',103);
select * from[dbo].[Evidence];

INSERT INTO [dbo].[Reports]([ReportID],[IncidentID],[ReportingOfficer],[ReportDate],[ReportDetails],
[Status]) VALUES(700,100,503,'2022-09-02','Witness found','Draft'),
(701,102,502,'2022-09-02','Thief found','Finalized'),
(702,105,506,'2021-08-12','Witness found','Draft'),
(703,108,504,'2022-04-18','No proofs','Finalized'),
(704,102,509,'2020-01-02','Witness found','Draft'),
(705,109,501,'2020-06-22','Witness found','Finalized'),
(706,101,503,'2023-09-12','No proofs','Draft'),
(707,103,502,'2021-01-19','Witness found','Finalized'),
(708,102,500,'2019-11-20','Eye witness not found','Draft'),
(709,106,505,'2018-09-02','Witness found','Finalized');

select * from [dbo].[Incidents];
select * from[dbo].[Victims];
select * from[dbo].[Suspects];
select * from[dbo].[LawEnforcementAgencies];
select * from[dbo].[Officers];
select * from[dbo].[Evidence];
select * from[dbo].[Reports];


