# Python

[🏠 Home](../README.md) · [SQL](../SQL/README.md) · [Power BI](../PowerBI/README.md) · **Python**

Python is next on my learning path, after SQL. This section mirrors the SQL topics: each page takes the same questions I solved in SQL and re-solves them in **Python with pandas**. Comparing the two helps me understand both.

> **Status:** 🟡 Starter pages. The code shows the pandas equivalent of each SQL topic. I'll add my own scripts, notes and mistakes as I work through them.

## Setup

```bash
pip install pandas numpy
```

The practice data is [`data/employees.csv`](data/employees.csv), the same `Employees` table used in the SQL section.

```python
import pandas as pd
df = pd.read_csv("data/employees.csv")
```

## Topics

| # | Topic | SQL idea → pandas idea | Page |
|---|---|---|---|
| 01 | Filtering and Sorting | `WHERE` / `ORDER BY` → boolean masks / `sort_values` | [Open](01-Filtering-and-Sorting/README.md) |
| 02 | Aggregates, GroupBy | `GROUP BY` / `HAVING` → `groupby` / `agg` | [Open](02-Aggregates-GroupBy-Having/README.md) |
| 03 | Data Modification | `INSERT` / `UPDATE` / `DELETE` → `concat` / `loc` / boolean drop | [Open](03-Data-Modification/README.md) |
| 04 | Subqueries | Subquery → `mean()` / `transform` | [Open](04-Subqueries/README.md) |
| 05 | Data Migration | `INSERT INTO ... SELECT` → `rename` / `to_sql` | [Open](05-Data-Migration/README.md) |
| 06 | CASE Logic | `CASE WHEN` → `np.select` | [Open](06-CASE-Logic/README.md) |
| 07 | Joins | `INNER JOIN` → `merge` | [Open](07-Joins/README.md) |

## Why Python for cybersecurity
Automation, log parsing, scripting and security tooling. The long-term goal is to use these skills for security operations work.
