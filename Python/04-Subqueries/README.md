# 04 · Subqueries (Python)

[← 03 Data Modification](../03-Data-Modification/README.md) · [Python home](../README.md) · Next: [05 Data Migration →](../05-Data-Migration/README.md) · SQL version: [SQL 04](../../SQL/04-Subqueries/README.md)

> **Status:** 🟡 Starter page.

```python
import pandas as pd
df = pd.read_csv("../data/employees.csv")
```

| SQL | pandas |
|---|---|
| Scalar subquery `(SELECT AVG(Salary) ...)` | `df["Salary"].mean()` |
| Correlated subquery (per department) | `df.groupby("Department")["Salary"].transform("mean")` |
| Top N per group | `sort_values(...).groupby(...).head(N)` |

## Examples

```python
# Above the company average
df[df["Salary"] > df["Salary"].mean()].sort_values("Salary", ascending=False)

# IT employees above the IT average
it = df[df["Department"] == "IT"]
it[it["Salary"] > it["Salary"].mean()]

# Earning more than the top HR salary
df[df["Salary"] > df.loc[df["Department"] == "HR", "Salary"].max()]

# Above their OWN department's average (correlated subquery)
dept_avg = df.groupby("Department")["Salary"].transform("mean")
df[df["Salary"] > dept_avg]

# Top 3 salaries per department
df.sort_values("Salary", ascending=False).groupby("Department").head(3)
```

## Notes
- `transform` returns a value for **every row**, aligned with the original table. That's what makes it the pandas version of a correlated subquery.
