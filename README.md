# 📚 e-learning-purchase-database
MySQL-based e-learning Purchase Database project for analyzing learner purchases, course performance, revenue, and category-wise insights

## 📌 Project Overview

This project focuses on analyzing **e-learning platform purchase data using MySQL** to derive meaningful business insights from learner, course, and purchase information.

The database consists of three main tables — **learners, courses, and purchases** — which are connected using primary and foreign key relationships. SQL queries are used to analyze learner spending, course popularity, category performance, and purchasing behavior.

---

## 🎯 Project Objective

An online learning platform offers various digital courses to learners across different countries. Learners can purchase multiple courses, and each course belongs to a specific category.

The management team wants to understand **sales trends, learner behavior, and popular course categories** from the available purchase data.

To address these requirements, a relational database was designed using MySQL. SQL queries were then used to combine learner, course, and purchase data, calculate revenue and spending, identify purchasing patterns, and generate insights for decision-making.

---

## ❓ Problem Statement

This project is to use **MySQL and SQL analysis techniques** to understand:

* Learner purchasing behavior and spending patterns
* Most purchased courses
* Category-wise revenue and learner participation
* Learners purchasing courses from multiple categories
* Courses that have never been purchased
* Business opportunities based on purchasing patterns


---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* DDL & DML Commands
* Primary Keys & Foreign Keys
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* Aggregate Functions
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* Subqueries
* Correlated Subqueries
* Common Table Expressions (CTEs)
* CASE Expressions
* IFNULL()
* Views

These SQL concepts were used for database creation, data exploration, data analysis, and reporting.

---

## 🗄️ Database Schema

### 👤 Learners Table

| Column       | Data Type    | Description                               |
| ------------ | ------------ | ----------------------------------------- |
| `learner_id` | INT          | Primary key and unique learner identifier |
| `full_name`  | VARCHAR(100) | Learner name                              |
| `country`    | VARCHAR(50)  | Learner's country                         |

### 📚 Courses Table

| Column        | Data Type     | Description                              |
| ------------- | ------------- | ---------------------------------------- |
| `course_id`   | INT           | Primary key and unique course identifier |
| `course_name` | VARCHAR(200)  | Course name                              |
| `category`    | VARCHAR(200)  | Course category                          |
| `unit_price`  | DECIMAL(10,2) | Course price                             |

### 🛒 Purchases Table

| Column          | Data Type | Description                         |
| --------------- | --------- | ----------------------------------- |
| `purchase_id`   | INT       | Primary key and auto-incremented ID |
| `learner_id`    | INT       | Foreign key referencing learners    |
| `course_id`     | INT       | Foreign key referencing courses     |
| `quantity`      | INT       | Number of courses purchased         |
| `purchase_date` | DATE      | Date of purchase                    |

The project uses primary and foreign key relationships to connect learners, courses, and purchases.

---

## 🔗 Database Relationships

```text
LEARNERS
   │
   │ learner_id
   ▼
PURCHASES
   │
   │ course_id
   ▼
COURSES
```

* `learners.learner_id` → `purchases.learner_id`
* `courses.course_id` → `purchases.course_id`

---

# 🔍 Data Analysis Performed

## 1. Database Setup & Data Entry

Created the MySQL database and three relational tables:

* `learners`
* `courses`
* `purchases`

Primary keys, foreign keys, data types, and constraints were applied during database creation.

---

## 2. Data Exploration Using Joins

Used different SQL joins to combine learner, course, and purchase information.

### INNER JOIN

Displays only records where the learner and course exist.

### LEFT JOIN

Used to retain all learners, including learners without purchases.

### RIGHT JOIN

Used to retain all courses, including courses that have never been purchased.

---

## 3. Core Analytical Queries

The analysis includes:

* Learner-wise total spending
* Top 3 most purchased courses
* Category-wise total revenue
* Number of unique learners per category
* Learners purchasing from multiple categories
* Courses that have never been purchased

The project specifically includes analysis of the most purchased courses and never-purchased courses.

---

## 4. Subqueries & Correlated Subqueries

Used subqueries to analyze:

* Courses whose price is higher than courses in the **Beginner** category
* Learners whose spending is higher than the average spending in their country

---

## 5. CTE, CASE & NULL Handling

### CTE

Used a Common Table Expression to calculate learner spending and identify learners with spending above **₹10,000**.

### CASE Expression

Learners were classified according to their spending level:

* **Above ₹15,000** → High Value
* **₹8,000–₹15,000** → Medium Value
* **Below ₹8,000** → Low Value

### NULL Handling

