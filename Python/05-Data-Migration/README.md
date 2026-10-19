# 05 · Data Migration (Python)

[← 04 Subqueries](../04-Subqueries/README.md) · [Python home](../README.md) · Next: [06 CASE Logic →](../06-CASE-Logic/README.md) · SQL version: [SQL 05](../../SQL/05-Data-Migration/README.md)

> **Status:** 🟡 Starter page.

```python
import sqlite3
import pandas as pd

df = pd.read_csv("../data/employees.csv")
```

| SQL | pandas |
|---|---|
| `INSERT INTO Target (...) SELECT ...` | build a new DataFrame, then `to_sql` |
| Map to different column names | `.rename(columns={...})` |
| Copy only some columns | `df[["FullName", "Department"]]` |
| Constant value (`'Pending'`) | `df["ReviewStatus"] = "Pending"` |
| Calculated column | `df["MonthlyPay"] = df["Salary"] / 12` |
| `CAST(Salary AS VARCHAR) + ' USD'` | `df["Salary"].astype(str) + " USD"` |

## Examples

```python
# Archive everything with different column names
archive = df.rename(columns={
    "EmployeeID": "EmpID", "FullName": "Name",
    "Department": "Dept", "Salary": "SalaryAmount",
})

# IT only, with a default status
it_team = df[df["Department"] == "IT"].copy()
it_team["ReviewStatus"] = "Pending"

# 15% raise for IT, without touching the original df
it_adjusted = df[df["Department"] == "IT"].copy()
it_adjusted["AdjustedSalary"] = it_adjusted["Salary"] * 1.15

# Write to a real database table
conn = sqlite3.connect("practice.db")
archive.to_sql("EmployeeArchive", conn, if_exists="replace", index=False)
print(pd.read_sql("SELECT * FROM EmployeeArchive", conn))
conn.close()
```

## Notes
- `.copy()` keeps the source DataFrame unchanged, the same reason I use `INSERT ... SELECT` instead of `UPDATE` in SQL.
- `if_exists="replace"` rebuilds the table each run, so re-running doesn't create duplicates.
