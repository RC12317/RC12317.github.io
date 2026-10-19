# 03 · Data Modification (INSERT, UPDATE, DELETE)

[← 02 Aggregates](../02-Aggregates-GroupBy-Having/README.md) · [SQL home](../README.md) · Next: [04 Subqueries →](../04-Subqueries/README.md)

**Code:** [`queries.sql`](queries.sql)

## Skills practiced
`INSERT INTO` · `UPDATE ... SET` · `DELETE FROM` · percentage math · previewing changes

## Questions solved
1. Insert a new employee
2. Raise IT salaries by 5%, then reduce them by 5%
3. Flat raises for HR (+2,500) and Sales (+3,000)
4. Change one employee's salary
5. Delete employees under a salary threshold
6. Delete only one department's low earners

## What I learned

**Percent increase math:** 100% + 5% = 105% = `Salary * 1.05`. The long form `Salary + (Salary * 0.05)` gives the same answer.

**`SET` is for `UPDATE` only.** In a `SELECT`, calculate directly: `Salary * 1.05 AS NewSalary`.

**Always check the `WHERE`.** An `UPDATE` or `DELETE` without one changes every row. I now run a `SELECT` with the same `WHERE` first.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| `WHERE id = 8` | Column is `EmployeeID`, not `id` | `WHERE EmployeeID = 8` |
| `WHERE Sales < 60000` | `Sales` is a value, not a column. It also hit every department | `WHERE Department = 'Sales' AND Salary < 60000` |
