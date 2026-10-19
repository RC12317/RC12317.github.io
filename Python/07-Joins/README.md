# 07 · Joins (Python)

[← 06 CASE Logic](../06-CASE-Logic/README.md) · [Python home](../README.md) · SQL version: [SQL 07](../../SQL/07-Joins/README.md)

> **Status:** 🟡 Starter page.

```python
import pandas as pd

customers = pd.DataFrame({
    "CustomerID": [1, 2, 3, 4],
    "CustomerName": ["Alex", "Brianna", "Carlos", "Dianna"],
})
orders = pd.DataFrame({
    "OrdersID": [101, 102, 103, 104],
    "CustomerID": [1, 2, 1, 4],
    "Amount": [500, 300, 200, 400],
})
```

| SQL | pandas |
|---|---|
| `INNER JOIN ... ON a.id = b.id` | `pd.merge(a, b, on="id", how="inner")` |
| `LEFT JOIN` | `how="left"` |
| `RIGHT JOIN` | `how="right"` |
| `FULL OUTER JOIN` | `how="outer"` |

## Customers who spent more than 400

```python
joined = pd.merge(customers, orders, on="CustomerID", how="inner")

result = (
    joined.groupby("CustomerName")
          .agg(Total_spent=("Amount", "sum"))
          .reset_index()
)
result[result["Total_spent"] > 400]
```

Expected output:

| CustomerName | Total_spent |
|---|---|
| Alex | 700 |

## Notes
- Carlos has no orders, so the inner join drops him. Try `how="left"` to keep him with `NaN`.
