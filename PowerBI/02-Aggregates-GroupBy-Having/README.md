# 02 · Aggregates, GroupBy, HAVING (Power BI)

[← 01 Filtering](../01-Filtering-and-Sorting/README.md) · [Power BI home](../README.md) · Next: [03 Data Modification →](../03-Data-Modification/README.md) · SQL version: [SQL 02](../../SQL/02-Aggregates-GroupBy-Having/README.md)

> **Status:** 🟡 Starter page.

In Power BI, the **visual does the `GROUP BY`**. Put `Department` on the axis, then add a measure for the aggregate.

## Measures

```dax
Employee Count = COUNTROWS ( Employees )
Total Salary   = SUM ( Employees[Salary] )
Avg Salary     = AVERAGE ( Employees[Salary] )
Min Salary     = MIN ( Employees[Salary] )
Max Salary     = MAX ( Employees[Salary] )
```

| SQL | Power BI |
|---|---|
| `GROUP BY Department` | Department on the axis / rows |
| `COUNT(*)` | `COUNTROWS` |
| `SUM` / `AVG` / `MIN` / `MAX` | `SUM` / `AVERAGE` / `MIN` / `MAX` |
| `HAVING SUM(Salary) > 150000` | Visual-level filter on the **measure** `Total Salary` > 150000 |
| `WHERE` | Filter on a **column** (filters rows before aggregating) |
| `ORDER BY ... DESC` | Sort the visual by the measure, descending |

## Notes
- Same rule as SQL: a filter on a column filters rows. A filter on a measure filters groups.
- Create a **table** or **bar chart** visual: Department + Employee Count + Total Salary. Then add the visual-level filter.
