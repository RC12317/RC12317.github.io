# 04 · Subqueries (Power BI)

[← 03 Data Modification](../03-Data-Modification/README.md) · [Power BI home](../README.md) · Next: [05 Data Migration →](../05-Data-Migration/README.md) · SQL version: [SQL 04](../../SQL/04-Subqueries/README.md)

> **Status:** 🟡 Starter page.

DAX's `CALCULATE` plus a filter modifier does the job of a subquery.

| SQL | DAX |
|---|---|
| `(SELECT AVG(Salary) FROM Employees)` | `CALCULATE ( AVERAGE ( Employees[Salary] ), ALL ( Employees ) )` |
| Average of the **same department** (correlated) | `CALCULATE ( AVERAGE ( Employees[Salary] ), ALLEXCEPT ( Employees, Employees[Department] ) )` |

## Examples

```dax
Company Avg Salary =
CALCULATE ( AVERAGE ( Employees[Salary] ), ALL ( Employees ) )

Department Avg Salary =
CALCULATE ( AVERAGE ( Employees[Salary] ), ALLEXCEPT ( Employees, Employees[Department] ) )
```

Calculated column: above the company average?

```dax
Above Company Avg =
Employees[Salary] > CALCULATE ( AVERAGE ( Employees[Salary] ), ALL ( Employees ) )
```

Calculated column: above their own department's average?

```dax
Above Dept Avg =
Employees[Salary] > CALCULATE ( AVERAGE ( Employees[Salary] ), ALLEXCEPT ( Employees, Employees[Department] ) )
```

Then filter a visual where the column is `True`.

## Notes
- `ALL` removes every filter on the table. `ALLEXCEPT` removes every filter *except* the ones you list.
- Inside a calculated column, `CALCULATE` turns the current row into a filter. That's what makes the department version work like a correlated subquery.
