# 02 · Aggregates, GroupBy (Python)

[← 01 Filtering](../01-Filtering-and-Sorting/README.md) · [Python home](../README.md) · Next: [03 Data Modification →](../03-Data-Modification/README.md) · SQL version: [SQL 02](../../SQL/02-Aggregates-GroupBy-Having/README.md)

> **Status:** 🟡 Starter page.

```python
import pandas as pd
df = pd.read_csv("../data/employees.csv")
```

| SQL | pandas |
|---|---|
| `GROUP BY Department` | `df.groupby("Department")` |
| `COUNT(*)` | `.size()` or `("EmployeeID", "count")` |
| `SUM` / `AVG` / `MIN` / `MAX` | `"sum"` / `"mean"` / `"min"` / `"max"` |
| `AS TotalSalary` | named aggregation: `TotalSalary=("Salary", "sum")` |
| `HAVING` | filter the **grouped result** |
| `WHERE` | filter `df` **before** grouping |

## Examples

```python
# Employees per department, 2 or more, largest first
counts = df.groupby("Department").agg(EmployeeCount=("EmployeeID", "count")).reset_index()
counts[counts["EmployeeCount"] >= 2].sort_values("EmployeeCount", ascending=False)

# Total salary per department over 150,000
totals = df.groupby("Department").agg(TotalSalary=("Salary", "sum")).reset_index()
totals[totals["TotalSalary"] > 150000].sort_values("TotalSalary", ascending=False)

# Average salary of 80,000 or more
avg = df.groupby("Department").agg(AvgSalary=("Salary", "mean")).reset_index()
avg[avg["AvgSalary"] >= 80000]

# Min and max per department in one go
df.groupby("Department")["Salary"].agg(["min", "max"])
```

## Notes
- `HAVING` has no keyword in pandas. It is just a filter applied after `groupby` / `agg`.
- The same rule as SQL holds: filter rows first, filter groups after.
