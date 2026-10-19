/* ============================================================
   05 · DATA MIGRATION (INSERT INTO ... SELECT)
   Copy data from Employees into new tables, mapping columns,
   filtering, calculating and aggregating along the way.
   Requires: ../00-Setup/employees_setup.sql
   ============================================================ */

-- 1. COPY EVERYTHING, MAPPING DIFFERENT COLUMN NAMES --------------
CREATE TABLE EmployeeArchive (
    EmpID        INT,
    Name         VARCHAR(50),
    Dept         VARCHAR(50),
    SalaryAmount INT
);

INSERT INTO EmployeeArchive (EmpID, Name, Dept, SalaryAmount)
SELECT EmployeeID, FullName, Department, Salary
FROM Employees;

-- 2. COPY ONLY SOME COLUMNS ---------------------------------------
CREATE TABLE EmployeeDirectory (
    FullName   VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO EmployeeDirectory (FullName, Department)
SELECT FullName, Department
FROM Employees;

-- 3. COPY WITH A FILTER + A DEFAULT VALUE -------------------------
CREATE TABLE ITTeam (
    ID           INT,
    EmployeeName VARCHAR(50),
    BaseSalary   INT,
    ReviewStatus VARCHAR(50)
);

INSERT INTO ITTeam (ID, EmployeeName, BaseSalary, ReviewStatus)
SELECT EmployeeID, FullName, Salary, 'Pending'   -- constant value for every row
FROM Employees
WHERE Department = 'IT';

-- 4. COPY EVERYONE EXCEPT ONE GROUP -------------------------------
CREATE TABLE NonITStaff (
    ID       INT,
    Name     VARCHAR(50),
    DeptName VARCHAR(50),
    BasePay  INT
);

INSERT INTO NonITStaff (ID, Name, DeptName, BasePay)
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Department <> 'IT' OR Department IS NULL;

-- 5. TRANSFORM A VALUE WHILE COPYING (dynamic, not hard-coded) ----
CREATE TABLE HighSalaryEmployees (
    EmpID        INT,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    AnnualSalary VARCHAR(50)
);

INSERT INTO HighSalaryEmployees (EmpID, Name, Department, AnnualSalary)
SELECT EmployeeID,
       FullName,
       Department,
       CAST(Salary AS VARCHAR(20)) + ' USD'      -- e.g. '95000 USD'
FROM Employees
WHERE Salary > 90000;

-- 6. CALCULATED COLUMNS -------------------------------------------
CREATE TABLE EmployeeBonuses (
    EmployeeID  INT,
    FullName    VARCHAR(50),
    BonusSalary INT
);

INSERT INTO EmployeeBonuses (EmployeeID, FullName, BonusSalary)
SELECT EmployeeID, FullName, Salary * 1.10       -- salary after a 10% bonus
FROM Employees;

CREATE TABLE MonthlyPayroll (
    EmpID        INT,
    EmployeeName VARCHAR(50),
    MonthlyPay   INT
);

INSERT INTO MonthlyPayroll (EmpID, EmployeeName, MonthlyPay)
SELECT EmployeeID, FullName, Salary / 12
FROM Employees;

CREATE TABLE BiWeeklyPayroll (
    EmpCode     INT,
    Name        VARCHAR(50),
    BiWeeklyPay INT
);

INSERT INTO BiWeeklyPayroll (EmpCode, Name, BiWeeklyPay)
SELECT EmployeeID, FullName, Salary / 26         -- 26 paychecks a year
FROM Employees;

-- Calculated column + filter, without changing the source table
CREATE TABLE ITAdjustedSalaries (
    EmployeeID     INT,
    FullName       VARCHAR(50),
    AdjustedSalary INT
);

INSERT INTO ITAdjustedSalaries (EmployeeID, FullName, AdjustedSalary)
SELECT EmployeeID, FullName, Salary * 1.15       -- 15% raise, only for IT
FROM Employees
WHERE Department = 'IT';

-- 7. SUBQUERY MIGRATION -------------------------------------------
CREATE TABLE AboveAverageEarners (
    EmployeeID INT,
    FullName   VARCHAR(50),
    Salary     INT
);

INSERT INTO AboveAverageEarners (EmployeeID, FullName, Salary)
SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Correlated: above the average of their OWN department
CREATE TABLE DeptAboveAverage (
    EmpID  INT,
    Name   VARCHAR(50),
    Dept   VARCHAR(50),
    Salary INT
);

INSERT INTO DeptAboveAverage (EmpID, Name, Dept, Salary)
SELECT EmployeeID, FullName, Department, Salary
FROM Employees AS e1
WHERE Salary > (SELECT AVG(Salary)
                FROM Employees
                WHERE Department = e1.Department);

-- 8. AGGREGATION MIGRATION ----------------------------------------
CREATE TABLE DepartmentAverages (
    Department VARCHAR(50),
    AvgSalary  INT
);

INSERT INTO DepartmentAverages (Department, AvgSalary)
SELECT Department, AVG(Salary)
FROM Employees
GROUP BY Department;

CREATE TABLE DepartmentLowestSalary (
    DeptName     VARCHAR(50),
    LowestSalary INT
);

INSERT INTO DepartmentLowestSalary (DeptName, LowestSalary)
SELECT Department, MIN(Salary)
FROM Employees
GROUP BY Department;

-- 9. AVOID DUPLICATES WHEN RE-RUNNING A MIGRATION ------------------
CREATE TABLE SalesEmployees (
    EmployeeID INT,
    FullName   VARCHAR(50),
    Salary     INT
);

INSERT INTO SalesEmployees (EmployeeID, FullName, Salary)
SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE Department = 'Sales'
  AND EmployeeID NOT IN (SELECT EmployeeID FROM SalesEmployees);
