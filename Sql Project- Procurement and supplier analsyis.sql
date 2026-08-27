/*SQL Project: Procurement & Supplier Analysis*/

CREATE DATABASE ProcurementAnalysis;
USE ProcurementAnalysis;
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    City VARCHAR(50),
    SupplierCategory VARCHAR(50)
);
CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY,
    MaterialName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);
CREATE TABLE PurchaseOrders (
    PO_ID INT PRIMARY KEY,
    SupplierID INT,
    MaterialID INT,
    PO_Date DATE,
    Quantity INT,
    TotalAmount DECIMAL(12,2),
    DeliveryStatus VARCHAR(20),
    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (MaterialID)
        REFERENCES Materials(MaterialID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PO_ID INT,
    PaymentDate DATE,
    PaymentStatus VARCHAR(20),
    PaymentMethod VARCHAR(30),
    FOREIGN KEY (PO_ID)
        REFERENCES PurchaseOrders(PO_ID)
);
INSERT INTO Suppliers
(SupplierID, SupplierName, City, SupplierCategory)
VALUES
(1, 'ABC Components', 'Chennai', 'Electronics'),
(2, 'Global Tech', 'Bangalore', 'Electronics'),
(3, 'Sri Lakshmi Traders', 'Coimbatore', 'Consumables'),
(4, 'Prime Industrial', 'Chennai', 'MRO'),
(5, 'Delta Supplies', 'Hyderabad', 'Consumables'),
(6, 'Metro Engineering', 'Bangalore', 'MRO'),
(7, 'Star Components', 'Chennai', 'Electronics'),
(8, 'Quality Industrial', 'Coimbatore', 'MRO');
INSERT INTO Materials
(MaterialID, MaterialName, Category, UnitPrice)
VALUES
(101, 'PCB Board', 'Electronics', 2500),
(102, 'IC Chip', 'Electronics', 850),
(103, 'Connector', 'Electronics', 120),
(104, 'Safety Gloves', 'Consumables', 150),
(105, 'Cleaning Chemical', 'Consumables', 450),
(106, 'Bearing', 'MRO', 1800),
(107, 'Lubricant', 'MRO', 650),
(108, 'Screw Set', 'MRO', 200),
(109, 'Cable', 'Electronics', 750),
(110, 'Safety Shoes', 'Consumables', 1200);
INSERT INTO PurchaseOrders
(PO_ID, SupplierID, MaterialID, PO_Date, Quantity, TotalAmount, DeliveryStatus)
VALUES
(1001, 1, 101, '2026-01-05', 50, 125000, 'Delivered'),
(1002, 2, 102, '2026-01-10', 100, 85000, 'Delivered'),
(1003, 3, 104, '2026-01-15', 200, 30000, 'Delivered'),
(1004, 4, 106, '2026-01-20', 40, 72000, 'Delayed'),
(1005, 5, 105, '2026-02-03', 100, 45000, 'Delivered'),
(1006, 6, 107, '2026-02-08', 80, 52000, 'Delivered'),
(1007, 7, 103, '2026-02-12', 500, 60000, 'Delivered'),
(1008, 8, 108, '2026-02-18', 300, 60000, 'Delayed'),
(1009, 1, 109, '2026-03-02', 150, 112500, 'Delivered'),
(1010, 2, 101, '2026-03-05', 30, 75000, 'Delivered'),
(1011, 3, 110, '2026-03-12', 100, 120000, 'Delivered'),
(1012, 4, 106, '2026-03-18', 60, 108000, 'Delayed'),
(1013, 5, 105, '2026-04-01', 150, 67500, 'Delivered'),
(1014, 6, 107, '2026-04-05', 100, 65000, 'Delivered'),
(1015, 7, 103, '2026-04-10', 800, 96000, 'Delivered'),
(1016, 8, 106, '2026-04-15', 50, 90000, 'Delivered'),
(1017, 1, 101, '2026-05-02', 40, 100000, 'Delivered'),
(1018, 2, 102, '2026-05-08', 120, 102000, 'Delayed'),
(1019, 6, 108, '2026-05-15', 500, 100000, 'Delivered'),
(1020, 4, 107, '2026-05-20', 150, 97500, 'Delivered');
INSERT INTO Payments
(PaymentID, PO_ID, PaymentDate, PaymentStatus, PaymentMethod)
VALUES
(1, 1001, '2026-01-10', 'Paid', 'Bank Transfer'),
(2, 1002, '2026-01-15', 'Paid', 'Bank Transfer'),
(3, 1003, '2026-01-20', 'Paid', 'UPI'),
(4, 1004, '2026-01-25', 'Pending', 'Bank Transfer'),
(5, 1005, '2026-02-10', 'Paid', 'UPI'),
(6, 1006, '2026-02-15', 'Paid', 'Bank Transfer'),
(7, 1007, '2026-02-20', 'Paid', 'Credit Card'),
(8, 1008, '2026-02-25', 'Pending', 'Bank Transfer'),
(9, 1009, '2026-03-10', 'Paid', 'Bank Transfer'),
(10, 1010, '2026-03-12', 'Paid', 'UPI'),
(11, 1011, '2026-03-20', 'Paid', 'Bank Transfer'),
(12, 1012, '2026-03-25', 'Pending', 'Bank Transfer'),
(13, 1013, '2026-04-10', 'Paid', 'UPI'),
(14, 1014, '2026-04-15', 'Paid', 'Bank Transfer'),
(15, 1015, '2026-04-20', 'Paid', 'Credit Card'),
(16, 1016, '2026-04-25', 'Paid', 'Bank Transfer'),
(17, 1017, '2026-05-10', 'Paid', 'Bank Transfer'),
(18, 1018, '2026-05-15', 'Pending', 'UPI'),
(19, 1019, '2026-05-20', 'Paid', 'Bank Transfer'),
(20, 1020, '2026-05-25', 'Paid', 'UPI');

/*basic queries*/

SELECT * FROM Suppliers;
SELECT * FROM Materials;
SELECT * FROM PurchaseOrders;
SELECT * FROM Payments;
SELECT *
FROM PurchaseOrders
WHERE DeliveryStatus = 'Delayed';
SELECT
    PO_ID,
    TotalAmount
FROM PurchaseOrders
WHERE TotalAmount > 100000;

/*ORDER BY*/

SELECT
    PO_ID,
    TotalAmount
FROM PurchaseOrders
ORDER BY TotalAmount DESC;
SELECT
    PO_ID,
    TotalAmount
FROM PurchaseOrders
ORDER BY TotalAmount ASC;

/*Aggregation*/

SELECT COUNT(*) AS Total_Purchase_Orders
FROM PurchaseOrders;
SELECT SUM(TotalAmount) AS Total_Procurement_Spend
FROM PurchaseOrders;
SELECT AVG(TotalAmount) AS Average_PO_Value
FROM PurchaseOrders;
SELECT MAX(TotalAmount) AS Highest_PO_Value
FROM PurchaseOrders;
SELECT MIN(TotalAmount) AS Lowest_PO_Value
FROM PurchaseOrders;

/*Group by*/

SELECT
    SupplierID,
    SUM(TotalAmount) AS Total_Spend
FROM PurchaseOrders
GROUP BY SupplierID
ORDER BY Total_Spend DESC;
SELECT
    DeliveryStatus,
    COUNT(*) AS Total_Orders
FROM PurchaseOrders
GROUP BY DeliveryStatus;
SELECT
    MONTH(PO_Date) AS Purchase_Month,
    SUM(TotalAmount) AS Monthly_Spend
FROM PurchaseOrders
GROUP BY MONTH(PO_Date)
ORDER BY Purchase_Month;

/*Having*/

SELECT
    SupplierID,
    SUM(TotalAmount) AS Total_Spend
FROM PurchaseOrders
GROUP BY SupplierID
HAVING SUM(TotalAmount) > 200000;
SELECT
    SupplierID,
    COUNT(*) AS Total_Orders
FROM PurchaseOrders
GROUP BY SupplierID
HAVING COUNT(*) > 2;

/*Join*/

SELECT
    s.SupplierName,
    p.PO_ID,
    p.PO_Date,
    p.TotalAmount
FROM PurchaseOrders p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID;
SELECT
    p.PO_ID,
    s.SupplierName,
    m.MaterialName,
    m.Category,
    p.Quantity,
    p.TotalAmount,
    p.DeliveryStatus
FROM PurchaseOrders p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
INNER JOIN Materials m
    ON p.MaterialID = m.MaterialID;

/*Case_when*/

SELECT
    PO_ID,
    TotalAmount,
    CASE
        WHEN TotalAmount >= 100000 THEN 'High Value'
        WHEN TotalAmount >= 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS PO_Category
FROM PurchaseOrders;

/*subquery*/

SELECT
    PO_ID,
    TotalAmount
FROM PurchaseOrders
WHERE TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM PurchaseOrders
);
SELECT
    MaterialName,
    UnitPrice
