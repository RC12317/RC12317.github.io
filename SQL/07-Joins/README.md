# 07 · Joins

[← 06 CASE Logic](../06-CASE-Logic/README.md) · [SQL home](../README.md)

**Code:** [`queries.sql`](queries.sql)

## Skills practiced
`INNER JOIN` · `ON` · join + `GROUP BY` + `HAVING` · table aliases

## Practice data

**Customers_2**

| CustomerID | CustomerName |
|---|---|
| 1 | Alex |
| 2 | Brianna |
| 3 | Carlos |
| 4 | Dianna |

**Orders_2**

| OrdersID | CustomerID | Amount |
|---|---|---|
| 101 | 1 | 500 |
| 102 | 2 | 300 |
| 103 | 1 | 200 |
| 104 | 4 | 400 |

## Question
Show each customer's name and total amount spent, only for customers who spent **more than 400**.

## Answer

```sql
SELECT c.CustomerName,
       SUM(o.Amount) AS Total_spent
FROM Customers_2 AS c
INNER JOIN Orders_2 AS o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING SUM(o.Amount) > 400;
```

| CustomerName | Total_spent |
|---|---|
| Alex | 700 |

## What I learned
- `INNER JOIN` keeps only rows that match in both tables. Carlos has no orders, so he disappears.
- The join condition goes in `ON`. The group filter goes in `HAVING`.
- Group by the **name** you display, not by a different column (an earlier attempt grouped by `country` while selecting `first_name`).
- Prefixing columns with their table (or an alias) is optional until both tables share a column name, and is clearer anyway.
- `SUM` can't be prefixed like `Orders_2.SUM(Amount)`. The prefix goes inside: `SUM(Orders_2.Amount)`.
- The `Employees` table couldn't practice joins without becoming a self join, so I created two new tables.

## Next up
`LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, self joins, multi-table joins.
