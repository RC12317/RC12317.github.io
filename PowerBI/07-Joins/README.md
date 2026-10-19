# 07 · Joins (Power BI)

[← 06 CASE Logic](../06-CASE-Logic/README.md) · [Power BI home](../README.md) · SQL version: [SQL 07](../../SQL/07-Joins/README.md)

> **Status:** 🟡 Starter page.

Power BI gives you two ways to join tables.

| Approach | When to use it |
|---|---|
| **Relationships** (Model view) | The normal choice. Link `Customers[CustomerID]` to `Orders[CustomerID]` and the visuals combine them automatically. |
| **Merge Queries** (Power Query) | When you need the joined result as one physical table. Pick the join kind in the dialog. |

| SQL | Merge Queries join kind |
|---|---|
| `INNER JOIN` | Inner (only matching rows) |
| `LEFT JOIN` | Left outer |
| `RIGHT JOIN` | Right outer |
| `FULL OUTER JOIN` | Full outer |

## Customers who spent more than 400

With a one-to-many relationship (`Customers` → `Orders`):

```dax
Total Spent = SUM ( Orders[Amount] )
```

Put `Customers[CustomerName]` and `Total Spent` in a table visual, then add a visual-level filter: **Total Spent > 400**.

Result:

| CustomerName | Total Spent |
|---|---|
| Alex | 700 |

## Notes
- Relationships join **on the fly** when a visual needs them. Merge Queries join **once at refresh**.
- Carlos has no orders, so he doesn't appear once the filter is applied.
