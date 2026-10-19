# 03 · Data Modification (Python)

[← 02 Aggregates](../02-Aggregates-GroupBy-Having/README.md) · [Python home](../README.md) · Next: [04 Subqueries →](../04-Subqueries/README.md) · SQL version: [SQL 03](../../SQL/03-Data-Modification/README.md)

> **Status:** 🟡 Starter page.

```python
import pandas as pd
df = pd.read_csv("../data/employees.csv")
```

| SQL | pandas |
|---|---|
| `INSERT INTO ... VALUES` | `pd.concat([df, new_rows], ignore_index=True)` |
| `UPDATE ... SET ... WHERE` | `df.loc[mask, "Salary"] = ...` |
| `DELETE FROM ... WHERE` | `df = df[~mask]` |

## Examples

```python
# Insert a new employee
new = pd.DataFrame([{"EmployeeID": 13, "FullName": "Sarah Lee", "Department": "IT", "Salary": 87000}])
df = pd.concat([df, new], ignore_index=True)

# 5% raise for IT
df.loc[df["Department"] == "IT", "Salary"] *= 1.05

# Flat 2,500 raise for HR
df.loc[df["Department"] == "HR", "Salary"] += 2500

# Delete everyone under 60,000
df = df[df["Salary"] >= 60000]

# Delete only Sales employees under 60,000
df = df[~((df["Department"] == "Sales") & (df["Salary"] < 60000))]
```

## Notes
- Like SQL, preview the mask first: `df[df["Department"] == "IT"]`.
- Changes happen in memory only. Save with `df.to_csv("employees_updated.csv", index=False)`.
