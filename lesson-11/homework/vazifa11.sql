-------------------Easy-Level Tasks--------------------------------
--1. 
Return: OrderID, CustomerName, OrderDate

SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    o.OrderDate > '2022-12-31';

--2. 

Return: EmployeeName, DepartmentName

SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName IN ('Sales', 'Marketing');

--3. 

Return: DepartmentName, MaxSalary

SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM 
    Departments d
JOIN 
    Employees e ON e.DepartmentID = d.DepartmentID
GROUP BY 
    d.DepartmentName;

--4. 

Return: CustomerName, OrderID, OrderDate

SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;

--5. 

Return: CustomerName, TotalOrders

SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerName;

--6. 
Return: ProductName, SupplierName

SELECT 
    p.ProductName,
    s.SupplierName
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE 
    s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');

--7. 

Return: CustomerName, MostRecentOrderDate

SELECT 
    c.CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerName;


------------------------------------ Medium-Level Tasks -----------------

--8. 

Return: CustomerName, OrderTotal

SELECT 
    c.CustomerName,
    o.TotalAmount AS OrderTotal
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    o.TotalAmount > 500;

--9. 
Return: ProductName, SaleDate, SaleAmount

SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;

--10. 

Return: ProductName, TotalSalesAmount

SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName;

--11. 

Return: EmployeeName, DepartmentName, Salary

SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'HR' AND e.Salary > 60000;

--12. 

Return: ProductName, SaleDate, StockQuantity

SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;

--13. 
Return: EmployeeName, DepartmentName, HireDate

SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.HireDate
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Sales' OR e.HireDate > '2020-12-31';


------------------ Hard-Level Tasks -------------------------

--14. 
Return: CustomerName, OrderID, Address, OrderDate

SELECT 
    c.CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

--15. 

Return: ProductName, Category, SaleAmount

SELECT 
    p.ProductName,
    p.Category,
    s.SaleAmount
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    p.Category = 'Electronics' OR s.SaleAmount > 350;

--16. 

Return: CategoryName, ProductCount

SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM 
    Categories c
LEFT JOIN 
    Products p ON c.CategoryID = p.CategoryID
GROUP BY 
    c.CategoryName;

--17. 

Return: CustomerName, City, OrderID, Amount

SELECT 
    c.CustomerName,
    c.City,
    o.OrderID,
    o.TotalAmount AS Amount
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    c.City = 'Los Angeles' AND o.TotalAmount > 300;

--18. 

Return: EmployeeName, DepartmentName

SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName IN ('HR', 'Finance') 
    OR 
    LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(e.EmployeeName, 'a',''), 'e',''), 'i',''), 'o',''), 'u','')) <= LEN(e.EmployeeName) - 4;

--19.

Return: EmployeeName, DepartmentName, Salary

SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName IN ('Sales', 'Marketing') AND e.Salary > 60000;
