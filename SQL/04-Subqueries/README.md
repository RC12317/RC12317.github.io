# 04 · Subqueries

[← 03 Data Modification](../03-Data-Modification/README.md) · [SQL home](../README.md) · Next: [05 Data Migration →](../05-Data-Migration/README.md)

**Code:** [`queries.sql`](queries.sql)

## Skills practiced
Scalar subqueries · correlated subqueries · table aliases

## Questions solved
1. Employees above the company average salary
2. IT employees above the IT average
3. Employees earning more than the top HR salary
4. Top 3 salaries per department with no JOIN

## What I learned
- A subquery runs inside parentheses and returns a value (or list) the outer query uses.
- You can't put an aggregate in the outer `WHERE`. Put it in a subquery instead.
- **Correlated subquery:** the inner query refers back to the current row of the outer query. That's why the table gets an alias (`e` and `e2`).
- Top-N per group without a JOIN: count how many rows in the same group beat the current one. Keep the row if that count is below N.
- The inner query's `WHERE` is what scopes it. Forgetting `WHERE Department = 'HR'` in question 3 compared against the whole company.

## Mistakes I fixed
| What I wrote | Problem | Fix |
|---|---|---|
| Average of the whole company for the "IT average" question | Missing the department filter inside the subquery | Add `WHERE Department = 'IT'` in the subquery |
| `HAVING` + `GROUP BY Salary` for top 3 per department | `HAVING` can't rank rows within a group | Correlated subquery |
