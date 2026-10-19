/* ============================================================
   01 · FILTERING AND SORTING
   Skills: WHERE, ORDER BY, TOP / LIMIT, BETWEEN, IN, NOT, DISTINCT
   Requires: ../00-Setup/employees_setup.sql
   ============================================================ */

-- 1. Top 3 highest-paid employees in IT
SELECT TOP 3 EmployeeID, FullName, Salary
FROM Employees
WHERE Department = 'IT'
ORDER BY Salary DESC;

-- 2. Employees who make more than 80,000, highest first
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Salary > 80000
ORDER BY Salary DESC;

-- 3. Employees whose salary is NOT between 70,000 and 90,000
SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE Salary NOT BETWEEN 70000 AND 90000
ORDER BY Salary;

-- Same result, written two other ways
SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE Salary < 70000 OR Salary > 90000
ORDER BY Salary;

SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE NOT (Salary BETWEEN 70000 AND 90000)
ORDER BY Salary;

-- 4. Employees in IT or HR
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Department IN ('IT', 'HR')
ORDER BY Department;

-- 5. Salary between 70,000 and 95,000 (BETWEEN is inclusive)
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Salary BETWEEN 70000 AND 95000;

-- 6. Employees whose salary is exactly 90,000
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Salary = 90000;

-- 7. Unique departments
SELECT DISTINCT Department
FROM Employees;

-- 8. Top 2 highest-paid employees in the whole company
SELECT TOP 2 EmployeeID, FullName, Salary
FROM Employees
ORDER BY Salary DESC;

-- 9. The 2 lowest salaries in the company
-- SQL Server:
SELECT TOP 2 EmployeeID, FullName, Salary
FROM Employees
ORDER BY Salary ASC;

-- SQLite:
-- SELECT EmployeeID, FullName, Salary
-- FROM Employees
-- ORDER BY Salary ASC
-- LIMIT 2;

-- 10. Everyone who is not in IT
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Department <> 'IT' OR Department IS NULL;
