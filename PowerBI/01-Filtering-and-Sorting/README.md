# 01 · Filtering and Sorting (Power BI)

[Power BI home](../README.md) · Next: [02 Aggregates →](../02-Aggregates-GroupBy-Having/README.md) · SQL version: [SQL 01](../../SQL/01-Filtering-and-Sorting/README.md)

> **Status:** 🟡 Starter page.

| SQL | Power BI |
|---|---|
| `WHERE Department = 'IT'` | Slicer, or Filters pane → Department is IT |
| `WHERE Salary > 80000` | Filters pane → Salary is greater than 80000 |
| `BETWEEN 70000 AND 95000` | Filters pane → Advanced filtering (is ≥ and is ≤) |
| `IN ('IT', 'HR')` | Filters pane → tick IT and HR |
| `ORDER BY Salary DESC` | Visual `…` menu → Sort axis → Salary, Sort descending |
| `TOP 3` | Filters pane → Filter type **Top N** → Top 3 by Salary |
| `DISTINCT Department` | Slicer on Department, or `VALUES(Employees[Department])` |

## DAX example: Top 3 IT earners

```dax
Top 3 IT Employees =
TOPN (
    3,
    FILTER ( Employees, Employees[Department] = "IT" ),
    Employees[Salary], DESC
)
```

Use it in a calculated table (Modeling → New table) to see the three rows.

## Notes
- Filters can live at three levels: **visual**, **page** and **report**. Pick the narrowest one that works.
- Sorting is a property of the visual, not of the data, so it isn't saved in the table.
