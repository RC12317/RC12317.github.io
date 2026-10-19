# 00 · Setup

[← Back to SQL](../README.md)

All practice pages share one small table, `Employees`.

| Column | Type | Notes |
|---|---|---|
| EmployeeID | INT | Unique ID |
| FullName | VARCHAR(100) | |
| Department | VARCHAR(50) | IT, HR, Sales, Finance |
| Salary | INT | Annual salary |

**Run [`employees_setup.sql`](employees_setup.sql) first.** It drops and rebuilds the table so you always start from the same data.

## Dialect notes

I practiced mostly in **SQL Server (T-SQL)** and partly in **SQLite** through Codecademy.

| Task | SQL Server | SQLite |
|---|---|---|
| Limit rows | `SELECT TOP 3 ...` | `... LIMIT 3` |
| Integer type | `INT` | `INTEGER` |
| String concatenation | `+` | `\|\|` |
| `DROP TABLE IF EXISTS` | Yes (2016+) | Yes |
