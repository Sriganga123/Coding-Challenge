CREATE DATABASE CARRENTALSYSTEM;
USE [CARRENTALSYSTEM];
CREATE TABLE Vehicle
(
   vehicleID INT PRIMARY KEY,
   make VARCHAR(30),
   model VARCHAR(30),
   Year DATE,
   dailyRate FLOAT,
   status CHAR,
   passengerCapacity INT,
   engineCapacity INT
   );
   CREATE TABLE Customer
   (
    customerID INT PRIMARY KEY,
	firstName VARCHAR(30),
	lastName VARCHAR(30),
	email VARCHAR(30),
	phoneNumber VARCHAR(30)
	);
	CREATE TABLE Lease
	(
	  leaseID INT PRIMARY KEY,
	  vehicleID INT,FOREIGN KEY(vehicleID) REFERENCES Vehicle(VehicleID),
	  customerID INT,FOREIGN KEY(customerID) REFERENCES Customer(customerID),
	  startDate DATE,
	  endDate DATE,
	  type VARCHAR(30)
	  
	  ON DELETE CASCADE
	  );
	  CREATE TABLE Payment
	  (
	   paymentID INT PRIMARY KEY,
	   leaseID INT,FOREIGN KEY(leaseID) REFERENCES Lease(LeaseID),
	   paymentDate DATE,
	   amount FLOAT
	   
	   );

	   INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(1,'Toyota','Camry','2022',50.00,1 ,4 ,1450);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(2,'Honda','Civic','2023',45.00,1 ,7 ,1500);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(3,'Ford','Focus','2022',48.00,0 ,4 ,1400);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(4,'Nissan','Altima','2023',52.00,1 ,7 ,1200);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(5,'Chervolet','Malibu','2022',47.00,1 ,4 ,1800);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(6,'Hyundai','Sonata','2023',49.00,0 ,7 ,1400);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(7,'BMW','3 Series','2023',60.00,1 ,7 ,2499);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(8,'Mercedes','C-Class','2022',58.00,1 ,8,2599);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(9,'Audi','A4','2022',55.00,0 ,4 ,2500);
	    INSERT INTO Vehicle([vehicleID],[make],[model],[Year],[dailyRate],[status],[passengerCapacity],[engineCapacity])
	   VALUES(10,'Lexus','ES','2023',54.00,1 ,4 ,2500);
	   SELECT * FROM Vehicle;

	
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(1 ,'John',' Doe',' johndoe@example.com',' 555-555-5555');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(2 ,'Jane',' Smith',' janesmith@example.com', '555-123-4567');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(3 ,'Robert','Johnson' ,'robert@example.com', '555-789-1234');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(4 ,'Sarah',' Brown',' sarah@example.com', '555-456-7890');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(5 ,'David',' Lee',' david@example.com', '555-987-6543');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(6 ,'Laura', 'Hall', 'laura@example.com', '555-234-5678');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(7, 'Michael',' Davis', 'michael@example.com', '555-876-5432');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(8 ,'Emma', 'Wilson', 'emma@example.com', '555-432-1098');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(9 ,'William', 'Taylor',' william@example.com', '555-321-6547');
	INSERT INTO Customer([customerID],[firstName],[lastName],[email],[phoneNumber])
	VALUES(10, 'Olivia ','Adams', 'olivia@example.com' ,'555-765-4321');

	SELECT * FROM Customer;

	INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(1 ,1, 1,' 2023-01-01',' 2023-01-05',' Daily');
	INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(2 ,2 ,2,' 2023-02-15', '2023-02-28',' Monthly');
	INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(3 ,3 ,3 ,'2023-03-10', '2023-03-15', 'Daily');
   INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES  (4 ,4 ,4 ,'2023-04-20', '2023-04-30', 'Monthly');
		  INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(5 ,5, 5, '2023-05-05', '2023-05-10', 'Daily');
		  INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(6 ,4, 3, '2023-06-15', '2023-06-30', 'Monthly');
		  INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(7, 7 ,7 ,'2023-07-01', '2023-07-10',' Daily');
			INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(8 ,8, 8 ,'2023-08-12',' 2023-08-15', 'Monthly');
INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(9, 3 ,3,' 2023-09-07',' 2023-09-10', 'Daily');
INSERT INTO Lease([leaseID],[vehicleID],[customerID],[startDate],[endDate],[type])
	VALUES(10 ,10, 10,' 2023-10-10',' 2023-10-31',' Monthly');
	SELECT * FROM Lease;

INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(1,1, '2023-01-03', 200.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(2, 2 ,'2023-02-20', 1000.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(3, 3 ,'2023-03-12', 75.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(4, 4, '2023-04-25', 900.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(5, 5 ,'2023-05-07', 60.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(6 ,6, '2023-06-18', 1200.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(7 ,7 ,'2023-07-03', 40.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(8, 8, '2023-08-14', 1100.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(9, 9, '2023-09-09', 80.00);
INSERT INTO Payment([paymentID],[leaseID],[paymentDate],[amount])
VALUES(10 ,10 ,'2023-10-25', 1500.00);
SELECT * FROM Payment;

--1. Update the daily rate for a Mercedes car to 68.
UPDATE Vehicle SET dailyRate=68.00 where make='Mercedes';
SELECT * FROM Vehicle;

--2. Delete a specific customer and all associated leases and payments.
DELETE FROM Customer WHERE customerID=3;

--3. Rename the "paymentDate" column in the Payment table to "transactionDate".
exec sp_rename 'Payment.paymentDate','transactionDate';
SELECT * FROM Payment;

--4. Find a specific customer by email.
SELECT * FROM Customer where email='robert@example.com';

--5. Get active leases for a specific customer.
SELECT * FROM Lease L INNER JOIN Customer C ON L.customerID=C.customerID where L.customerID=1;

--6. Find all payments made by a customer with a specific phone number
SELECT * FROM Payment P
JOIN Lease L on P.leaseID=L.leaseID
JOIN Customer C on C.customerID=L.customerID
where C.phoneNumber='555-876-5432';

--7. Calculate the average daily rate of all available cars.
SELECT AVG(dailyRate) as Avg_Daily_Rate from Vehicle where status=1;

--8. Find the car with the highest daily rate.
SELECT make,model FROM Vehicle
ORDER BY dailyRate DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--9. Retrieve all cars leased by a specific customer
SELECT * FROM Vehicle V JOIN Lease L on V.vehicleID=L.vehicleID WHERE L.customerID=5;

--10. Find the details of the most recent lease.
SELECT * FROM Lease ORDER BY endDate DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--11. List all payments made in the year 2023.
SELECT * FROM Payment where YEAR([transactionDate])=2023;

--12. Retrieve customers who have not made any payments.
SELECT *
FROM Customer C
WHERE NOT EXISTS (
    SELECT 1
    FROM Payment P
    JOIN Lease L ON P.leaseID = L.leaseID
    WHERE L.customerID = C.customerID
);

select * from Customer C join Lease L on L.customerID=C.customerID
join Payment P on P.leaseID=L.leaseID
where P.paymentID is not null;
--13. Retrieve Car Details and Their Total Payments.
SELECT V.*,SUM(P.amount) as Total_Payments
FROM Vehicle V JOIN Lease L ON V.vehicleID=L.vehicleID
JOIN Payment P ON L.leaseID=P.leaseID
GROUP BY V.vehicleID,V.make,V.model,V.Year,[dailyRate],[status],[passengerCapacity],[engineCapacity];

--14. Calculate Total Payments for Each Customer.
SELECT C.customerID,SUM(amount) as Total_Payments from Payment P
JOIN Lease L on P.leaseID=L.leaseID
JOIN Customer C on C.customerID=L.customerID
GROUP BY C.customerID;

--15. List Car Details for Each Lease.
SELECT L.LeaseID,V.* from Vehicle V
JOIN Lease L on V.vehicleID=L.vehicleID;

--16. Retrieve Details of Active Leases with Customer and Car Information.
SELECT V.*,C.*,L.* from Lease L
JOIN Customer C ON L.customerID=C.customerID
JOIN Vehicle V on L.vehicleID=V.vehicleID
WHERE GETDATE() BETWEEN L.startDate and L.endDate;

--17. Find the Customer Who Has Spent the Most on Leases.
SELECT C.customerID,SUM(amount) as 'Max_Spent' FROM Payment P
JOIN Lease L on P.leaseID=L.leaseID
JOIN Customer C on L.customerID=C.customerID
group by C.customerID
ORDER by Max_Spent DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--18. List All Cars with Their Current Lease Information
SELECT V.*,L.* from Vehicle V
LEFT JOIN Lease L on V.vehicleID=L.vehicleID
WHERE GETDATE() Between L.startDate and L.endDate;

exec sp_rename 'Customer.firstName','fullname';
select * from Customer;