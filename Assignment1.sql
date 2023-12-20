CREATE DATABASE TECHSHOP;
USE [TECHSHOP];
--CREATING Customers TABLE
CREATE TABLE Customers
(
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(50),
  Phone CHAR(10),
  Address VARCHAR(50)
  );
  --CREATING Products TABLE
CREATE TABLE Products
(
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Description VARCHAR(50),
  Price FLOAT
  );
--CREATE Orders TABLE
CREATE TABLE ORDERS
(
 OrderID INT PRIMARY KEY,
 CustomerID INT,FOREIGN KEY(CustomerID) REFERENCES [dbo].[Customers]([CustomerID]),
 OrderDate DATE,
 TotalAmount FLOAT
 ON DELETE CASCADE
 );
 --CREATE OrderDetails TABLE
CREATE TABLE OrderDetails
(
 OrderDetailID INT PRIMARY KEY,
 OrderID INT,FOREIGN KEY(OrderID) REFERENCES [dbo].[Orders]([OrderID]),
 ProductID INT ,FOREIGN KEY(ProductID) REFERENCES [dbo].[Products]([ProductID]),
 Quantity INT
 ON DELETE CASCADE
 );
 -- CREATE Inventory TABLE
CREATE TABLE Inventory
(
  InventoryID INT PRIMARY KEY,
  ProductID INT,FOREIGN KEY(ProductID) REFERENCES [dbo].[Products]([ProductID]),
  QuantityINStock INT,
  LastStockUpdate INT
  ON DELETE CASCADE 
  );

----- Inserting records into Customers Table
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(100,'Rajesh','Menon','menon@gmail.com','8247238787','SunShine Avenue');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(101,'Kirti','Sharma','sharma@gmail.com','8246758787','Rock Villa');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(102,'Aman','Varma','varma@gmail.com','9703368624','Sky Valley');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(103,'Pallavi','Roy','roy@gmail.com','9177364120','Vilas Nagar');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(104,'Jone','Smith','smith@gmail.com','834138787','Saraswathi Nagar');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(105,'Nicholas','James','james@gmail.com','9772867523','Sagar Villa');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(106,'Latha','Sakare','sakare@gmail.com','9876543210','Prabha Avenue');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(107,'Shakeel','Ahmed','ahmed@gmail.com','6281523456','Vinay Apartments');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(108,'Priyanka','Jain','jain@gmail.com','8765444444','Maruthi Nagar');
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
VALUES(109,'Swami','Rao','rao@gmail.com','7654632109','Ashoka Avenue');

SELECT * FROM Customers;

