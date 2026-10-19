/* ============================================================
   03 · DATA MODIFICATION (INSERT, UPDATE, DELETE)
   Requires: ../00-Setup/employees_setup.sql
   TIP: Preview with SELECT before you UPDATE or DELETE.
   ============================================================ */

-- INSERT -------------------------------------------------------
INSERT INTO Employees (EmployeeID, FullName, Department, Salary)
VALUES (13, 'Sarah Lee', 'IT', 87000);

-- UPDATE -------------------------------------------------------
-- Give IT a 5% raise (two equivalent ways)
UPDATE Employees
SET Salary = Salary * 1.05
WHERE Department = 'IT';

UPDATE Employees
SET Salary = Salary + (Salary * 0.05)
WHERE Department = 'IT';

-- Reduce IT salaries by 5%
UPDATE Employees
SET Salary = Salary - (Salary * 0.05)
WHERE Department = 'IT';

-- Flat raise of 2,500 for HR
UPDATE Employees
SET Salary = Salary + 2500
WHERE Department = 'HR';

-- Flat raise of 3,000 for Sales
UPDATE Employees
SET Salary = Salary + 3000
WHERE Department = 'Sales';

-- Change one person's salary (use the column that exists: EmployeeID)
UPDATE Employees
SET Salary = 92000
WHERE EmployeeID = 8;

-- PREVIEW BEFORE UPDATING --------------------------------------
SELECT EmployeeID,
       Salary          AS CurrentSalary,
       Salary * 1.05   AS NewSalary
FROM Employees
WHERE Department = 'IT';

-- DELETE -------------------------------------------------------
-- Delete everyone earning under 60,000
DELETE FROM Employees
WHERE Salary < 60000;

-- Delete only Sales employees earning under 60,000
DELETE FROM Employees
WHERE Department = 'Sales'
  AND Salary < 60000;
