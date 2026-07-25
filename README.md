# SQL Learning Notes 📘

A beginner-friendly SQL practice repository built around a simple company database (employees, salaries, and departments). Every query in [`SQL-Learning-Notes.sql`](./SQL-Learning-Notes.sql) is commented in plain English, making it easy to learn SQL step by step.

---

## 📂 Repository Structure

```
├── SQL-Learning-Notes.sql   # All queries with inline comments/explanations
└── README.md                 # This file
```

---

## 🗄️ Database Overview

**Database name:** `abhay`

| Table        | Description                                             |
|--------------|-----------------------------------------------------------|
| `employee`   | Basic employee details — id, name, age, gender, birth date, phone number |
| `salary`     | Occupation and salary for each employee, linked via `dept_id` |
| `department` | Department names and their locations                    |

**Relationships:**
- `employee.emp_id` ↔ `salary.emp_id`
- `salary.dept_id` ↔ `department.dept_id`

---

## 📑 Topics Covered

- [x] Database creation & selection (`USE`)
- [x] `CREATE TABLE` & `INSERT INTO`
- [x] `ALTER TABLE` & `UPDATE`
- [x] Basic `SELECT` queries & calculated columns
- [x] `WHERE` conditions (`AND`, `OR`, `NOT`, brackets)
- [x] `DISTINCT`
- [x] `LIKE` operator & wildcards (`%`, `_`)
- [x] `GROUP BY` & aggregate functions (`AVG`, `MIN`, `MAX`, `COUNT`)
- [x] `ORDER BY` (single & multi-column sorting)
- [x] `HAVING` clause
- [x] `LIMIT` & column aliasing (`AS`)
- [x] Joins — `INNER`, `LEFT`, `RIGHT`, `SELF`, multi-table joins
- [x] `UNION`
- [x] String functions — `LENGTH`, `UPPER`, `LOWER`, `TRIM`, `LEFT`, `RIGHT`, `SUBSTRING`, `REPLACE`, `LOCATE`
- [x] Subqueries & derived tables

---

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd <repo-folder>
   ```
2. Open `SQL-Learning-Notes.sql` in MySQL Workbench, DBeaver, VS Code, or any SQL client.
3. Run the queries **from top to bottom** — they're organized in the order you should learn them (setup → filtering → grouping → joins → advanced).
4. Read the comment above each query to understand what it does before running it.

> 💡 Tip: Try modifying the queries (different conditions, columns, table combos) to test your own understanding.

---

## 🛠️ Requirements

Any standard SQL database works (tested with **MySQL**). Minor syntax tweaks may be needed for PostgreSQL/SQL Server (e.g., `LIMIT` vs `OFFSET/FETCH`).

---

## 🙌 Contributing

Found a better way to explain a query, or want to add more examples/topics (window functions, indexes, transactions, etc.)? Feel free to open an issue or a pull request!

---

## 📄 License

Free to use for learning and teaching purposes.
