
1.
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

2.
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali', 5000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(2, 'Bobur', 6000.00),
(3, 'Dilshod', 5500.00);

3.
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;

4.

DELETE FROM Employees
WHERE EmpID = 2;

5.
DELETE: Шартга асосан сатрларни ўчиради, агар транзакция ичида бўлса, қайтарилиши мумкин.

TRUNCATE: Барча сатрларни тезда ўчиради, WHERE шартидан фойдаланиб бўлмайди, кам лог ёзилади.

DROP: Бутун жадвални (тузилиши ва маълумотлари билан) ўчиради, қайтариб бўлмайди.

6.

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

7. 
ALTER TABLE Employees
ADD Department VARCHAR(50);

8.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

9.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10.
TRUNCATE TABLE Employees;

11.
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Logistics';

12.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

13.
TRUNCATE TABLE Employees;

14.
ALTER TABLE Employees
DROP COLUMN Department;

15.
EXEC sp_rename 'Employees', 'StaffMembers';

16.
DROP TABLE Departments;

17.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description VARCHAR(200)
);

18.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

19.

EXEC sp_rename 'Products.ProductCategory', 'Category', 'COLUMN';

20.
INSERT INTO Products (ProductID, ProductName, Category, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop'),
(2, 'Chair', 'Furniture', 150.00, 'Ergonomic office chair'),
(3, 'Phone', 'Electronics', 800.00, 'Smartphone with 5G'),
(4, 'Desk', 'Furniture', 200.00, 'Wooden desk'),
(5, 'Headphones', 'Electronics', 100.00, 'Wireless headphones');

21.
SELECT * INTO Products_Backup
FROM Products;

22.
EXEC sp_rename 'Products', 'Inventory';

23.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

24.
ALTER TABLE Inventory
ADD ProductCodeTemp INT;

WITH CTE AS (
    SELECT ProductID, ROW_NUMBER() OVER (ORDER BY ProductID) AS rn
    FROM Inventory
)
UPDATE i
SET ProductCodeTemp = 1000 + (c.rn - 1) * 5
FROM Inventory i
JOIN CTE c ON i.ProductID = c.ProductID;

EXEC sp_rename 'Inventory.ProductCodeTemp', 'ProductCode', 'COLUMN';

