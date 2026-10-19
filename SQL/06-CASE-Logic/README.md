# 06 · CASE Logic

[← 05 Data Migration](../05-Data-Migration/README.md) · [SQL home](../README.md) · Next: [07 Joins →](../07-Joins/README.md)

**Code:** [`queries.sql`](queries.sql)

## The pattern

```sql
CASE
    WHEN condition_1 THEN result_1
    WHEN condition_2 THEN result_2
    ELSE default_result
END AS ColumnAlias
```

`CASE` replaces several separate `INSERT` statements with one. It sits **inside the `SELECT` list** like any other column.

## Scenarios practiced
| # | Scenario | Key idea |
|---|---|---|
| 1 | High Pay / Standard Pay | Two outcomes |
| 2 | Technical / Non-Technical | Condition on `Department` |
| 3 | TECH / PEOPLE / OPS codes | Several departments plus `ELSE` |
| 4 | Pay grades and compensation bands | Ranges, first match wins |
| 5 | Active / Review flag | Salary threshold |
| 6 | Bonus and raise by department | Calculation inside `THEN` |
| 7 | Budget size and pay level per department | `CASE` wrapped around `SUM` / `AVG` |

## What I learned
- **Put the condition in `WHEN`, the result in `THEN`.** I had these reversed in my first bonus attempt (`WHEN Salary = Salary + ... THEN 'IT'`), which can never be true.
- **Commas matter.** Forgetting the comma after `FullName` before `CASE` gives a syntax error.
- **`CASE` ends with `END`**, and the alias goes after it.
- **`FROM` appears once.** A duplicate `FROM Employees` is a syntax error.
- **`CASE` with aggregates:** wrap the aggregate inside the condition (`WHEN SUM(Salary) > 300000`), then `GROUP BY` the department. Don't also select the raw `SUM` unless you want that column.
- **Percent change:** `Salary + 0.20` adds 0.20 dollars. Use `Salary * 1.20` or `Salary + (Salary * 0.20)`.
- Conditions are checked top to bottom. The first true one wins, so list the highest range first.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| `WHEN Salary = Salary + (Salary * 0.15) THEN 'IT'` | Logic reversed, never true | `WHEN Department = 'IT' THEN Salary * 0.15` |
| `THEN Salary + 0.20` | Adds 0.20, not 20% | `Salary * 1.20` |
| `WHEN Salary > 300000` in a grouped query | Compared a single salary, not the total | `WHEN SUM(Salary) > 300000` |
| Extra `ELSE` and quotes confusion in status flag | Style and syntax slips | Keep `ELSE` for the default, strings in single quotes |
