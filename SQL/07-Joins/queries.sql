/* ============================================================
   07 · JOINS
   Skills: INNER JOIN, JOIN + GROUP BY + HAVING
   Uses its own two tables (the Employees table can't be
   joined to anything without creating a self join).
   ============================================================ */

DROP TABLE IF EXISTS Orders_2;
DROP TABLE IF EXISTS Customers_2;

CREATE TABLE Customers_2 (
    CustomerID   INT,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders_2 (
    OrdersID   INT,
    CustomerID INT,
    Amount     INT
);

INSERT INTO Customers_2 (CustomerID, CustomerName)
VALUES (1, 'Alex'),
       (2, 'Brianna'),
       (3, 'Carlos'),
       (4, 'Dianna');

INSERT INTO Orders_2 (OrdersID, CustomerID, Amount)
VALUES (101, 1, 500),
       (102, 2, 300),
       (103, 1, 200),
       (104, 4, 400);

/* QUESTION
   Show each customer's name and total amount spent.
   Only include customers whose total spending is greater than 400. */

-- Version 1: column names without table prefixes
SELECT CustomerName,
       SUM(Amount) AS Total_spent
FROM Customers_2
INNER JOIN Orders_2
    ON Customers_2.CustomerID = Orders_2.CustomerID
GROUP BY CustomerName
HAVING SUM(Amount) > 400;

-- Version 2: fully qualified (clearer, and required when both tables
-- share a column name)
SELECT Customers_2.CustomerName,
       SUM(Orders_2.Amount) AS Total_spent
FROM Customers_2
INNER JOIN Orders_2
    ON Customers_2.CustomerID = Orders_2.CustomerID
GROUP BY Customers_2.CustomerName
HAVING SUM(Orders_2.Amount) > 400;

-- Version 3: table aliases
SELECT c.CustomerName,
       SUM(o.Amount) AS Total_spent
FROM Customers_2 AS c
INNER JOIN Orders_2 AS o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING SUM(o.Amount) > 400;

-- Expected result:
--   Alex     700
--   (Brianna = 300 and Dianna = 400 are not above 400; Carlos has no orders)
