create database VirtualArtGallery;
use [VirtualArtGallery];
CREATE TABLE ArtWork
(
  ArtWorkID INT PRIMARY KEY,
  Title VARCHAR(50),
  Description VARCHAR(50),
  CreationDate DATE,
  Medium VARCHAR(50),
  ImageURL VARCHAR(50),
  ArtistID INT,
  FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID)
  );

  CREATE TABLE Artist
  (
    ArtistID INT PRIMARY KEY,
	Name VARCHAR(30),
	Biography VARCHAR(200),
	BirthDate DATE,
	Nationality VARCHAR(10),
	Website VARCHAR(30),
	ContactInformation CHAR(10)
	);
	CREATE TABLE Users
	(
	  UserID INT PRIMARY KEY,
	  UserName VARCHAR(40),
	  Password VARCHAR(50),
	  Email VARCHAR(30),
	  FirstName VARCHAR(30),
	  LastName VARCHAR(30),
	  DateofBirth DATE,
	  ProfilePicture VARCHAR(40)
	);
	--JUNCTION TABLE (Many to many with User and Artwork)
	 create table UserFavouriteArtwork
	 (
	   UserID int,
	   ArtworkID int,
	   FOREIGN KEY([UserID]) REFERENCES Users([UserID]),
	   FOREIGN KEY([ArtWorkID]) REFERENCES ArtWork([ArtWorkID])
	   );
	create table Gallery
	(
	  GalleryID INT PRIMARY KEY,
	  Name VARCHAR(50),
	  Description VARCHAR(50),
	  Location VARCHAR(50),
	  Curator INT,
	  OpeningHours VARCHAR(50),
	  FOREIGN KEY(Curator) REFERENCES Artist([ArtistID])
	  );
	  --Junction table(many to many with Gallery and Artwork)
	CREATE TABLE Artwork_Gallery
	(
	  ArtWorkID INT,
	  GalleryID INT,
	  FOREIGN KEY(ArtWorkID) REFERENCES Artwork([ArtWorkID]),
	  FOREIGN KEY([GalleryID]) REFERENCES Gallery([GalleryID])
	);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(100,'Sunday Morning','Good','2021-08-04','Stone','www.sunmorn.com',200);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(101,'Morning Sunrise','Eye catching','2020-07-06','Paper','www.mornsunrise.com',201);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(102,'Colors for life','Impressive','2009-04-03','Brush','www.colors.com',202);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(103,'Rainbow','Good','2005-04-04','Paper','www.rainbow.com',203);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(104,'Nature','Expressive','2006-08-07','Board','www.nature.com',204);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(105,'Sunset','Impressive','2003-01-10','Paper','www.sunset.com',205);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(106,'Flowers','Elegant','2004-09-02','Board','www.flowers.com',206);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(107,'Food','Awesome','2007-01-01','Pen','www.food.com',207);
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(108,'Mountains','Exta ordinary','2008-09-02','Sketches','www.mount.com',208)
INSERT INTO ArtWork([ArtWorkID],[Title],[Description],[CreationDate],[Medium],[ImageURL],[ArtistID])
VALUES(109,'Hills','Good','2007-01-02','Pencil','www.hills.com',209);

INSERT INTO Artist([ArtistID],[Name],[Biography],[BirthDate],[Nationality],[Website],[ContactInformation])
VALUES(200,'Sana','Born in Chennai','1998-09-07','Indian','www.sana.com','9876543219');
INSERT INTO Artist([ArtistID],[Name],[Biography],[BirthDate],[Nationality],[Website],[ContactInformation])
VALUES(201,'Riya','Born in Banglore','1997-08-03','Indian','www.riya.com','9703368634'),
		(202,'Mihal','Born in Italy','1996-03-02','Italian','www.mihal.com','8247238787'),
		(203,'Neha','Born in US','2000-05-05','American','www.neha.com','9912247371'),
		(204,'Sara','Born in Germany','2001-09-07','Germany','www.sara.com','911362120'),
		(205,'maya','Born in Hyderabad','2003-05-01','Indian','www.maya.com','9123456780'),
		(206,'Kamal','Born in Coimabatore','2001-01-03','Indian','www.kamal.com','9898989898'),
		(207,'Mayan','Born in Italy','2001-07-01','Italian','www.mayan.com','8989898989'),
		(208,'Fara','Born in US','2001-04-05','American','www.fara.com','9813227371'),
		(209,'Mahesh','Born in Banglore','1996-02-03','Indian','www.mahesh.com','9793328637');

		select * from ArtWork;
		select * from Artist;
