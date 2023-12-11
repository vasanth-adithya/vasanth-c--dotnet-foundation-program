Create database CourierManagement

use CourierManagement

-- Create User table
CREATE TABLE Users
(
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

-- Create Courier table
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);

-- Create CourierServices table
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Create Location table
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address)
VALUES 
  (1, 'Manideep', 'man@gmail.com', 'mr123', '9734567890', '123 hyd St'),
  (2, 'Shyam', 'sh@gmail.com', 'shy456', '9876543210', '456 wrngl St'),
  (3, 'Bobby', 'bob@gmail.com', 'bob789', '8912223333', '789 kdp Ave'),
  (4, 'Akhil', 'akh@gmail.com', 'akh456', '9545556066', '101 nz St'),
  (5, 'Pavan', 'pk@gmail.com', 'pk123', '7278849909', '202 ngkl St');



  INSERT INTO Courier(CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES 
  (1, 'nithin', ' nizampet 42', 'araujo', '23 state st', 2.3, 'In Transit', 'TRK124056', '2023-12-10'),
  (2, 'akash', 'kukatpally 23', 'cubarsi', '28 city st', 8.2, 'Pending', 'TRK780132', NULL),
  (3, 'Johnson','lingampally 2','yamin', '101 Pine St', 3.5, 'Delivered', 'TRK344678', '2023-11-25'),
  (4, 'messi', 'bachupally 40', 'yamal', '202 kphb St', 6.3, 'In Transit', 'TRK911234', NULL),
  (5, 'pedri', 'ktr street 3', 'lamin', '123 huda St', 10.0, 'Pending', 'TRK567990', NULL);



  INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES 
  (1, 'Standard Delivery', 10.50),
  (2, 'Express Delivery', 15.75),
  (3, 'Overnight Delivery', 20.00),
  (4, 'International Delivery', 25.50),
  (5, 'Same-Day Delivery', 30.00);



  INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES 
  (1, 'robert', 'ro@gmail.com', '9234567890', 'Manager', 60000.00),
  (2, 'Smith', 'sm@gmail.com', '9876543210', 'Delivery Staff', 40000.00),
  (3, 'kohli', 'kh@gmail.com', '8712223333', 'Customer Service', 45000.00),
  (4, 'sharma', 'sha@gmail.com', '9545556666', 'Dispatcher', 55000.00),
  (5, 'ronaldo', 'rona@gmail.com','6308889999', 'Warehouse Staff', 38000.00);



  INSERT INTO Location (LocationID, LocationName, Address)
VALUES 
  (1, 'Main Office', '123 Main St, CityA, CountryA'),
  (2, 'Branch Office 1', '456 Elm St, CityB, CountryB'),
  (3, 'Warehouse', '789 Oak Ave, CityC, CountryC'),
  (4, 'Branch Office 2', '101 Pine St, CityD, CountryD'),
  (5, 'Distribution Center', '202 Cedar St, CityE, CountryE');


  INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES 
  (1, 1, 2, 75.00, '2023-12-05'),
  (2, 3, 1, 120.50, '2023-12-08'),
  (3, 2, 4, 90.25, '2023-11-28'),
  (4, 4, 3, 110.00, '2023-12-01'),
  (5, 5, 5, 80.75, '2023-12-03');


  select * from Users


  select * from Courier  where SenderName = 'messi'


  select * from Courier


  SELECT * FROM Courier WHERE CourierID = 2;




  SELECT * FROM Courier WHERE CourierID = '3' ;



  SELECT * FROM Courier WHERE Status <> 'Delivered';


  SELECT * FROM Courier WHERE DeliveryDate = '2023-12-8';



  SELECT CourierID, COUNT(*) AS TotalPackages FROM Courier GROUP BY CourierID;

  SELECT CourierID, AVG(DATEDIFF(DD,DeliveryDate, OrderDate)) AS AvgDeliveryTime FROM Courier GROUP BY CourierID;



  SELECT * FROM Courier WHERE Weight BETWEEN '3.2' AND '7.4';

  SELECT * FROM Employee WHERE Name LIKE '%John%';

  select * from Payment



  SELECT c.* FROM Courier c INNER JOIN Payment p ON c.CourierID = p.CourierID WHERE p.Amount > 50;


  SELECT EmployeeID, Name, COUNT(CourierID) AS TotalCouriersHandled
FROM Employee 
LEFT JOIN Courier  ON Employee.EmployeeID = Courier.CourierID
GROUP BY Employee.EmployeeID, Employee.Name;



SELECT Location.LocationID, Location.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Location 
LEFT JOIN Payment p ON Location.LocationID = p.LocationID
GROUP BY Location.LocationID, Location.LocationName;



SELECT L.LocationID, L.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered
FROM Location L
LEFT JOIN Payment P ON L.LocationID = P.LocationID
LEFT JOIN Courier c ON P.CourierID = c.CourierID
WHERE c.Status = 'Delivered'
GROUP BY L.LocationID, L.LocationName;



SELECT l.LocationID, l.LocationName, COALESCE(SUM(p.Amount), 0) AS TotalPayments
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING COALESCE(SUM(p.Amount), 0) < 100;



SELECT Location.LocationID, Location.LocationName, COALESCE(SUM(Payment.Amount), 0) AS TotalPayments
FROM Location 
LEFT JOIN Payment  ON Location.LocationID = Payment.LocationID
GROUP BY Location.LocationID, Location.LocationName;


SELECT  c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN Location l ON p.LocationID = l.LocationID
WHERE p.Amount > 1000
  AND l.LocationID = 4; -- Replace 'Specific_Location' with the desired location ID


  SELECT  c.* FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 1000 AND p.PaymentDate > '2000-1-10'; 




SELECT c.CourierID, c.SenderName 
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.PaymentDate < '2023-6-6' 
GROUP BY c.CourierID, c.SenderName 
HAVING SUM(p.Amount) > 5000;




SELECT l.LocationID, l.LocationName
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.PaymentDate < '2023-6-6' -- Replace 'YYYY-MM-DD' with the specific date
GROUP BY l.LocationID, l.LocationName
HAVING SUM(p.Amount) > 5000;



SELECT * FROM Payment 
INNER JOIN Courier  ON Payment.CourierID = Courier.CourierID;






SELECT *
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID;



SELECT * FROM Payment 
INNER JOIN Location  ON Payment.LocationID = Location.LocationID
INNER JOIN Courier  ON Payment.CourierID = Courier.CourierID;


SELECT *
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID;


SELECT c.CourierID, c.SenderName, SUM(p.Amount) AS TotalPaymentsReceived
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.SenderName;



SELECT * FROM Payment
WHERE PaymentDate = '2010-10-10'; 


SELECT PaymentID, PaymentDate, Amount, c.*
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID;


SELECT p.*, l.*
FROM Payment p
LEFT JOIN Location l ON p.LocationID = l.LocationID;



SELECT c.CourierID, c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.SenderName;

select * from Payment


SELECT * FROM Payment
WHERE PaymentDate BETWEEN '2018-1-10' AND '2023-12-6';


SELECT *
FROM Users u
LEFT JOIN Courier c ON u.UserID = c.UserID

UNION

SELECT *
FROM Users u
RIGHT JOIN Courier c ON u.UserID = c.UserID
WHERE u.UserID IS NULL;

select * from Courier


SELECT *
FROM Users u
LEFT JOIN Courier c ON u.UserID = c.UserID;


SELECT * FROM Users u
LEFT JOIN Courier c ON u.Name = c.SenderName OR u.Name = c.ReceiverName;

SELECT u.UserID AS User_ID, u.Name AS User_Name, c.CourierID AS Courier_ID, c.SenderName, c.ReceiverName
FROM Users u
LEFT JOIN Courier c ON u.Name = c.SenderName OR u.Name = c.ReceiverName

UNION

SELECT u.UserID AS User_ID, u.Name AS User_Name, c.CourierID AS Courier_ID, c.SenderName, c.ReceiverName
FROM Courier c
LEFT JOIN Users u ON u.Name = c.SenderName OR u.Name = c.ReceiverName
WHERE u.UserID IS NULL;




SELECT u.*, cs.*
FROM Users u
CROSS JOIN CourierServices cs;



SELECT e.*, l.*
FROM Employee e
CROSS JOIN Location l;


select * from CourierServices



SELECT c.*, cs.*
FROM Courier c
INNER JOIN CourierServices cs ON c.CourierID = cs.ServiceID;

select * from Employee

SELECT e.EmployeeID, e.Name AS EmployeeName, COUNT(c.CourierID) AS AssignedCouriers
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;




SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPaymentAmount
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;


select * from Courier




SELECT c.*, u.*
FROM Courier c
LEFT JOIN Users u ON c.SenderName = u.Name;


SELECT c1.*
FROM Courier c1
JOIN Courier c2 ON c1.SenderName = c2.SenderName
WHERE c1.CourierID <> c2.CourierID 



select * from Employee


SELECT Role, Name AS EmployeesWithSameRole
FROM Employee
GROUP BY Role,Name
HAVING COUNT(*) > 1;


SELECT CourierID,Weight
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);



SELECT Name
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);




SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);



SELECT c.*
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID;


SELECT l.*
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.Amount = (SELECT MAX(Amount) FROM Payment);

SELECT * FROM Courier

SELECT * FROM Courier
WHERE Weight > (SELECT SUM(Weight)FROM Courier WHERE SenderName = 'messi');
