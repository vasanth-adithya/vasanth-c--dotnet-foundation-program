CREATE DATABASE HMBank
USE HMBank;



-- Customers Table
CREATE TABLE Customers (
 customer_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 DOB DATE,
 email VARCHAR(100),
 phone_number VARCHAR(15),
 address VARCHAR(255)
);
-- Accounts Table
CREATE TABLE Accounts (
 account_id INT PRIMARY KEY,
 customer_id INT,
 account_type VARCHAR(20),
 balance DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Transactions Table
CREATE TABLE Transactions (
 transaction_id INT PRIMARY KEY,
 account_id INT,
 transaction_type VARCHAR(20),
 amount DECIMAL(10, 2),
 transaction_date DATE,
 FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);


INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address)
VALUES
(1, 'John', 'Doe', '1980-05-15', 'john.doe@email.com', '555-1234', '123 Main St'),
(2, 'Jane', 'Smith', '1992-08-22', 'jane.smith@email.com', '555-5678', '456 Oak St'),
(3, 'Alice', 'Johnson', '1985-11-08', 'alice.johnson@email.com', '555-9876', '789 Pine St'),
(4, 'Bob', 'Williams', '1990-04-25', 'bob.williams@email.com', '555-4321', '101 Cedar St'),
(5, 'Eva', 'Davis', '1982-09-18', 'eva.davis@email.com', '555-8765', '202 Elm St'),
(6, 'Michael', 'Lee', '1995-06-30', 'michael.lee@email.com', '555-3456', '303 Maple St'),
(7, 'Samantha', 'Jones', '1988-12-12', 'samantha.jones@email.com', '555-6543', '404 Birch St'),
(8, 'David', 'Taylor', '1987-03-05', 'david.taylor@email.com', '555-7890', '505 Oak St'),
(9, 'Sophia', 'Brown', '1993-07-28', 'sophia.brown@email.com', '555-2109', '606 Pine St'),
(10, 'Daniel', 'Miller', '1983-02-14', 'daniel.miller@email.com', '555-1098', '707 Cedar St');



INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
(101, 1, 'savings', 5000.00),
(102, 1, 'current', 1500.00),
(103, 2, 'savings', 8000.00),
(104, 2, 'current', 2500.00),
(105, 3, 'savings', 6000.00),
(106, 3, 'current', 2000.00),
(107, 4, 'savings', 7000.00),
(108, 5, 'current', 3000.00),
(109, 5, 'savings', 9000.00),
(110, 6, 'savings', 4000.00),
(111, 7, 'current', 5000.00),
(112, 8, 'savings', 12000.00),
(113, 9, 'current', 8000.00);



INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(1001, 101, 'deposit', 1000.00, '2023-01-10 08:30:00'),
(1002, 101, 'withdrawal', 500.00, '2023-02-15 12:45:00'),
(1003, 102, 'deposit', 2000.00, '2023-03-20 15:15:00'),
(1004, 102, 'withdrawal', 100.00, '2023-04-05 09:30:00'),
(1005, 103, 'deposit', 3000.00, '2023-05-12 14:20:00'),
(1006, 104, 'withdrawal', 800.00, '2023-06-18 11:10:00'),
(1007, 105, 'deposit', 1500.00, '2023-07-25 10:45:00'),
(1008, 106, 'withdrawal', 200.00, '2023-08-30 16:00:00'),
(1009, 107, 'deposit', 2500.00, '2023-09-15 13:15:00'),
(1010, 108, 'withdrawal', 1200.00, '2023-10-20 08:45:00'),
(1011, 109, 'deposit', 1800.00, '2023-11-22 12:30:00'),
(1012, 110, 'withdrawal', 700.00, '2023-12-28 09:00:00'),
(1013, 111, 'deposit', 3500.00, '2023-01-02 15:30:00');

select c.first_name , c.last_name , A.account_type , c.email 
from Customers c 
inner join Accounts A on c.customer_id = A.customer_id


select* from Transactions
select t.transaction_date, t.transaction_id , T.transaction_type, T.account_id, C.first_name,C.last_name
from Transactions T JOIN Accounts A ON T.account_id= a.account_id
JOIN Customers C ON  C.customer_id = A.customer_id

UPDATE Accounts 
SET balance = BALANCE + 500 
WHERE account_id= 1
select * from Accounts


SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS FULL_NAME FROM Customers

--Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts
WHERE balance=0 AND account_type='savings'
select* from Accounts;

--Write a SQL query to Find customers living in a specific city.

SELECT * FROM Customers
WHERE city = 'Mumbai'

--Write a SQL query to Get the account balance for a specific account.

SELECT balance FROM Accounts WHERE account_id = 102
SELECT *FROM Accounts


--Write a SQL query to List all current accounts with a balance greater than $1,000.

SELECT account_id, account_type , balance,customer_id
FROM Accounts WHERE balance > 1000

--	Write a SQL query to Retrieve all transactions for a specific account. 

SELECT
    Transactions.transaction_id,
    Transactions.account_id,
    Transactions.transaction_type,
    Transactions.amount,
    Transactions.transaction_date
FROM
    Transactions
JOIN
    Accounts ON Transactions.account_id = Accounts.account_id
WHERE
    Accounts.account_id = 105


-- a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate 5 percent. 

SELECT
    account_id,
    account_type,
    balance,
    (balance * 0.05) AS interest_accrued
FROM
    Accounts
WHERE
    account_type = 'savings';


--Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 
SELECT
    account_id,
    account_type,
    balance
FROM
    Accounts
WHERE
    balance < 5000;

--Write a SQL query to Find the average account balance for all customers. 
SELECT
    AVG(balance) AS average_account_balance
FROM
    Accounts;

--	Write a SQL query to Retrieve the top 10 highest account balances
SELECT top 10
    account_id,
    account_type,
    balance
FROM
    Accounts
ORDER BY
    balance DESC ;


--Write a SQL query to Calculate Total Deposits for All Customers on a specific date. 
SELECT
    t.transaction_date,
    SUM(t.amount) AS total_deposits
FROM
    Transactions t
JOIN
    Accounts a ON t.account_id = a.account_id
WHERE
    t.transaction_type = 'deposit'
    AND t.transaction_date = '2023-01-10' 
GROUP BY
    t.transaction_date;

select * from Transactions

--Write a SQL query to Find the Oldest and Newest Customers. 
--Find the oldest customer 
SELECT top 1 *
FROM customers
ORDER BY DOB ASC


 
--Find the newest customer 
 
SELECT TOP 1 *
FROM customers
ORDER BY customer_id DESC;


--Write a SQL query to Retrieve transaction details along with the account type
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    a.account_type
FROM
    Transactions t
JOIN
    Accounts a ON t.account_id = a.account_id;

--Write a SQL query to Get a list of customers along with their account details

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.DOB,
    c.email,
    c.phone_number,
    c.address,
    a.account_id,
    a.account_type,
    a.balance
FROM
    Customers c
JOIN
    Accounts a ON c.customer_id = a.customer_id;



--Write a SQL query to Retrieve transaction details along with customer information for a specific account

SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.DOB,
    c.email,
    c.phone_number,
    c.address
FROM
    Transactions t
JOIN
    Accounts a ON t.account_id = a.account_id
JOIN
    Customers c ON a.customer_id = c.customer_id
WHERE
    t.account_id = 105

--Write a SQL query to Identify customers who have more than one account. 
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(a.account_id) AS num_accounts
FROM
    Customers c
JOIN
    Accounts a ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(a.account_id) > 1;



--Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals

SELECT
    account_id,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS difference
FROM
    Transactions
GROUP BY
    account_id;

--Write a SQL query to Calculate the average daily balance for each account over a specified period.  

SELECT
    account_id,
    AVG(balance) AS average_daily_balance
FROM
    Accounts
WHERE
    DATEDIFF(DAY, (SELECT MIN(transaction_date) FROM Transactions WHERE account_id = Accounts.account_id), GETDATE()) >= 0
GROUP BY
    account_id;

--Calculate the total balance for each account type. 
	SELECT
    account_type,
    SUM(balance) AS total_balance
FROM
    Accounts
GROUP BY
    account_type;

--Identify accounts with the highest number of transactions ordered by descending

SELECT
    a.account_id,
    COUNT(t.transaction_id) AS transaction_count
FROM
    Accounts a
JOIN
    Transactions t ON a.account_id = t.account_id
GROUP BY
    a.account_id
ORDER BY
    transaction_count DESC;

