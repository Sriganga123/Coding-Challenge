use [CARRENTALSYSTEM];
use [Ecommerce];
use [VAG];
use [CrimeManagement];


select distinct lastname from [dbo].[Customer];


select * from Payment
where year([transactionDate])=2023;

select C.[customerID] from Customers C
join Orders O on o.CustomerID=C.customerID
where o.totalamount>(select avg(totalamount) from orders);

select V.name,S.name,C.[IncidentType] from Crime C
join Suspect S on S.CrimeID=C.CrimeID
join Victim V on V.CrimeID=S.CrimeID
where C.IncidentType='Robbery';