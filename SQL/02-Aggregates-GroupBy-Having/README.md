# 02 · Aggregates, GROUP BY, HAVING

[← 01 Filtering](../01-Filtering-and-Sorting/README.md) · [SQL home](../README.md) · Next: [03 Data Modification →](../03-Data-Modification/README.md)

**Code:** [`queries.sql`](queries.sql)

## Skills practiced
`COUNT` · `SUM` · `AVG` · `MIN` · `MAX` · `GROUP BY` · `HAVING` · aliases

## Questions solved
1. Headcount per department
2. Departments with 2 or more employees
3. Total salary per department
4. Departments with total salary above 150,000 / below 150,000 / above 200,000
5. Departments with average salary of 80,000 or more
6. Lowest and highest salary per department
7. Headcount in IT

## What I learned

**`WHERE` filters rows. `HAVING` filters groups.**

```sql
-- Wrong: aggregates can't be used in WHERE
SELECT Department, AVG(Salary)
FROM Employees
WHERE AVG(Salary) >= 80000;

-- Right
SELECT Department, AVG(Salary)
FROM Employees
GROUP BY Department
HAVING AVG(Salary) >= 80000;
```

- Aggregates are calculated after rows are grouped, so `WHERE` can't see them yet.
- `HAVING` always needs a condition (`>`, `<`, `=`, `BETWEEN`, and so on). A bare `HAVING SUM(Salary)` is an error.
- Clause order matters: `SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY`. SQL Server says *"Incorrect syntax near [clause]"* when it's out of order.
- Give every aggregate an alias (`AS TotalSalary`). It makes the output readable and lets `ORDER BY` use the alias.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| `HAVING SUM(Salary)` | No condition | Add `> 150000` |
| `WHERE Salary < 150000` before `GROUP BY` | Filtered single salaries, not department totals | Remove `WHERE`, use `HAVING SUM(Salary) < 150000` |
| `SUM(Salary)` with no alias | Unnamed column | `AS TotalSalary` |
