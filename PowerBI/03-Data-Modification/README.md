# 03 · Data Modification (Power BI)

[← 02 Aggregates](../02-Aggregates-GroupBy-Having/README.md) · [Power BI home](../README.md) · Next: [04 Subqueries →](../04-Subqueries/README.md) · SQL version: [SQL 03](../../SQL/03-Data-Modification/README.md)

> **Status:** 🟡 Starter page.

Power BI reads data. It doesn't run `INSERT`, `UPDATE` or `DELETE` against the source. Instead, changes are **recorded as steps in Power Query** and replayed on every refresh. The source file is never touched.

| SQL | Power Query |
|---|---|
| `UPDATE ... SET Salary = Salary * 1.05 WHERE Department = 'IT'` | Add Column → Custom Column |
| `DELETE FROM ... WHERE Salary < 60000` | Filter rows on Salary (keep ≥ 60000) |
| `INSERT INTO ... VALUES` | Enter Data, then **Append Queries** |

## Examples (Power Query M)

```m
// 5% raise for IT, as a new column
= Table.AddColumn(Source, "NewSalary",
    each if [Department] = "IT" then [Salary] * 1.05 else [Salary])

// Remove employees under 60,000
= Table.SelectRows(Source, each [Salary] >= 60000)

// Remove only Sales employees under 60,000
= Table.SelectRows(Source, each not ([Department] = "Sales" and [Salary] < 60000))
```

## Notes
- Adding a *new column* instead of overwriting the old one keeps the original value available, as with `INSERT ... SELECT` in SQL.
