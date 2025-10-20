
1.
  BULK INSERT — катта ҳажмдаги маълумотларни файлдан (масалан, CSV ёки TXT) SQL Server жадвалига тезда импорт қилиш учун ишлатилади.
У ташқи маълумотларни SQL Server'га юклашда самарали усул ҳисобланади.

2. 

.csv (Comma Separated Values)

.txt (Text Files)

.xls / .xlsx (Excel Files)

.xml (Extensible Markup Language)

3. 

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);


4. 

INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1500.00),
(2, 'Mouse', 25.50),
(3, 'Monitor', 300.00);


5. 

NULL: Indicates that a column can have no value (unknown or missing).
NOT NULL: Ensures that a column must have a value (cannot be empty).


6. 

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);


7. 

SELECT * FROM Products
WHERE Price > 100;


8. 

ALTER TABLE Products
ADD CategoryID INT;


9. 

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);


10. 

IDENTITY is used to automatically generate sequential numbers for a column,
commonly used for auto-incrementing primary keys.
Example: IDENTITY(1,1) starts at 1 and increments by 1.



11. 

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


(Make sure the file path and format are correct for your environment.)

12. 

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


13. 

- PRIMARY KEY: Uniquely identifies each row; only one per table; NOT NULL by default.
- UNIQUE KEY: Ensures uniqueness; multiple per table; allows NULLs (unless defined otherwise).


14. 

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);


15. 

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;


16. 

SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;


17. 

A FOREIGN KEY ensures referential integrity by enforcing that a value in one table 
must exist in another table. It links related tables together.



18. 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
);


19. Create table with IDENTITY (start 100, increment 10):

CREATE TABLE ProductsLog (
    LogID INT IDENTITY(100, 10) PRIMARY KEY,
    ProductName VARCHAR(50),
    LogDate DATETIME DEFAULT GETDATE()
);


20. 

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);


21. 


SELECT ISNULL(Price, 0) FROM Products;

SELECT COALESCE(Price, Stock, 0) FROM Products;


22. 

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);


23. 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
