# 06 · CASE Logic (Power BI)

[← 05 Data Migration](../05-Data-Migration/README.md) · [Power BI home](../README.md) · Next: [07 Joins →](../07-Joins/README.md) · SQL version: [SQL 06](../../SQL/06-CASE-Logic/README.md)

> **Status:** 🟡 Starter page.

`SWITCH ( TRUE (), condition1, result1, condition2, result2, default )` is the DAX version of `CASE WHEN`. Conditions are checked top to bottom and the first true one wins.

## Examples

Pay grade (calculated column):

```dax
PayGrade =
SWITCH (
    TRUE (),
    Employees[Salary] >= 90000, "High",
    Employees[Salary] >= 70000, "Medium",
    "Low"
)
```

Department code:

```dax
DeptCode =
SWITCH (
    Employees[Department],
    "IT", "TECH",
    "HR", "PEOPLE",
    "OPS"
)
```

Bonus by department:

```dax
Bonus =
SWITCH (
    Employees[Department],
    "IT", Employees[Salary] * 0.15,
    "HR", Employees[Salary] * 0.10,
    Employees[Salary] * 0.05
)
```

`CASE` with an aggregate, as a **measure**:

```dax
Budget Size =
VAR Total = SUM ( Employees[Salary] )
RETURN
    SWITCH (
        TRUE (),
        Total > 300000, "Large Budget",
        Total >= 150000, "Medium Budget",
        "Small Budget"
    )
```

## No-code option
Power Query: Add Column → **Conditional Column** builds the same logic with dropdowns.

## Notes
- Because the first match wins, test the highest range first. That's why `>= 90000` comes before `>= 70000` and I don't need `BETWEEN`.
- Use a **column** for row-level logic and a **measure** when the logic depends on a total.
