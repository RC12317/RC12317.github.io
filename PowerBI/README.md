# Power BI

[🏠 Home](../README.md) · [SQL](../SQL/README.md) · **Power BI** · [Python](../Python/README.md)

This section mirrors the SQL topics. Each page shows how the same question is answered in **Power BI**, using Power Query (M), DAX measures and the visual filters.

> **Status:** 🟡 Starter pages. The formulas map each SQL topic to its Power BI equivalent. I'll add my `.pbix` files, screenshots and dashboards here as I build them.

## Setup
1. Open Power BI Desktop → **Get data → Text/CSV** and load [`data/employees.csv`](data/employees.csv).
2. Rename the table to `Employees`.
3. Follow any topic page below.

## Topics

| # | Topic | SQL idea → Power BI idea | Page |
|---|---|---|---|
| 01 | Filtering and Sorting | `WHERE` / `ORDER BY` → filters, Top N, sort | [Open](01-Filtering-and-Sorting/README.md) |
| 02 | Aggregates, GroupBy | `GROUP BY` / `HAVING` → measures + visual filters | [Open](02-Aggregates-GroupBy-Having/README.md) |
| 03 | Data Modification | `UPDATE` / `DELETE` → Power Query steps | [Open](03-Data-Modification/README.md) |
| 04 | Subqueries | Subquery → `CALCULATE` / `ALL` / `ALLEXCEPT` | [Open](04-Subqueries/README.md) |
| 05 | Data Migration | `INSERT ... SELECT` → Power Query transforms | [Open](05-Data-Migration/README.md) |
| 06 | CASE Logic | `CASE WHEN` → `SWITCH(TRUE(), ...)` | [Open](06-CASE-Logic/README.md) |
| 07 | Joins | `INNER JOIN` → relationships / Merge Queries | [Open](07-Joins/README.md) |

## Projects
*Coming soon: dashboards built from my SQL practice data, then a security-focused dashboard (login attempts, alerts by severity).*

## Where the data lives
[`data/employees.csv`](data/employees.csv) is the same dataset as in the SQL and Python sections.
