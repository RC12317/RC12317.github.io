/* ============================================================
   02 · AGGREGATES, GROUP BY, HAVING
   Skills: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
   Requires: ../00-Setup/employees_setup.sql
   ============================================================ */

-- 1. Employees per department
SELECT Department,
       COUNT(EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- 2. Departments with 2 or more employees, largest first
SELECT Department,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 2
ORDER BY EmployeeCount DESC;

-- 3. Total salary per department, highest first
SELECT Department,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
ORDER BY TotalSalary DESC;

-- 4. Departments spending more than 150,000 in total
SELECT Department,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 150000
ORDER BY TotalSalary DESC;

-- 5. Departments spending less than 150,000 in total
-- (No WHERE needed: we are not filtering individual salaries)
SELECT Department,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) < 150000;

-- 6. Departments spending more than 200,000 in total
SELECT Department,
       SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 200000;

-- 7. Average salary per department, only those averaging 80,000 or more
SELECT Department,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) >= 80000
ORDER BY AvgSalary DESC;

-- 8. Lowest salary in each department
SELECT Department,
       MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Department
ORDER BY MinSalary ASC;

-- 9. Highest salary per department, highest first
SELECT Department,
       MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department
ORDER BY MaxSalary DESC;

-- 10. How many people work in IT
SELECT COUNT(*) AS NumberOfEmployees
FROM Employees
WHERE Department = 'IT';
