CREATE DATABASE Ecommerce;
use [Ecommerce];
CREATE TABLE customers
(
  customerID INT PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  Email VARCHAR(50),
  address VARCHAR(50)
  );
  select * from customers
  order by firstName desc;
CREATE TABLE products
(
   productID INT PRIMARY KEY,
   name VARCHAR(30),
   Description VARCHAR(30),
   price FLOAT,
   stockQuantity INT
   );
CREATE TABLE cart
(
  cartID INT PRIMARY KEY,
  customerID INT,FOREIGN KEY(customerID) REFERENCES customers(customerID),
  productid INT ,FOREIGN KEY(productid) REFERENCES products(productid),
  quantity INT
  );
CREATE TABLE orders
(
  orderID INT PRIMARY KEY,
  customerID INT,FOREIGN KEY(customerID) REFERENCES customers(customerID),
  orderDate DATE,
  totalprice FLOAT
  shippingAddress VARCHAR(100)
  );
  
CREATE TABLE OrderItem
  (
    orderItemID INT PRIMARY KEY,
	orderID INT,FOREIGN KEY(orderID) REFERENCES orders(orderID),
	productid INT ,FOREIGN KEY(productid) REFERENCES products(productid),
	quantity INT,
	itemAmount FLOAT,
);
alter table Orders add shippingAddress VARCHAR(100);

INSERT INTO customers([customerID],[firstName],[lastName],[Email],[address])
VALUES(1 ,'John',' Doe',' johndoe@example.com', '123 Main St, City'),
		(2 ,'Jane',' Smith', 'janesmith@example.com', '456 Elm St, Town'),
        (3 ,'Robert', 'Johnson',' robert@example.com',' 789 Oak St, Village'),
		(4 ,'Sarah',' Brown', 'sarah@example.com',' 101 Pine St, Suburb'),
		(5,' David',' Lee',' david@example.com',' 234 Cedar St, District'),
		(6,' Laura',' Hall',' laura@example.com',' 567 Birch St, County'),
		(7,' Michael',' Davis',' michael@example.com',' 890 Maple St, State'),
		(8,' Emma',' Wilson',' emma@example.com',' 321 Redwood St, Country'),
		(9,' William',' Taylor',' william@example.com',' 432 Spruce St, Province'),
		(10,' Olivia',' Adams',' olivia@example.com',' 765 Fir St, Territory');
	SELECT * FROM customers;

INSERT INTO products([productID],[name],[Description],[price],[stockQuantity])
VALUES(1 ,'Laptop',' High-performance laptop', 800.00, 10),
	   (2,' Smartphone',' Latest smartphone', 600.00, 15),
       (3,' Tablet',' Portable tablet', 300.00, 20),
	   (4,' Headphones',' Noise-canceling', 150.00, 30),
	   (5,' TV',' 4K Smart TV', 900.00, 5),
		(6,' Coffee Maker ','Automatic coffee maker', 50.00, 25),
		(7 ,'Refrigerator',' Energy-efficient', 700.00, 10),
		(8,' Microwave Oven',' Countertop microwave', 80.00 ,15),
		(9,' Blender',' High-speed blender', 70.00, 20),
		(10,' Vacuum Cleaner',' Bagless vacuum cleaner', 120.00 ,10);
	SELECT * FROM products;

