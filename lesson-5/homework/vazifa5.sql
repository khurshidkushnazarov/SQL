-----------------Easy-Level Tasks---------------
1. 

SELECT ProductName AS Name
FROM Products;


2. 

SELECT Client.CustomerID, Client.FirstName, Client.LastName
FROM Customers AS Client;


3. 

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;



4. 

SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;


5. 

SELECT DISTINCT FirstName, LastName, Country
FROM Customers;


6. 

SELECT ProductName,
       Price,
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;


7. 

SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

----------Medium-Level Tasks-----------------

1. Repeated UNION of ProductName from both tables:

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;


2. EXCEPT to get products not in Products_Discounted:

SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;


3. IIF for Expensive vs Affordable:

SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceStatus
FROM Products;


4. Employees with Age < 25 OR Salary > 60000:

SELECT * 
FROM Employees
WHERE Age < 25 OR Salary > 60000;


5. Update salary by 10% if Department is 'HR' or EmployeeID = 5:

UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmpID = 5;


---------- Hard-Level Tasks---------------------

1. CASE for tiered sales classification:

SELECT SaleID,
       SaleAmount,
       CASE
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleTier
FROM Sales;


2. EXCEPT - Customer IDs with orders but not in Sales:

SELECT DISTINCT CustomerID 
FROM Orders
EXCEPT
SELECT DISTINCT CustomerID 
FROM Sales;


3. Discount % based on quantity (from Orders table):

SELECT CustomerID,
       Quantity,
       CASE
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
           ELSE '7%'
       END AS DiscountPercentage
FROM Orders;