---Inserting records into Products Table
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(200,'Mobile','Portable',13000.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(201,'Tablet','Efficient',13000);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(202,'Oven','High Performnace',75000.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(203,'Fridge','5 star rating',28000.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(204,'AC','High Cooling',55000.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(205,'Cooler','Affordable',30000.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(206,'Heater','Good Looking',7050.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(207,'Chimney','Good Performance',4055.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(208,'Earpods','Portable',2500.00);
INSERT INTO Products(ProductId,ProductName,Description,Price)
VALUES(209,'Mobile','Full storage',95000.00);

SELECT * FROM Products;

---Inserting records into Orders Table
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(300,104,'2023-06-11',5000.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(301,105,'2022-07-08',6124.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(302,106,'2021-05-04',71738.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(303,100,'2020-06-08',98765.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(304,100,'2023-11-09',10000.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(305,102,'2022-06-05',15000.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(306,101,'2023-01-01',17000.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(307,101,'2021-03-08',18500.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(308,108,'2020-04-04',24000.00);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES(309,109,'2023-12-12',17500.00);

SELECT * FROM Orders;

--Inserting Records into OrderDetails Table
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(400,305,201,5);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(401,306,202,4);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(402,307,207,6);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(403,300,206,4);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(404,309,205,2);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(405,308,204,3);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(406,300,200,1);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(407,301,201,2);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(408,302,209,5);
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES(409,303,209,4);

SELECT * FROM OrderDetails;

--Inserting Records into Inventory Table
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(500,204,5,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(501,205,6,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(502,203,7,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(503,202,8,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(504,201,9,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(505,200,10,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(506,200,7,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(507,207,8,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(508,208,9,25);
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate)
VALUES(509,208,9,25);

SELECT * FROM Inventory;


--1. Write an SQL query to retrieve the names and emails of all customers.
SELECT CONCAT(FirstName,' ',LastName),Email
FROM Customers;

--2)Write an SQL query to list all orders with their order dates and corresponding customer names
SELECT OrderID,OrderDate,
(SELECT CONCAT(FirstName,' ',LastName) FROM Customers WHERE Customers.CustomerID=Orders.CustomerID) AS CustomerName
FROM Orders;

--3)Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Phone,Address)
VALUES(110,'Vinith','Katkam','vinnu@gmail.com','9032593735','Vinayak Nagar');
SELECT * FROM Customers;

--4)Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products SET Price=Price+Price*.1;
SELECT * FROM Products;

--5)Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @y INT;
SET @y=305;
DELETE FROM OrderDetails
WHERE OrderID=@y;
DELETE FROM Orders WHERE OrderID=@y;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--6)Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount) VALUES(310,100,'2019-05-05',9599.56);
SELECT * FROM Orders;

--7)Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
DECLARE @x INT;
DECLARE @new_email VARCHAR(30);
DECLARE @new_add VARCHAR(40);
SET @x=102;
SET @new_email='vuthur@gmail.com';
SET @new_add='Royal Palace'
UPDATE Customers SET Email= @new_email,Address=@new_add
WHERE CustomerID=@x;
SELECT * FROM Customers;

--8)Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
UPDATE Orders
SET TotalAmount=(
      SELECT SUM(p.Price*od.Quantity)
	  FROM OrderDetails as od INNER JOIN Products as p
	  ON od.ProductID=p.ProductID
	  WHERE od.OrderID=Orders.OrderID
	  );


--9)Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @y INT;
SET @y=105;
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID=@y);
DELETE FROM Orders WHERE CustomerID=@y;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--10)Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details
ALTER TABLE Products ADD Category VARCHAR(50);
INSERT INTO Products(ProductID,ProductName,Description,Price,Category)
VALUES(213,'TV','Full HD Display',98776.77,'Entertainment');
SELECT * FROM Products;

--11)Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status
ALTER TABLE Orders ADD Status VARCHAR(50);
INSERT INTO Orders(OrderID,CustomerID,OrderDate,TotalAmount,Status) VALUES(322,108,'2007-08-05',98777,'Pending');
SELECT * FROM Orders;
DECLARE @x INT,@new_status VARCHAR(50);
SET @x=322;
SET @new_status='Shipped';
UPDATE Orders
SET Status=@new_status
WHERE OrderID=@x;

SELECT * FROM Orders;

--12)Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
ALTER TABLE Customers ADD NumberOfOrders INT;
UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);



----JOINS
--1) Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order
SELECT O.OrderId,C.FirstName,C.LastName
FROM Customers as C INNER JOIN Orders as O
ON C.CustomerID=O.CustomerID;

--2)Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue
SELECT P.ProductName,SUM(P.Price*OD.Quantity)
FROM Products as P INNER JOIN OrderDetails as OD
ON P.ProductID=OD.ProductID
GROUP BY P.ProductID,P.ProductName;

--3)Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

--4)Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered
SELECT P.ProductName,SUM(OD.Quantity) as Highly_Ordered
FROM Products as P INNER JOIN OrderDetails as OD
ON P.ProductID=OD.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY Highly_Ordered DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--6) Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value
SELECT C.CustomerID,AVG(O.TotalAmount) as Avg_Order_Value
FROM Customers C LEFT JOIN Orders O
ON C.CustomerID=O.CustomerID
WHERE O.CustomerID is not null
GROUP BY C.CustomerID;


--7)Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT O.OrderID,C.FirstName,C.LastName,O.TotalAmount as Highest_Total_Revenue
FROM Customers C INNER JOIN Orders O
ON C.CustomerID=O.CustomerID
ORDER BY O.TotalAmount DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--8)Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT P.ProductName,COUNT(OD.OrderID) as No_Of_Times
FROM Products as P INNER JOIN OrderDetails as OD
ON P.ProductID=OD.ProductID
GROUP BY P.ProductID,P.ProductName;

