
-- 1. 
SELECT P.ProductName, S.SupplierName
FROM Products P
CROSS JOIN Suppliers S;

-- 2. 
SELECT D.DepartmentName, E.Name AS EmployeeName
FROM Departments D
CROSS JOIN Employees E;

-- 3. 
SELECT S.SupplierName, P.ProductName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- 4. 
SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

-- 5. 
SELECT S.Name AS StudentName, C.CourseName
FROM Students S
CROSS JOIN Courses C;

-- 6. 
SELECT P.ProductName, O.OrderID
FROM Products P
INNER JOIN Orders O ON P.ProductID = O.ProductID;

-- 7. 
SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- 8. 
SELECT S.Name AS StudentName, E.CourseID
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID;

-- 9. 
SELECT O.OrderID, P.PaymentID
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID;

-- 10. 
SELECT O.OrderID, P.ProductName, P.Price
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Price > 100;



--11.

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D
  ON E.DepartmentID <> D.DepartmentID;


--12.
SELECT O.OrderID, P.ProductName, O.Quantity AS OrderedQty, P.StockQuantity
FROM Orders O
INNER JOIN Products P
  ON O.ProductID = P.ProductID
WHERE O.Quantity > P.StockQuantity;


--13.

SELECT C.FirstName + ' ' + C.LastName AS CustomerName, S.ProductID, S.SaleAmount
FROM Sales S
INNER JOIN Customers C
  ON S.CustomerID = C.CustomerID
WHERE S.SaleAmount >= 500;


--14.

SELECT S.Name AS StudentName, C.CourseName
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;


--15.

SELECT P.ProductName, S.SupplierName
FROM Products P
INNER JOIN Suppliers S
  ON P.SupplierID = S.SupplierID
WHERE S.SupplierName LIKE '%Tech%';


--16.

SELECT O.OrderID, O.TotalAmount, P.Amount AS PaymentAmount
FROM Orders O
INNER JOIN Payments P
  ON O.OrderID = P.OrderID
WHERE P.Amount < O.TotalAmount;


--17.

SELECT E.Name AS EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D
  ON E.DepartmentID = D.DepartmentID;


--18.

SELECT P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C
  ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');


--19.

SELECT S.SaleID, S.ProductID, S.SaleAmount, C.FirstName + ' ' + C.LastName AS CustomerName
FROM Sales S
INNER JOIN Customers C
  ON S.CustomerID = C.CustomerID
WHERE C.Country = 'USA';


--20.

SELECT O.OrderID, O.TotalAmount, C.FirstName + ' ' + C.LastName AS CustomerName
FROM Orders O
INNER JOIN Customers C
  ON O.CustomerID = C.CustomerID
WHERE C.Country = 'Germany'
  AND O.TotalAmount > 100;


--21.

SELECT A.Name AS EmployeeA, B.Name AS EmployeeB,
       A.DepartmentID AS DeptA, B.DepartmentID AS DeptB
FROM Employees A
INNER JOIN Employees B
  ON A.EmployeeID <> B.EmployeeID
  AND A.DepartmentID <> B.DepartmentID;


--22.

SELECT P.PaymentID, O.OrderID,
       O.Quantity, PR.ProductName, PR.Price,
       P.Amount AS PaidAmount,
       (O.Quantity * PR.Price) AS ExpectedAmount
FROM Payments P
INNER JOIN Orders O ON P.OrderID = O.OrderID
INNER JOIN Products PR ON O.ProductID = PR.ProductID
WHERE P.Amount <> (O.Quantity * PR.Price);


--23.

SELECT S.StudentID, S.Name
FROM Students S
LEFT JOIN Enrollments E
  ON S.StudentID = E.StudentID
WHERE E.StudentID IS NULL;


--24.

SELECT M.EmployeeID AS ManagerID, M.Name AS ManagerName,
       E.EmployeeID AS SubordinateID, E.Name AS SubordinateName,
       M.Salary AS ManagerSalary, E.Salary AS SubordinateSalary
FROM Employees M
INNER JOIN Employees E
  ON E.ManagerID = M.EmployeeID
WHERE M.Salary <= E.Salary;


--25.

SELECT DISTINCT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
INNER JOIN Customers C
  ON O.CustomerID = C.CustomerID
LEFT JOIN Payments P
  ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;
