Easy‑Level Tasks

1.

SELECT MIN(Price) AS MinPrice
FROM Products;


2.

SELECT MAX(Salary) AS MaxSalary
FROM Employees;


3.

SELECT COUNT(*) AS NumCustomers
FROM Customers;


4.

SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;


5.

SELECT SUM(Amount) AS TotalSalesForProduct7
FROM Sales
WHERE ProductID = 7;


6.

SELECT AVG(Age) AS AvgAge
FROM Employees;


7.

SELECT DeptID, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DeptID;


8.

SELECT Category,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;


9.

SELECT CustomerID,
       SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID;


10

SELECT DeptID,
       COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;

Medium‑Level Tasks

11.

SELECT ProductCategory,
       SUM(Amount) AS TotalSales,
       AVG(Amount) AS AvgSales
FROM Sales
GROUP BY ProductCategory;


12.

SELECT COUNT(*) AS NumHREmployees
FROM Employees
WHERE DeptID = 'HR';


13.

SELECT DeptID,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DeptID;


14.

SELECT DeptID,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;


15.

SELECT DeptID,
       AVG(Salary) AS AvgSalary,
       COUNT(*) AS NumEmployees
FROM Employees
GROUP BY DeptID;


16.

SELECT Category,
       AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;


17.

SELECT YEAR(SaleDate) AS SaleYear,
       SUM(Amount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);


18.

SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;


19.

SELECT DeptID,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 60000;

Hard‑Level Tasks

20.
SELECT Category,
       AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;


21.

SELECT CustomerID,
       SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(Amount) > 1500;


22.

SELECT DeptID,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 65000;


23.

SELECT custid,
       SUM(freight) AS TotalFreightOver50,
       MIN(freight) AS LeastFreightOver50
FROM Sales.Orders
WHERE freight > 50
GROUP BY custid;


24

SELECT YEAR(SaleDate) AS SaleYear,
       MONTH(SaleDate) AS SaleMonth,
       SUM(Amount) AS TotalSales,
       COUNT(DISTINCT ProductID) AS UniqueProductsSold
FROM Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
HAVING COUNT(DISTINCT ProductID) >= 2;


25.
SELECT YEAR(orderdate) AS OrderYear,
       MIN(qty) AS MinQuantity,
       MAX(qty) AS MaxQuantity
FROM Sales.OrderDetails od
  JOIN Sales.Orders o
    ON od.orderid = o.orderid
GROUP BY YEAR(o.orderdate);
