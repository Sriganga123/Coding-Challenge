---QUERIES ON E COMMERCE

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
      SELECT C.customerID,C.firstName,C.lastName,MAX(totalAmount) as Max_amount from orders O
		JOIN customers C on o.customerID=C.customerID
		group by C.customerID,C.firstName,C.lastName;

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
		where stockQuantity<(select MIN(stockQuantity) from products);
--19. Subquery to Find Customers Who Placed High-Value Orders


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
		