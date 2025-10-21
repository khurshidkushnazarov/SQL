--------------------Easy-Level Tasks (10)
--1. Employees with Salary > 50000 and Department Name
SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary > 50000;

--2. Customers and Orders in 2023
SELECT 
    c.FirstName,
    c.LastName,
    o.OrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    YEAR(o.OrderDate) = 2023;

--3. All Employees with Department (Including Those Without)
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

--4. All Suppliers and the Products They Supply (Include suppliers with no products)
SELECT 
    s.SupplierName,
    p.ProductName
FROM 
    Suppliers s
LEFT JOIN 
    Products p ON s.SupplierID = p.SupplierID;

--5. All Orders and Corresponding Payments (Include unmatched)
SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM 
    Orders o
FULL OUTER JOIN 
    Payments p ON o.OrderID = p.OrderID;

--6. Employees and Their Managers
SELECT 
    e.EmployeeName,
    m.EmployeeName AS ManagerName
FROM 
    Employees e
LEFT JOIN 
    Employees m ON e.ManagerID = m.EmployeeID;

--7. Students Enrolled in 'Math 101'
SELECT 
    s.StudentName,
    c.CourseName
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID
WHERE 
    c.CourseName = 'Math 101';

--8. Customers Who Placed Orders with More Than 3 Items
SELECT 
    c.FirstName,
    c.LastName,
    o.Quantity
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.Quantity > 3;

--9. Employees in 'Human Resources'
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Human Resources';

-----------------------------Medium-Level Tasks (9)
--10. Departments with More Than 5 Employees
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM 
    Departments d
JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentName
HAVING 
    COUNT(e.EmployeeID) > 5;

--11. Products That Have Never Been Sold
SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Sales s ON p.ProductID = s.ProductID
WHERE 
    s.ProductID IS NULL;

--12. Customers Who Have Placed At Least One Order
SELECT 
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.FirstName, c.LastName;

--13. Employees with Departments Only (Exclude NULLs)
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

--14. Pairs of Employees Reporting to the Same Manager
SELECT 
    e1.EmployeeName AS Employee1,
    e2.EmployeeName AS Employee2,
    e1.ManagerID
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE 
    e1.EmployeeID < e2.EmployeeID AND e1.ManagerID IS NOT NULL;

--15. Orders in 2022 with Customer Name
SELECT 
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    YEAR(o.OrderDate) = 2022;

--16. Sales Department Employees with Salary > 60000
SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Sales' AND e.Salary > 60000;

--17. Orders That Have Corresponding Payment Only
SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM 
    Orders o
JOIN 
    Payments p ON o.OrderID = p.OrderID;

--18. Products That Were Never Ordered
SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Orders o ON p.ProductID = o.ProductID
WHERE 
    o.ProductID IS NULL;

----------Hard-Level Tasks (9)
--19. Employees With Salary Greater Than Department Average
SELECT 
    e.EmployeeName,
    e.Salary
FROM 
    Employees e
JOIN (
    SELECT 
        DepartmentID,
        AVG(Salary) AS AvgSalary
    FROM 
        Employees
    GROUP BY 
        DepartmentID
) deptAvg ON e.DepartmentID = deptAvg.DepartmentID
WHERE 
    e.Salary > deptAvg.AvgSalary;

--20. Orders Before 2020 Without Payments
SELECT 
    o.OrderID,
    o.OrderDate
FROM 
    Orders o
LEFT JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE 
    p.OrderID IS NULL AND o.OrderDate < '2020-01-01';

--21. Products Without Matching Category
SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    c.CategoryID IS NULL;

--22. Employees Reporting to Same Manager and Salary > 60000
SELECT 
    e1.EmployeeName AS Employee1,
    e2.EmployeeName AS Employee2,
    e1.ManagerID,
    e1.Salary
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE 
    e1.EmployeeID < e2.EmployeeID AND e1.Salary > 60000 AND e2.Salary > 60000;

--23. Employees in Departments Starting with 'M'
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName LIKE 'M%';

--24. Sales with Amount > 500 and Product Name
SELECT 
    s.SaleID,
    p.ProductName,
    s.SaleAmount
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    s.SaleAmount > 500;

--25. Students Not Enrolled in 'Math 101'
SELECT 
    s.StudentID,
    s.StudentName
FROM 
    Students s
WHERE 
    s.StudentID NOT IN (
        SELECT 
            e.StudentID
        FROM 
            Enrollments e
        JOIN 
            Courses c ON e.CourseID = c.CourseID
        WHERE 
            c.CourseName = 'Math 101'
    );

--26. Orders Missing Payment Details
SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentID
FROM 
    Orders o
LEFT JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE 
    p.PaymentID IS NULL;

--27. Products in 'Electronics' or 'Furniture' Category
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    c.CategoryName IN ('Electronics', 'Furniture');
