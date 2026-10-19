# 05 · Data Migration (Power BI)

[← 04 Subqueries](../04-Subqueries/README.md) · [Power BI home](../README.md) · Next: [06 CASE Logic →](../06-CASE-Logic/README.md) · SQL version: [SQL 05](../../SQL/05-Data-Migration/README.md)

> **Status:** 🟡 Starter page.

In Power BI, "migrating" a table into a new shape means creating a **new query** in Power Query. Right-click a query → **Reference** to start a new query from an existing one without copying the data.

| SQL | Power Query |
|---|---|
| Map to different column names | Right-click column → Rename |
| Copy only some columns | Home → Choose Columns |
| Copy with a filter | Filter rows |
| Constant value (`'Pending'`) | Add Column → Custom Column → `"Pending"` |
| `Salary / 12` | Add Column → Custom Column → `[Salary] / 12` |
| `CAST(Salary AS VARCHAR) + ' USD'` | `Text.From([Salary]) & " USD"` |
| `GROUP BY` + aggregate | Home → Group By |

## Example (Power Query M)

```m
let
    Source   = Employees,
    ITOnly   = Table.SelectRows(Source, each [Department] = "IT"),
    Chosen   = Table.SelectColumns(ITOnly, {"EmployeeID", "FullName", "Salary"}),
    Renamed  = Table.RenameColumns(Chosen, {{"EmployeeID", "ID"}, {"FullName", "EmployeeName"}, {"Salary", "BaseSalary"}}),
    Status   = Table.AddColumn(Renamed, "ReviewStatus", each "Pending", type text)
in
    Status
```

## Notes
- Every step is saved in **Applied Steps** and can be reordered or deleted. It's the visual version of my SQL "preview before you change" habit.
