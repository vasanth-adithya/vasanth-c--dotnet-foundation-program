Create database TechShop;

use Techshop;

create table Customers(
CustomerID int primary key ,
FirstName varchar(255),
LastName varchar(255),
Email varchar(255),
Phone varchar(255),
Address varchar(255));

create table Products(
ProductID int primary key ,
ProductName varchar(255),
Description varchar(255),
Price int);

create table Orders(
OrderID int primary key,
CustomerID int ,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
OrderDate Date,
TotalAMount int);

create table OrderDetails(
OrderDetailId int primary key ,
OrderId int ,
Foreign key (OrderId) references Orders(OrderID),
ProductID int , 
Foreign Key (ProductID) references Products(ProductID),
Quantity int );

create table Inventory (
InventoryID INT PRIMARY KEY,
ProductID INT,
QuantityInStock INT,
LastStockUpdate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

select * from Customers;

INSERT INTO Customers(CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '9876543210', '456 Oak St'),
    (3, 'Bob', 'Johnson', 'bob.johnson@email.com', '5551234567', '789 Pine St'),
    (4, 'Alice', 'Williams', 'alice.williams@email.com', '1112223333', '456 Elm St'),
    (5, 'Charlie', 'Brown', 'charlie.brown@email.com', '4445556666', '789 Oak St'),
    (6, 'Eva', 'Davis', 'eva.davis@email.com', '7778889999', '123 Maple St'),
    (7, 'Frank', 'Miller', 'frank.miller@email.com', '2223334444', '456 Birch St'),
    (8, 'Grace', 'Jones', 'grace.jones@email.com', '9998887777', '789 Cedar St'),
    (9, 'Henry', 'Garcia', 'henry.garcia@email.com', '3334445555', '123 Walnut St'),
    (10, 'Ivy', 'Clark', 'ivy.clark@email.com', '6667778888', '456 Pine St');

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
    (1, 'Laptop', 'Powerful laptop for professional use', 99999.99),
    (2, 'Smartphone', 'High-performance smartphone', 69999.99),
    (3, 'Water Bottle', 'To stored water', 299.99),
    (4, 'Smartwatch', 'Fitness tracker and smartwatch combo', 14999.99),
    (5, 'Washing Machine', 'Washes the clothes', 12999.99),
    (6, 'Clocks', 'Tells the time', 599.99),
    (7, 'Table Desk', 'For Doing Works', 799.99),
    (8, 'Iron Box', 'To Iron the CLothes', 499.99),
    (9, 'Mosquito Bat', 'To Kill Mosquitoes', 299.99),
    (10, 'Bluetooth Speaker', 'Portable Bluetooth speaker with rich sound', 4999.99);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 9999.99),
    (2, 2, '2023-01-02', 69999.99),
    (3, 3, '2023-01-03', 29999.99),
    (4, 4, '2023-01-04', 14999.99),
    (5, 5, '2023-01-05', 2599.98),
    (6, 6, '2023-01-06', 11999.99),
    (7, 7, '2023-01-07', 7999.99),
    (8, 8, '2023-01-08', 9999.99),
    (9, 9, '2023-01-09', 8999.97),
    (10, 10, '2023-01-10', 14999.98);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 2, 3, 1),
    (3, 3, 5, 3),
    (4, 4, 7, 6),
    (5, 5, 2, 2),
    (6, 6, 6, 1),
    (7, 7, 10, 6),
    (8, 8, 4, 2),
    (9, 9, 8, 1),
    (10, 10, 9, 3);


INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 50, '2023-01-01'),
    (2, 2, 30, '2023-01-02'),
    (3, 3, 20, '2023-01-03'),
    (4, 4, 10, '2023-01-04'),
    (5, 5, 50, '2023-01-05'),
    (6, 6, 15, '2023-01-06'),
    (7, 7, 25, '2023-01-07'),
    (8, 8, 40, '2023-01-08'),
    (9, 9, 5, '2023-01-09'),
    (10, 10, 30, '2023-01-10');

SELECT FirstName, LastName, Email FROM Customers;

SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

INSERT INTO Customers(CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11,'Damon', 'Salvatore', 'damon.salvatore@email.com', '987-654-3210', '456 Oak St');
select * from Customers;

UPDATE Products SET Price = Price * 1.10 WHERE ProductName = 'Laptop' OR 
ProductName = 'Smartphone' or 
ProductName = 'Smartwatch' or 
ProductName = 'Bluetooth Speaker';
select * from Products;

DELETE FROM OrderDetails WHERE OrderID = 6;
DELETE FROM Orders WHERE OrderID = 6;
select * from Orders;
select * from OrderDetails;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAMount)
VALUES (11,11, '2023-02-01', 1499.99);
select * from Orders;
update orders
set TotalAMount=1499.99
where OrderID=11;

UPDATE Customers
SET Email = 'daniel.alexander@email.com', Address = '789 Pine St'
WHERE CustomerID = 1;
select * from Customers;


UPDATE Orders
SET TotalAMount = (
    SELECT SUM(Quantity * Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID);
select * from Orders;


DELETE FROM OrderDetails WHERE OrderID IN 
(SELECT OrderID FROM Orders WHERE CustomerID = 1);
DELETE FROM Orders WHERE CustomerID = 1;
select * from Orders;
select * from OrderDetails;

ALTER table products
add category varchar(255);
INSERT INTO Products (ProductID,ProductName, Description, Price,category)
VALUES (11,'Tablet', 'High-performance Device', 69999.99,'Electronic Gadgets');
select * from Products;

Alter table orders
add status varchar(255);
UPDATE Orders 
SET Status = 'Shipped' 
WHERE OrderID = 2;
UPDATE Orders
Set status = 'Pending'
where OrderID = 3,
UPDATE Orders
Set status = 'Shipped'
where OrderID = 4;
UPDATE Orders
Set status = 'Pending'
where OrderID = 5;
UPDATE Orders
Set status = 'Pending'
where OrderID = 7;
UPDATE Orders
Set status = 'Shipped'
where OrderID = 8;
UPDATE Orders
Set status = 'Shipped'
where OrderID = 9;
UPDATE Orders
Set status = 'Pending'
where OrderID = 10;
UPDATE Orders
Set status = 'Shipped'
where OrderID = 11;

select * from Orders;
UPDATE Orders
Set status = 'Shipped'
where OrderID = 7;
select * from Orders;

SELECT Orders.OrderID, Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Products.ProductName, SUM(Orders.TotalAmount) AS TotalRevenue
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Products.ProductName;

SELECT  TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

select productname,category from Products;

SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;

SELECT TOP 1 Orders.OrderID, Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Orders.OrderID, Customers.FirstName, Customers.LastName
ORDER BY TotalRevenue DESC;

SELECT Products.ProductName, COUNT(OrderDetails.OrderID) AS OrderCount
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName;

SELECT Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Smartphone';

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-01-02' AND '2023-01-07';

SELECT Customers.FirstName, Customers.LastName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

SELECT COUNT(ProductID) AS TotalProducts
FROM Products;

SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.FirstName = 'Ivy';

SELECT AVG(OrderDetails.Quantity) AS AvgQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Smartphone';

SELECT SUM(TotalAmount) as TotalRevenue from Orders
where CustomerID = 7;

SELECT TOP 1 Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY OrderCount DESC;

SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

SELECT TOP 1 Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Smartphone'
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;

SELECT Customers.FirstName, Customers.LastName, AVG(Orders.TotalAmount) AS AvgOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;

SELECT Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;
SELECT Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;




