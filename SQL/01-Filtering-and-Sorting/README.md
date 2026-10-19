# 01 · Filtering and Sorting

[← Back to SQL](../README.md) · Next: [02 Aggregates →](../02-Aggregates-GroupBy-Having/README.md)

**Code:** [`queries.sql`](queries.sql)

## Skills practiced
`WHERE` · `ORDER BY` · `TOP` / `LIMIT` · `BETWEEN` · `IN` · `NOT` · `DISTINCT`

## Questions solved
1. Top 3 highest-paid employees in IT
2. Employees earning more than 80,000
3. Salary **not** between 70,000 and 90,000 (three equivalent ways)
4. Employees in IT or HR
5. Salary between 70,000 and 95,000
6. Salary exactly 90,000
7. Unique departments
8. Top 2 highest paid, and 2 lowest paid
9. Everyone not in IT

## What I learned
- `TOP` goes right after `SELECT` in SQL Server. SQLite uses `LIMIT` at the end.
- `BETWEEN` includes both ends.
- `WHERE Salary = 70000 OR 90000` does not mean "70000 or 90000". SQL reads the second part as its own condition. Use `IN (70000, 90000)`.
- Strings need single quotes: `'IT'`.
- `!=` skips rows where the value is `NULL`, so add `OR Department IS NULL` when those rows matter.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| `SELECT TOP 3 *` | Returned every column | List `EmployeeID, FullName, Salary` |
| `WHERE Salary IS 70000 OR 90000` | `IS` is only for `NULL` | `NOT BETWEEN` or `IN` |