--List customers with high aggregate account balances, along with their account types.  
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.DOB,
    c.email,
    c.phone_number,
    c.address,
    a.account_type,
    SUM(a.balance) AS aggregate_balance
FROM
    Customers c
JOIN
    Accounts a ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.DOB, c.email, c.phone_number, c.address, a.account_type
ORDER BY
    aggregate_balance DESC;


--Identify and list duplicate transactions based on transaction amount, date, and account
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM
    Transactions t
JOIN (
    SELECT
        account_id,
        amount,
        transaction_date
    FROM
        Transactions
    GROUP BY
        account_id, amount, transaction_date
    HAVING
        COUNT(*) > 1
) AS duplicates ON t.account_id = duplicates.account_id
                  AND t.amount = duplicates.amount
                  AND t.transaction_date = duplicates.transaction_date
ORDER BY
    t.account_id, t.amount, t.transaction_date, t.transaction_id;

--Retrieve the customer(s) with the highest account balance. 
WITH RankedCustomers AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.DOB,
        c.email,
        c.phone_number,
        c.address,
        a.account_id,
        a.account_type,
        a.balance,
        RANK() OVER (ORDER BY a.balance DESC) AS balance_rank
    FROM
        Customers c
    JOIN
        Accounts a ON c.customer_id = a.customer_id
)
SELECT
    customer_id,
    first_name,
    last_name,
    DOB,
    email,
    phone_number,
    address,
    account_id,
    account_type,
    balance
FROM
    RankedCustomers
WHERE
    balance_rank = 1;

--Calculate the average account balance for customers who have more than one account

WITH CustomerAccountCounts AS (
    SELECT
        c.customer_id,
        COUNT(a.account_id) AS num_accounts
    FROM
        Customers c
    JOIN
        Accounts a ON c.customer_id = a.customer_id
    GROUP BY
        c.customer_id
    HAVING
        COUNT(a.account_id) > 1
)
SELECT
    AVG(a.balance) AS average_balance
FROM
    Accounts a
JOIN
    CustomerAccountCounts cac ON a.customer_id = cac.customer_id;


--Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT a.account_id, a.customer_id, t.transaction_id, t.amount 
FROM accounts a 
JOIN transactions t ON a.account_id = t.account_id 
WHERE t.amount > (SELECT AVG(amount) FROM transactions); 
 

--Identify customers who have no recorded transactions.

SELECT customer_id, first_name, last_name, DOB, email, phone_number, address 
FROM Customers 
WHERE customer_id NOT IN (SELECT c.customer_id FROM Customers c 
    LEFT JOIN accounts a ON c.customer_id = a.customer_id 
    LEFT JOIN transactions t ON a.account_id = t.account_id 
    WHERE t.transaction_id IS NOT NULL 
); 
--Calculate the total balance of accounts with no recorded transactions 

      SELECT accounts.BALANCE , transactions.ACCOUNT_ID       FROM accounts,transactions  
      where accounts.account_id = transactions.account_id       AND  
      transactions.transaction_type is null 

--Retrieve transactions for accounts with the lowest balance 


WITH LowestBalanceAccounts AS (
    SELECT TOP 1
        account_id,
        balance
    FROM
        Accounts
    ORDER BY
        balance ASC
)
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM
    Transactions t
JOIN
    LowestBalanceAccounts lba ON t.account_id = lba.account_id;


--Identify customers who have accounts of multiple types 

WITH LowestBalanceAccounts AS (
    SELECT TOP 1
        account_id,
        balance
    FROM
        Accounts
    ORDER BY
        balance ASC
)
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM
    Transactions t
JOIN
    LowestBalanceAccounts lba ON t.account_id = lba.account_id;

--Calculate the percentage of each account type out of the total number of accounts 

SELECT
    account_type,
    COUNT(*) AS num_accounts,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS DECIMAL(5, 2)) AS percentage
FROM
    Accounts
GROUP BY
    account_type;

--Retrieve all transactions for a customer with a given customer_id. 
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM
    Transactions t
JOIN
    Accounts a ON t.account_id = a.account_id
WHERE
    a.customer_id = 1;

--Calculate the total balance for each account type, including a subquery within the SELECT clause.  
SELECT
    account_type,
    (SELECT SUM(balance) FROM Accounts a2 WHERE a2.account_type = a.account_type) AS total_balance
FROM
    Accounts a
GROUP BY
    account_type;





