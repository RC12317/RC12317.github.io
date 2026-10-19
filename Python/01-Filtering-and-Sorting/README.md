# 01 · Filtering and Sorting (Python)

[Python home](../README.md) · Next: [02 Aggregates →](../02-Aggregates-GroupBy-Having/README.md) · SQL version: [SQL 01](../../SQL/01-Filtering-and-Sorting/README.md)

> **Status:** 🟡 Starter page. pandas equivalents of my SQL answers.

```python
import pandas as pd
df = pd.read_csv("../data/employees.csv")
```

| SQL | pandas |
|---|---|
| `WHERE Salary > 80000` | `df[df["Salary"] > 80000]` |
| `ORDER BY Salary DESC` | `.sort_values("Salary", ascending=False)` |
| `SELECT TOP 3` / `LIMIT 3` | `.head(3)` or `.nlargest(3, "Salary")` |
| `BETWEEN 70000 AND 95000` | `df["Salary"].between(70000, 95000)` |
| `NOT BETWEEN` | `~df["Salary"].between(70000, 90000)` |
| `IN ('IT', 'HR')` | `df["Department"].isin(["IT", "HR"])` |
| `DISTINCT Department` | `df["Department"].unique()` |

## Examples

```python
# Top 3 highest-paid in IT
df[df["Department"] == "IT"].nlargest(3, "Salary")[["EmployeeID", "FullName", "Salary"]]

# Earning more than 80,000, highest first
df[df["Salary"] > 80000].sort_values("Salary", ascending=False)

# Salary NOT between 70,000 and 90,000
df[~df["Salary"].between(70000, 90000)]

# IT or HR
df[df["Department"].isin(["IT", "HR"])]

# Two lowest salaries
df.nsmallest(2, "Salary")
```

## Notes
- Use `&` (and), `|` (or), `~` (not) with parentheses: `df[(df["Salary"] > 70000) & (df["Department"] == "IT")]`.
- Python's `and` / `or` do not work on columns.
