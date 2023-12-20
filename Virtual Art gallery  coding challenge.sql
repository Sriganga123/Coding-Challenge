create database VAG;
use [VAG];
CREATE TABLE Artists 
(
 ArtistID INT PRIMARY KEY,
 Name VARCHAR(255) NOT NULL,
 Biography TEXT,
 Nationality VARCHAR(100)
 );
 CREATE TABLE Categories 
 (
 CategoryID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL
 );
 CREATE TABLE Artworks 
 (
 ArtworkID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 ArtistID INT,
 CategoryID INT,
 Year INT,
 Description TEXT,
 ImageURL VARCHAR(255),
 FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
 );
 CREATE TABLE Exhibitions 
 (
 ExhibitionID INT PRIMARY KEY,
 Title VARCHAR(255) NOT NULL,
 StartDate DATE,
 EndDate DATE,
 Description TEXT
 );
 CREATE TABLE ExhibitionArtworks 
 (
 ExhibitionID INT,
 ArtworkID INT,
 PRIMARY KEY (ExhibitionID, ArtworkID),
 FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
 FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID)
 );
 INSERT INTO Artists (ArtistID, Name, Biography, Nationality) VALUES
 (1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
 (2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
 (3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');
-- Insert sample data into the Categories table
INSERT INTO Categories (CategoryID, Name) VALUES
 (1, 'Painting'),
 (2, 'Sculpture'),
 (3, 'Photography');
-- Insert sample data into the Artworks table
INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL)
VALUES(1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 
'starry_night.jpg'),
 (2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 
'mona_lisa.jpg'),
 (3, 'Guernica', 1, 1, 1937, 'Pablo Picasso\s powerful anti-war mural.', 
'guernica.jpg');
-- Insert sample data into the Exhibitions 
INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) 
VALUES
 (1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of 
modern art masterpieces.'),
 (2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art 
treasures.');
-- Insert artworks into exhibitions
INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
 (1, 1),
 (1, 2),
 (1, 3),
 (2, 2);

 select * from Artists;
 select * from[dbo].[Artworks];
 select * from[dbo].[Categories];
 select * from[dbo].[ExhibitionArtworks];
 select * from[dbo].[Exhibitions];

 --1. Retrieve the names of all artists along with the number of artworks they have in the gallery, 
 --and list them in descending order of the number of artworks.
 select A.name,COUNT(Art.ArtworkID) as 'No_of_Artworks' from Artists A
 LEFT JOIN Artworks Art ON A.ArtistID=Art.ArtistID
 group by A.name
 order by No_of_Artworks DESC;

 --2. List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order them by the year in ascending order.
 select A.name,Art.title from Artists A JOIN Artworks Art on A.ArtistID=Art.ArtistID
 where A.Nationality IN('Spanish','Dutch')
 order by Art.year ;

 --3. Find the names of all artists who have artworks in the 'Painting' category, and the number of artworks they have in this category
 select A.name,COUNT(Art.ArtworkID) as 'No_of_Artworks' from Artists A
 JOIN Artworks Art ON A.ArtistID=Art.ArtistID
 JOIN Categories C on C.CategoryID=Art.CategoryID
 where C.Name='Painting'
 group by A.name;

 --4. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their artists and categories.
 select Art.Title,A.name,C.name
 from Exhibitions E JOIN ExhibitionArtworks EArt on E.ExhibitionID=EArt.ExhibitionID
 JOIN Artworks Art ON Art.ArtworkID=EArt.ArtworkID
 JOIN Artists A on A.ArtistID=Art.ArtistID
 JOIN Categories C on C.CategoryID=Art.CategoryID
 where E.Title='Modern Art Masterpieces';

 --5. Find the artists who have more than two artworks in the gallery.
 select A.artistID,A.name from Artists A 
 JOIN Artworks Art on A.ArtistID=Art.ArtistID
 group by A.ArtistID,A.Name
 having COUNT(Art.ArtworkID)>2;

 --6. Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art' exhibitions
 select DISTINCT Art.title as TITLE_OF_ARTWORKS from Artworks Art JOIN ExhibitionArtworks EArt On EArt.ArtworkID=Art.ArtworkID
 JOIN Exhibitions E on E.ExhibitionID=EArt.ExhibitionID
 where E.Title in ('Modern Art Masterpieces' , 'Renaissance Art');

 --7. Find the total number of artworks in each category
 select C.CategoryID,C.name ,COUNT(Art.ARtworkID) as Total_Artworks from Categories C
 JOIN Artworks Art on C.CategoryID=Art.ArtworkID
 group by C.CategoryID,C.Name;

 --8. List artists who have more than 3 artworks in the gallery
 select A.ArtistID,A.name from Artists A JOIN Artworks Art on A.ArtistID=Art.ArtistID
 group by A.ArtistID,A.Name 
 having COUNT(Art.ArtworkID)>3;

 --9. Find the artworks created by artists from a specific nationality (e.g., Spanish).
 select Art.ArtworkID,Art.title from Artworks Art JOIN Artists A on A.ArtistID=Art.ArtistID
 where A.Nationality='Spanish';

 --10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.
 select E.exhibitionID,E.Title from Exhibitions E 
 JOIN ExhibitionArtworks EArt on E.ExhibitionID=EArt.ExhibitionID
 JOIN Artworks Art on Art.ArtworkID=EArt.ArtworkID
 JOIN Artists A on A.ArtistID=Art.ArtistID
 where A.name in ('Vincent van Gogh' ,' Leonardo da Vinci');
 
--11.Find all the artworks that have not been included in any exhibition.
select * from Artworks Art JOIN ExhibitionArtworks EArt on Art.ArtworkID=EArt.ArtworkID
LEFT JOIN Exhibitions E on E.ExhibitionID=EArt.ExhibitionID
where EArt.ArtworkID is null;
--OR
select Art.ArtworkID from Artworks Art JOIN ExhibitionArtworks EArt on Art.ArtworkID=EArt.ArtworkID
LEFT JOIN Exhibitions E on E.ExhibitionID=EArt.ExhibitionID
group by Art.ArtworkID
having count(Art.ArtworkID)=0;

--12. List artists who have created artworks in all available categories.
select A.ArtistID,A.name from Artists A JOIN Artworks Art on A.ArtistID=Art.ArtistID
group by A.ArtistID,A.Name
having COUNT(Distinct Art.ArtworkID)=(select COUNT(distinct CategoryID) from Categories );

--16.Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition.
select Art.ArtworkID,Art.[Title] from Artworks Art JOIN ExhibitionArtworks EArt on EArt.ArtworkID=Art.ArtworkID
JOIN Exhibitions E on E.ExhibitionID=EArt.ExhibitionID
where E.[Title]='Modern Art Masterpieces';
select * from Artworks;
select * from Categories;
select * from Exhibitions;
select * from ExhibitionArtworks;

--19.Show artists who have artworks in the same category as "Mona Lisa."
select A.ArtistID,A.name from Artists A join Artworks Art on A.ArtistID=Art.ArtistID
where art.title='Mona Lisa';

--20. List the names of artists and the number of artworks they have in the gallery
select A.artistID,A.name,COUNT(Art.ArtworkID) as 'No_of_Artworks' from Artists A
JOIN Artworks Art on A.ArtistID=Art.ArtistID
group by A.ArtistID,A.Name;

--15. List the categories with the average year of artworks they contain, only for categories with more than 1 artwork.
select C.CategoryID,C.name,AVG(year) as AVG_YEAR from Artworks Art JOIN Categories C
on C.CategoryID=Art.CategoryID
group by C.CategoryID,C.Name
having COUNT(Art.ArtworkID)>1;

--17. Find the categories where the average year of artworks is greater than the average year of all artworks.
select C.categoryID,C.name ,AVG(Art.year) from Artworks Art 
JOIN Categories C on C.CategoryID=Art.CategoryID
group by C.CategoryID,C.Name
having AVG(Art.year)>(select AVG(year) from Artworks);