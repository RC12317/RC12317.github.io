/* ============================================================
   04 · SUBQUERIES
   Skills: scalar subquery, correlated subquery
   Requires: ../00-Setup/employees_setup.sql
   ============================================================ */

-- 1. Employees earning more than the company average
SELECT EmployeeID, FullName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC;

-- 2. IT employees earning more than the IT average
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Department = 'IT'
  AND Salary > (SELECT AVG(Salary)
                FROM Employees
                WHERE Department = 'IT');

-- 3. Employees earning more than the highest HR salary
SELECT EmployeeID, FullName, Department, Salary
FROM Employees
WHERE Salary > (SELECT MAX(Salary)
                FROM Employees
                WHERE Department = 'HR');

-- 4. Top 3 salaries per department, without a JOIN
--    (correlated subquery: count how many people in the same
--     department earn more than the current row)
SELECT EmployeeID, FullName, Department, Salary
FROM Employees e
WHERE (SELECT COUNT(*)
       FROM Employees e2
       WHERE e2.Department = e.Department
         AND e2.Salary > e.Salary) < 3
ORDER BY Department, Salary DESC;
