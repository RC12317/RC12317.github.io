/* ============================================================
   06 · CASE LOGIC
   Skills: CASE WHEN ... THEN ... ELSE ... END, CASE + aggregates
   Requires: ../00-Setup/employees_setup.sql
   ============================================================ */

-- 1. Simple label: High Pay / Standard Pay ------------------------
CREATE TABLE EmployeePayLabels (EmpID INT, Name VARCHAR(50), PayLabel VARCHAR(50));

INSERT INTO EmployeePayLabels (EmpID, Name, PayLabel)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Salary >= 90000 THEN 'High Pay'
           ELSE 'Standard Pay'
       END AS PayLabel
FROM Employees;

-- 2. Department logic: Technical / Non-Technical ------------------
CREATE TABLE EmployeeCategories (EmployeeID INT, FullName VARCHAR(50), Category VARCHAR(50));

INSERT INTO EmployeeCategories (EmployeeID, FullName, Category)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Department = 'IT' THEN 'Technical'
           ELSE 'Non-Technical'
       END AS Category
FROM Employees;

-- 3. Department mapping to codes ----------------------------------
CREATE TABLE DepartmentCodes (EmployeeID INT, FullName VARCHAR(50), DeptCode VARCHAR(50));

INSERT INTO DepartmentCodes (EmployeeID, FullName, DeptCode)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Department = 'IT' THEN 'TECH'
           WHEN Department = 'HR' THEN 'PEOPLE'
           ELSE 'OPS'
       END AS DeptCode
FROM Employees;

-- 4. Multi-condition ranges (order matters: first match wins) -----
CREATE TABLE EmployeePayGrades (EmpID INT, Name VARCHAR(50), PayGrade VARCHAR(50));

INSERT INTO EmployeePayGrades (EmpID, Name, PayGrade)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Salary >= 90000 THEN 'High'
           WHEN Salary BETWEEN 70000 AND 89999 THEN 'Medium'
           ELSE 'Low'
       END AS PayGrade
FROM Employees;

CREATE TABLE CompensationBands (EmployeeID INT, FullName VARCHAR(50), Band VARCHAR(50));

INSERT INTO CompensationBands (EmployeeID, FullName, Band)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Salary >= 120000 THEN 'Executive'
           WHEN Salary BETWEEN 90000 AND 119999 THEN 'Senior'
           WHEN Salary BETWEEN 60000 AND 89999 THEN 'Mid'
           ELSE 'Junior'
       END AS Band
FROM Employees;

-- 5. Status flag ---------------------------------------------------
CREATE TABLE EmployeeStatus (ID INT, Name VARCHAR(50), Status VARCHAR(50));

INSERT INTO EmployeeStatus (ID, Name, Status)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Salary >= 70000 THEN 'Active'
           ELSE 'Review'
       END AS Status
FROM Employees;

-- 6. CASE with a calculated value ---------------------------------
-- Bonus: IT 15%, HR 10%, everyone else 5%
CREATE TABLE DepartmentBonuses (EmployeeID INT, FullName VARCHAR(50), BonusAmount INT);

INSERT INTO DepartmentBonuses (EmployeeID, FullName, BonusAmount)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Department = 'IT' THEN Salary * 0.15
           WHEN Department = 'HR' THEN Salary * 0.10
           ELSE Salary * 0.05
       END AS BonusAmount
FROM Employees;

-- New salary: IT +20%, HR +10%, others +5%
CREATE TABLE AdjustedSalaries (EmpID INT, FullName VARCHAR(50), NewSalary INT);

INSERT INTO AdjustedSalaries (EmpID, FullName, NewSalary)
SELECT EmployeeID,
       FullName,
       CASE
           WHEN Department = 'IT' THEN Salary * 1.20
           WHEN Department = 'HR' THEN Salary * 1.10
           ELSE Salary * 1.05
       END AS NewSalary
FROM Employees;

-- 7. CASE + aggregate ----------------------------------------------
-- Payroll size per department
CREATE TABLE DepartmentPayrollCategory (Department VARCHAR(50), PayrollCategory VARCHAR(50));

INSERT INTO DepartmentPayrollCategory (Department, PayrollCategory)
SELECT Department,
       CASE
           WHEN SUM(Salary) > 300000 THEN 'Large Budget'
           WHEN SUM(Salary) BETWEEN 150000 AND 300000 THEN 'Medium Budget'
           ELSE 'Small Budget'
       END AS PayrollCategory
FROM Employees
GROUP BY Department;

-- Average pay level per department
CREATE TABLE DepartmentSalaryLevel (Department VARCHAR(50), SalaryLevel VARCHAR(50));

INSERT INTO DepartmentSalaryLevel (Department, SalaryLevel)
SELECT Department,
       CASE
           WHEN AVG(Salary) >= 90000 THEN 'High Paying'
           WHEN AVG(Salary) BETWEEN 70000 AND 89999 THEN 'Moderate Paying'
           ELSE 'Low Paying'
       END AS SalaryLevel
FROM Employees
GROUP BY Department;