INSERT INTO Users([UserID],[UserName],[Password],[Email],[FirstName],[LastName],[DateofBirth],[ProfilePicture])
VALUES(300,'Riyamanoj','riyaaa','riya@gmail.com','Riya','Manoj','1999-08-01','Nature'),
(301,'Sanafirdouse','sannna','sana@gmail.com','Sana','Firdouse','1998-01-03','Hills'),
(302,'Sarafath','saaara','sara@gmail.com','Sara','Fathima','2000-01-04','Mountains'),
(303,'MaayaMari','maaaaya','maya@gmail.com','Maaya','Mari','2001-01-04','Hills'),
(304,'Mukramabegum','mukraaaama','muk@gmail.com','Mukrama','Begum','2000-06-01','Flowers'),
(305,'Shivathmikavuth','Shivathmika','shiv@gmail.com','Shivathmika','Vuthur','2005-08-05','Rainbow'),
(306,'Amanali','aaman','aman@gmail.com','aman','ali','2001-09-07','Sunrise'),
(307,'Mahamata','maaha','maha@gmail.com','Maha','Mata','2000-09-13','Sunset'),
(308,'Varshavani','vvvani','vani@gmail.com','Varsha','Vani','1999-08-06','Moon'),
(309,'Vaishnavivaai','vaaish','vaish@gmail.com','Vaishnavi','Vaai','1998-07-06','Colors');
select * from Users;

INSERT INTO Gallery([GalleryID],[Name],[Description],[Location],[Curator],[OpeningHours])
Values(400,'Curated Canvas','Curated','Banglore',200,'9am to 6pm');
INSERT INTO Gallery([GalleryID],[Name],[Description],[Location],[Curator],[OpeningHours])
VALUES(401,'Artistic Odyssey','Artistic','Hyderabad',203,'10am to 5pm'),
(402,'Artistic Latitude','Artistic','Chennai',205,'9:30am to 4:30pm'),
(403,'Spectrum Salon','Spectrum','Kolkata',207,'9am to 5pm'),
(404,'Chroma Chamber','Chroma','Mumbai',202,'10am to 4pm'),
(405,'Minds Eye Manor','Minds Eye','Kerala',204,'9am to 4pm'),
(406,'Whole Art Company','Whole Art','Thiruvananthapuram',206,'10am to 5pm'),
(407,'Palette Pavilion','Palette','Surat',208,'9:30am to 4:30pm'),
(408,'Artisan Retreat','Artisan','Delhi',205,'9am to 5pm'),
(409,'Haberdashery Gallery','Haberdashery','Chattisgarh',206,'10am to 4pm');
select * from Gallery;

INSERT INTO [dbo].[UserFavouriteArtwork]([UserID],[ArtworkID])
VALUES(301,101),
	(300,107),
	(303,109),
	(306,107),
	(308,104),
	(302,107),
	(307,105),
	(302,104),
	(308,105),
	(300,100);
INSERT INTO [dbo].[Artwork_Gallery]([ArtWorkID],[GalleryID])
VALUES (100,400),
		(101,401),
		(102,402),
		(103,403),
		(104,404),
		(105,405),
		(106,406),
		(107,407),
		(101,409),
		(104,402);
select * from[dbo].[Artist];
select * from [dbo].[ArtWork];
select * from [dbo].[Artwork_Gallery];
select * from [dbo].[Gallery];
select * from [dbo].[UserFavouriteArtwork];
select * from [dbo].[Users];