FROM Materials
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Materials
);

/*CTE*/

WITH SupplierSpend AS
(
    SELECT
        SupplierID,
        SUM(TotalAmount) AS TotalSpend
    FROM PurchaseOrders
    GROUP BY SupplierID
)

SELECT
    SupplierID,
    TotalSpend
FROM SupplierSpend
ORDER BY TotalSpend DESC;

WITH SupplierSpend AS
(
    SELECT
        SupplierID,
        SUM(TotalAmount) AS TotalSpend
    FROM PurchaseOrders
    GROUP BY SupplierID
)

SELECT
    s.SupplierName,
    ss.TotalSpend
FROM SupplierSpend ss
INNER JOIN Suppliers s
    ON ss.SupplierID = s.SupplierID
ORDER BY ss.TotalSpend DESC;

/*rank*/

WITH SupplierSpend AS
(
    SELECT
        SupplierID,
        SUM(TotalAmount) AS TotalSpend
    FROM PurchaseOrders
    GROUP BY SupplierID
)

SELECT
    s.SupplierName,
    ss.TotalSpend,
    RANK() OVER (
        ORDER BY ss.TotalSpend DESC
    ) AS SupplierRank
FROM SupplierSpend ss
INNER JOIN Suppliers s
    ON ss.SupplierID = s.SupplierID
ORDER BY SupplierRank;