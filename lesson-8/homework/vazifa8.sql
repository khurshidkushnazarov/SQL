
-----------------------Easy‑Level Tasks

1.

SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;


2.

SELECT AVG(Price) AS AvgPrice
FROM Products
WHERE Category = 'Electronics';


3.

SELECT *
FROM Customers
WHERE City LIKE 'L%';


4.

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';


5.

SELECT *
FROM Customers
WHERE Country LIKE '%a';


6.

SELECT MAX(Price) AS HighestPrice
FROM Products;


7.

SELECT ProductName,
       Quantity,
       CASE
           WHEN Quantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockLevel
FROM Products;


8.

SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;


9.

SELECT MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty
FROM Orders;

----------------Medium‑Level Tasks

10.

SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
  AND o.CustomerID NOT IN (
      SELECT DISTINCT CustomerID FROM Invoices
  );


11.

SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;


12.

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;


13.

SELECT YEAR(OrderDate) AS OrderYear,
       AVG(Amount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);


14.

SELECT ProductName,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;


15.

SELECT City, [2012], [2013]
INTO Population_Each_Year
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;


16.

SELECT ProductID,
       SUM(Amount) AS TotalSales
FROM Sales
GROUP BY ProductID;


17.

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';


18.

SELECT Year, [Bektemir], [Chilonzor], [Yakkasaroy]
INTO Population_Each_City
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

-------------Hard‑Level Tasks

19

SELECT TOP 3 CustomerID,
       SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


20.

SELECT City, Year, Population
FROM Population_Each_Year
UNPIVOT (
    Population FOR Year IN ([2012], [2013])
) AS UnpivotTable;


21.

SELECT p.ProductName,
       COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;


22.

SELECT Year, City, Population
FROM Population_Each_City
UNPIVOT (
    Population FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS UnpivotTable;