--9) Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
DECLARE @x VARCHAR(50);
SET @x='AC';
SELECT C.FirstName ,C.LastName
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
INNER JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = @x;

--10)Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SET @StartDate='2022-05-01';
SET @EndDate='2023-04-04';
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;




---AGGREGATE FUNCTIONS

--1)Write an SQL query to find out which customers have not placed any orders.
SELECT C.CustomerID,CONCAT(C.FirstName,' ',C.LastName)
FROM Customers as C
LEFT JOIN Orders as O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,CONCAT(C.FirstName,' ',C.LastName)
HAVING COUNT(O.OrderID) = 0;

--OR

select c.customerID,C.firstname from Customers C 
where c.customerId not in (select o.CustomerID from Orders O where CustomerID is not null);

--2)Write an SQL query to find the total number of products available for sale. 
SELECT COUNT(ProductID) AS Product_Count
FROM Products;

--3)Write an SQL query to calculate the total revenue generated by TechShop.
SELECT * FROM Orders;
SELECT SUM(TotalAmount) AS Total_Revenue
FROM Orders;

--4)Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
DECLARE @CategoryInput VARCHAR(30);
SET @CategoryInput='Entertainment';
SELECT AVG(OD.Quantity) AS AvgQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID=P.ProductID
WHERE P.Category=@CategoryInput;

--5)Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
DECLARE @x INT;
SET @x=106
SELECT C.FirstName,C.LastName,SUM(OD.Quantity*P.Price) AS Total_Revenue
FROM Customers as C
INNER JOIN Orders as O  ON O.CustomerID = C.CustomerID
INNER JOIN OrderDetails as OD ON OD.OrderID=O.OrderID 
INNER JOIN Products as P ON OD.ProductID = P.ProductID
WHERE C.CustomerID=@x
GROUP BY C.CustomerID, C.FirstName, C.LastName;
---Or
DECLARE @x INT ;
set @x= 106;
SELECT SUM(O.TotalAmount) AS TotalRevenue FROM Orders O
WHERE O.CustomerID = @x;


--6)Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
SELECT C.FirstName,C.LastName,COUNT(O.OrderID) AS Order_Count
FROM Customers C
INNER JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName
ORDER BY Order_Count DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--7)Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
SELECT P.Category,SUM(OD.Quantity) AS TotalQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID=P.ProductID
GROUP BY P.Category
ORDER BY TotalQuantityOrdered DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--8)Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
SELECT  C.FirstName,C.LastName,SUM(OD.Quantity * P.Price) AS Total_Spending
FROM Customers as C
INNER JOIN Orders as O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails as OD ON O.OrderID = OD.OrderID
INNER JOIN Products as P ON OD.ProductID = P.ProductID
WHERE O.CustomerID=C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY total_spending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY
----OR 
Select C.CustomerID,C.FirstName,C.lastname,SUM(O.TotalAmount) as Total_Spending
from Customers C JOIN Orders O on O.CustomerID=C.CustomerID
group by C.CustomerID,C.FirstName,C.LastName
Order by Total_Spending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY;

--9)Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers
SELECT AVG(TotalAmount) AS Average_Order_Value
FROM Orders;


---10)Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count
SELECT  C.FirstName,C.LastName,COUNT(O.CustomerID) AS Total_Count
FROM Customers as C
LEFT JOIN Orders as O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