Used `IFNULL()` to replace NULL purchase counts with `0`.

### View

Created:

```sql
category_performance_view
```

to summarize category performance.

---

# 📊 Four Types of Data Analysis

## 1. 📋 Descriptive Analysis — What Happened?

* Total revenue generated: **₹2,03,400**
* Highest-performing category: **Web Development — ₹72,000**
* Highest-spending learners:

  * **Anitha Raj — ₹31,000**
  * **Manoj Kumar — ₹31,000**
* Highest purchase quantity:

  * Excel for Beginners
  * JavaScript Fundamentals
  * React JS Development
  * Microsoft Azure Basics
* India recorded the **highest average learner spending**.
* UK recorded the **lowest average learner spending**.
* UI/UX Design had **zero purchases**.

---

## 2. 🔎 Diagnostic Analysis — Why Did It Happen?

* Web Development generated the highest revenue because its courses, particularly **JavaScript Fundamentals and React JS Development**, had strong purchase activity.
* Anitha Raj and Manoj Kumar achieved the highest spending because they purchased multiple courses and/or higher-quantity purchases.
* UI/UX Design generated no revenue because its courses recorded **zero purchases**.
* Differences in country-level average spending indicate varying purchasing patterns among learners.

---

## 3. 🔮 Predictive Analysis — What Might Happen?

Based on the current purchasing patterns:

* Popular courses may continue to attract strong demand.
* Web Development may continue to be a major revenue-generating category.
* High-value learners may have greater potential for future purchases.
* Multi-category learners may provide opportunities for additional course purchases.
* Courses with zero purchases may continue to experience low demand without targeted marketing.

> **Note:** These are data-driven expectations based on the current dataset and are not results from a formal forecasting or machine-learning model.

---

## 4. 💡 Prescriptive Analysis — What Should We Do?

Based on the analysis, the platform can:

* 🎯 Focus marketing on **high-performing categories**.
* 📚 Promote popular courses such as JavaScript and React.
* 👤 Provide personalized offers to **high-value learners**.
* 🔄 Use cross-selling strategies for learners interested in multiple categories.
* 📢 Improve marketing and visibility for courses with zero purchases.
* 💰 Prioritize course development and marketing based on **category demand and revenue potential**.

These recommendations are aligned with the project findings and documented recommendations.

---

# 📈 Key Business Insights

| Metric                      | Insight                                          |
| --------------------------- | ------------------------------------------------ |
| 💰 Total Revenue            | **₹2,03,400**                                    |
| 🏆 Top Category             | **Web Development**                              |
| 💵 Top Category Revenue     | **₹72,000**                                      |
| 👤 Highest Spender          | **Anitha Raj – ₹31,000**                         |
| 👤 Highest Spender          | **Manoj Kumar – ₹31,000**                        |
| 📚 Popular Courses          | **Excel, JavaScript, React JS, Microsoft Azure** |
| 🌍 Highest Average Spending | **India**                                        |
| 🌍 Lowest Average Spending  | **UK**                                           |
| ⚠️ Area Requiring Attention | **UI/UX Design – 0 purchases**                   |

---

# 🧠 Skills Learned

Through this project, I strengthened my practical skills in:

* Database Design
* MySQL
* SQL Querying
* Data Exploration
* Joins
* Aggregations
* Subqueries
* Correlated Subqueries
* CTEs
* CASE Expressions
* NULL Handling
* Views
* Data Analysis
* Query Optimization
* Business Insight Generation

The project helped strengthen practical SQL skills in database design, data analysis, query optimization, and result interpretation.

---

# 📁 Project Structure

```text
E-Learning-Purchase-Database/
│
├── E-learning_Purchase_Database.sql
├── README.md
└── PDF Document of E-learning Purchase Database.pdf
```

---

# ✅ Conclusion

This project demonstrates how **MySQL can transform e-learning purchase data into meaningful business insights**.

By applying joins, aggregations, filtering, subqueries, CTEs, CASE expressions, NULL handling, and views, the analysis provides insights into **learner spending, course popularity, category performance, and purchasing behavior**.

The findings can help management focus marketing efforts on top-performing categories, understand high-value learners, and improve course and marketing strategies.

---

## 👩‍💻 Author

**Shanthini**

**Aspiring Data Analyst**

**Skills:** MySQL | SQL | Database Design | Data Management

## 📄 License

This project is created for educational and assignment purposes only.

## 🙏 Acknowledgments

I would like to thank:

- **Entri Elevate Course Support** for providing guidance and learning resources throughout this project.
- **MySQL Documentation** for valuable references and support in understanding SQL commands, database design, and implementation.