INSERT INTO orders([orderID],[customerID],[orderDate],[totalAmount])
VALUES(1, 1,' 2023-01-05', 1200.00),
		(2, 2,' 2023-02-10', 900.00),
		(3 ,3,' 2023-03-15', 300.00),
		(4 ,4, '2023-04-20', 150.00),
		(5 ,5 ,'2023-05-25', 1800.00),
		(6 ,6 ,'2023-06-30', 400.00),
		(7, 7, '2023-07-05', 700.00),
		(8,8,' 2023-08-10', 160.00),
		(9, 9,' 2023-09-15', 140.00),
		(10, 10,' 2023-10-20', 1400.00);
	SELECT * FROM Orders;

	INSERT INTO OrderItem([orderItemID],[orderID],[productid],[quantity],[itemAmount])
	VALUES(1, 1, 1, 2, 1600.00),
			(2 ,1, 3, 1 ,300.00),
			(3, 2, 2, 3 ,1800.00),
			(4, 3, 5, 2, 1800.00),
			(5, 4, 4 ,4, 600.00),
			(6, 4 ,6, 1, 50.00),
			(7, 5, 1 ,1, 800.00),
			(8 ,5, 2, 2 ,1200.00),
			(9, 6, 10, 2, 240.00),
			(10 ,6, 9, 3 ,210.00);
	SELECT * FROM OrderItem;
	INSERT INTO cart([cartID],[customerID],[productid],[quantity])
	VALUES(1, 1, 1, 2),
		(2 ,1, 3, 1),
		(3 ,2, 2, 3),
		(4 ,3, 4 ,4),
			(5, 3, 5, 2),
			(6 ,4 ,6, 1),
			(7, 5, 1, 1),
			(8, 6, 10, 2),
			(9 ,6, 9, 3),
			(10, 7, 7, 2);
	SELECT * FROM cart;
	--1. Update refrigerator product price to 800.
	UPDATE products SET price=800 where name='refrigerator';
	SELECT * from products;

--2. Remove all cart items for a specific customer
	DELETE FROM cart WHERE customerID=2;
	SELECT * from cart;

--3. Retrieve Products Priced Below $100.
	SELECT * FROM products WHERE price<100;

--4. Find Products with Stock Quantity Greater Than 5
	SELECT * FROM products WHERE stockQuantity>5;

--5. Retrieve Orders with Total Amount Between $500 and $1000.
    SELECT * FROM orders WHERE totalAmount BETWEEN 500 AND 1000;

--6. Find Products which name end with letter ‘r’.
    SELECT * FROM products where name LIKE '%r';

--7. Retrieve Cart Items for Customer 5.
	 SELECT * from cart where customerID=5;

--8. Find Customers Who Placed Orders in 2023.
	 SELECT  DISTINCT C.*
	 from customers C
	 JOIN orders O on C.customerID=O.customerID
	 WHERE YEAR([orderDate])=2023;

--9. Determine the Minimum Stock Quantity for Each Product Category
	SELECT name,MIN(stockQuantity) as Min_Stock_Quantity
	from products
	group by name;

--10. Calculate the Total Amount Spent by Each Customer.
    SELECT C.customerID,c.firstName,C.lastName,SUM(O.totalAmount) as total_spend  from orders O 
	 JOIN customers C on O.customerID=C.customerID
	group by C.customerID,C.firstName,C.lastName;

--11. Find the Average Order Amount for Each Customer.
		SELECT C.customerID,C.firstName,C.lastName,AVG(totalAmount) as Avg_amount from orders O
		JOIN customers C on o.customerID=C.customerID
		group by C.customerID,C.firstName,C.lastName;

--12. Count the Number of Orders Placed by Each Customer
		SELECT C.customerID,C.firstName,C.lastName,COUNT(orderID) as No_of_orders from orders O
		JOIN customers C on o.customerID=C.customerID
		group by C.customerID,C.firstName,C.lastName;

--13. Find the Maximum Order Amount for Each Customer.
      SELECT C.customerID,C.firstName,C.lastName,MAX(totalprice) as Max_amount from orders O
		JOIN customers C on o.customerID=C.customerID
		group by C.customerID,C.firstName,C.lastName
		order by MAX(totalprice) desc
		offset 0 rows
		fetch next 5 rows only;

--14. Get Customers Who Placed Orders Totaling Over $1000
		SELECT * FROM customers WHERE customerID 
		IN ( SELECT customerID FROM orders WHERE totalAmount > 1000);

--15.Subquery to Find Products Not in the Cart
		SELECT * from products 
		where productID NOT IN (  SELECT productID from cart);

--16. Subquery to Find Customers Who Haven't Placed Orders.
		SELECT * from customers
		where customerID NOT IN ( SELECT distinct customerID from orders);

--17. Subquery to Calculate the Percentage of Total Revenue for a Product.
		SELECT *,price*100/ (SELECT SUM(price) from products )as Percentage from Products;

--18. Subquery to Find Products with Low Stock.
		SELECT * from products
		where stockQuantity<(select AVG(stockQuantity) from products);
--19. Subquery to Find Customers Who Placed High-Value Orders
