# 05 · Data Migration (`INSERT INTO ... SELECT`)

[← 04 Subqueries](../04-Subqueries/README.md) · [SQL home](../README.md) · Next: [06 CASE Logic →](../06-CASE-Logic/README.md)

**Code:** [`queries.sql`](queries.sql)

## The pattern

```sql
INSERT INTO TargetTable (col_a, col_b)   -- target column names
SELECT source_col_1, source_col_2        -- source columns, same order
FROM SourceTable
WHERE ...;
```

Columns are matched **by position**, not by name. The target names can be different from the source names.

## Scenarios practiced
| # | Scenario | Key idea |
|---|---|---|
| 1 | Archive every row into a differently named table | Map columns by position |
| 2 | Copy only some columns | List fewer columns on both sides |
| 3 | Copy one department with a default status | Constant value in `SELECT` |
| 4 | Copy everyone except IT | `<>` plus `IS NULL` check |
| 5 | Turn salary into `'95000 USD'` | `CAST(... AS VARCHAR) + ' USD'` |
| 6 | Bonus, monthly and bi-weekly pay | Math in `SELECT`, not `SET` |
| 7 | Above-average earners | Subquery, then correlated subquery |
| 8 | Average / lowest salary per department | `GROUP BY` inside the migration |
| 9 | Re-runnable copy | `NOT IN (SELECT ...)` to skip existing rows |

## What I learned
- **Do the math in `SELECT`.** `SET Salary = Salary * 1.15` is for `UPDATE` and changes the source table. In a migration I want the source untouched, so I write `Salary * 1.15`.
- **Don't hard-code results.** `'95000 USD'` is the same for every row. `CAST(Salary AS VARCHAR(20)) + ' USD'` is calculated per row.
- **Constants are allowed in `SELECT`.** `'Pending'` or `'Active'` fills the whole column.
- **Always give `VARCHAR` a length.** `VARCHAR` alone defaults to 1 character in many contexts and causes *"String or binary data would be truncated"*.
- **Look at the source table first** (`SELECT * FROM Employees`) before mapping columns.
- Re-running an insert creates duplicate rows. Guard with `NOT IN` or clean up with `DELETE`.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| `WHERE Salary = Salary/12` | Filter that matches nothing (0 rows) | Calculate `Salary / 12` in `SELECT` |
| `SET Salary * 1.10` inside a `SELECT` | `SET` only works in `UPDATE` | `Salary * 1.10` |
| `WHERE Salary < (SELECT AVG ...)` for "above average" | Wrong sign | `>` |
| `AVG(Salary)` plus `WHERE AVG(Salary) < ...` | Aggregate in `WHERE` | Correlated subquery with alias |
| `UPDATE` to apply a 15% raise | Modified the original table | `INSERT ... SELECT Salary * 1.15` |
