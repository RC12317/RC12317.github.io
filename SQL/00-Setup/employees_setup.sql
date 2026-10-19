/* ============================================================
   SETUP: Employees practice table
   Run this first. Every SQL practice page uses this table.
   Dialect: SQL Server (T-SQL). SQLite differences are noted
   inside each page.
   ============================================================ */

-- Start fresh if the table already exists
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT,
    FullName   VARCHAR(100),
    Department VARCHAR(50),
    Salary     INT
);

INSERT INTO Employees (EmployeeID, FullName, Department, Salary)
VALUES (1,  'Alice Brown',   'IT',      90000),
       (2,  'Bob Smith',     'IT',      85000),
       (3,  'Carol Johnson', 'IT',      95000),
       (4,  'David Wilson',  'HR',      70000),
       (5,  'Emily Davis',   'Sales',   65000),
       (6,  'Frank Moore',   'HR',      72000),
       (7,  'John Carter',   'Sales',   68000),
       (8,  'Sarah Thompson','IT',      87000),
       (9,  'Mark Ellis',    'HR',      71000),
       (12, 'Daniel White',  'Finance', 75000);

SELECT * FROM Employees;
