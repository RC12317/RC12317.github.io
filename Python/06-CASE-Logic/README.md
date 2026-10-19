# 06 · CASE Logic (Python)

[← 05 Data Migration](../05-Data-Migration/README.md) · [Python home](../README.md) · Next: [07 Joins →](../07-Joins/README.md) · SQL version: [SQL 06](../../SQL/06-CASE-Logic/README.md)

> **Status:** 🟡 Starter page.

```python
import numpy as np
import pandas as pd

df = pd.read_csv("../data/employees.csv")
```

`np.select(conditions, choices, default)` is the pandas version of `CASE WHEN ... THEN ... ELSE ... END`. Like SQL, **the first true condition wins**.

## Examples

```python
# High Pay / Standard Pay
df["PayLabel"] = np.where(df["Salary"] >= 90000, "High Pay", "Standard Pay")

# Pay grade with ranges
df["PayGrade"] = np.select(
    [df["Salary"] >= 90000, df["Salary"].between(70000, 89999)],
    ["High", "Medium"],
    default="Low",
)

# Department codes
df["DeptCode"] = np.select(
    [df["Department"] == "IT", df["Department"] == "HR"],
    ["TECH", "PEOPLE"],
    default="OPS",
)

# Bonus by department
df["Bonus"] = np.select(
    [df["Department"] == "IT", df["Department"] == "HR"],
    [df["Salary"] * 0.15, df["Salary"] * 0.10],
    default=df["Salary"] * 0.05,
)

# CASE + aggregate: budget size per department
totals = df.groupby("Department")["Salary"].sum()
budget = np.select([totals > 300000, totals >= 150000], ["Large Budget", "Medium Budget"], default="Small Budget")
pd.DataFrame({"Department": totals.index, "PayrollCategory": budget})
```

## Notes
- Use `np.where` for two outcomes, `np.select` for three or more.
- Order the conditions from most specific to least, just like `WHEN` clauses.
