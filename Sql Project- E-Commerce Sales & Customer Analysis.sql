/*SQL Project: E-Commerce Sales & Customer Analysis*/


CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Customers VALUES
(1,'Arun',25,'Male','Chennai','Tamil Nadu'),
(2,'Priya',28,'Female','Coimbatore','Tamil Nadu'),
(3,'Karthik',32,'Male','Bangalore','Karnataka'),
(4,'Divya',24,'Female','Madurai','Tamil Nadu'),
(5,'Rahul',35,'Male','Hyderabad','Telangana'),
(6,'Sneha',29,'Female','Chennai','Tamil Nadu'),
(7,'Vijay',41,'Male','Bangalore','Karnataka'),
(8,'Anitha',27,'Female','Coimbatore','Tamil Nadu'),
(9,'Suresh',38,'Male','Hyderabad','Telangana'),
(10,'Meena',31,'Female','Chennai','Tamil Nadu'),
(11,'Ajay',26,'Male','Madurai','Tamil Nadu'),
(12,'Nisha',30,'Female','Bangalore','Karnataka'),
(13,'Ramesh',45,'Male','Chennai','Tamil Nadu'),
(14,'Kavya',23,'Female','Hyderabad','Telangana'),
(15,'Manoj',36,'Male','Coimbatore','Tamil Nadu');
INSERT INTO Products VALUES
(101,'Laptop','Electronics',55000),
(102,'Smartphone','Electronics',25000),
(103,'Headphones','Electronics',2000),
(104,'Keyboard','Accessories',1500),
(105,'Mouse','Accessories',800),
(106,'Monitor','Electronics',12000),
(107,'Office Chair','Furniture',9000),
(108,'Desk','Furniture',7000),
(109,'USB Cable','Accessories',500),
(110,'Webcam','Electronics',3500);
INSERT INTO Orders VALUES
(1001,1,101,'2026-01-05',1,55000),
(1002,2,102,'2026-01-10',2,50000),
(1003,3,103,'2026-01-15',3,6000),
(1004,4,104,'2026-01-20',2,3000),
(1005,5,106,'2026-02-03',1,12000),
(1006,6,107,'2026-02-08',1,9000),
(1007,7,108,'2026-02-12',2,14000),
(1008,8,105,'2026-02-18',5,4000),
(1009,9,101,'2026-03-02',1,55000),
(1010,10,102,'2026-03-05',1,25000),
(1011,11,110,'2026-03-12',2,7000),
(1012,12,103,'2026-03-18',4,8000),
(1013,13,106,'2026-04-01',2,24000),
(1014,14,109,'2026-04-05',10,5000),
(1015,15,107,'2026-04-10',2,18000),
(1016,1,102,'2026-04-15',1,25000),
(1017,2,101,'2026-05-02',1,55000),
(1018,3,105,'2026-05-08',10,8000),
(1019,6,106,'2026-05-15',1,12000),
(1020,10,110,'2026-05-20',3,10500);
INSERT INTO Payments VALUES
(1,1001,'Credit Card','Success'),
(2,1002,'UPI','Success'),
(3,1003,'Debit Card','Success'),
(4,1004,'UPI','Success'),
(5,1005,'Credit Card','Success'),
(6,1006,'UPI','Success'),
(7,1007,'Credit Card','Failed'),
(8,1008,'UPI','Success'),
(9,1009,'Debit Card','Success'),
(10,1010,'UPI','Success'),
(11,1011,'Credit Card','Success'),
(12,1012,'UPI','Success'),
(13,1013,'Debit Card','Success'),
(14,1014,'UPI','Failed'),
(15,1015,'Credit Card','Success'),
(16,1016,'UPI','Success'),
(17,1017,'Credit Card','Success'),
(18,1018,'UPI','Success'),
(19,1019,'Debit Card','Success'),
(20,1020,'Credit Card','Success');

/*basic queries*/

SELECT *
FROM Customers;
SELECT *
FROM Customers
WHERE City = 'Chennai';
SELECT CustomerName, Age
FROM Customers
WHERE Age > 30;
SELECT ProductName, Price
FROM Products
WHERE Price > 10000;
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

/*Aggregation*/

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;
SELECT MAX(TotalAmount) AS HighestOrder
FROM Orders;
SELECT COUNT(*) AS TotalOrders
FROM Orders;
SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;

/*Group by*/

SELECT 
    p.ProductName,
    SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;
SELECT 
    p.Category,
    SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;
SELECT 
    c.City,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY TotalOrders DESC;
SELECT 
    c.CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING SUM(o.TotalAmount) > 50000;

/*Joins queries*/
SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID;
SELECT 
    o.OrderID,
    p.ProductName,
    o.Quantity,
    o.TotalAmount
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID;
SELECT
    c.CustomerName,
    p.ProductName,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID;
    
/*case when*/

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount >= 50000 THEN 'High Value'
        WHEN TotalAmount >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS OrderCategory
FROM Orders;
SELECT
    PaymentStatus,
    COUNT(*) AS PaymentCount
FROM Payments
GROUP BY PaymentStatus;

/*Subquery*/

SELECT ProductName, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

/*CTE*/

WITH CustomerSales AS (
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(o.TotalAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o
        ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT *
FROM CustomerSales
ORDER BY TotalSpent DESC;

/*Window function*/

/*Rank customers based on spending*/
WITH CustomerSales AS (
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(o.TotalAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o
        ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT
    CustomerName,
    TotalSpent,
    RANK() OVER (ORDER BY TotalSpent DESC) AS CustomerRank
FROM CustomerSales;


/*Find monthly revenue*/
SELECT
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY OrderMonth;

/*Find the top 3 products by revenue*/
SELECT
    p.ProductName,
    SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Revenue DESC
LIMIT 3;

/*Find each customer's total spending and rank*/
WITH CustomerSales AS (
    SELECT
        c.CustomerName,
        SUM(o.TotalAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o
        ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT
    CustomerName,
    TotalSpent,
    DENSE_RANK() OVER (
        ORDER BY TotalSpent DESC
    ) AS SpendingRank
FROM CustomerSales;