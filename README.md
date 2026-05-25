# sql-hr-analytics-project
HR Analytics using SQL

# HR Workforce Analytics SQL Project

## Overview

This project focuses on analysing HR workforce data using SQL Server. I created a relational database containing employee, department, attendance, leave, and training data to answer business-focused HR questions and generate workforce insights.

The goal of the project was to demonstrate SQL skills used in real business environments, including joins, aggregations, CTEs, subqueries, window functions, and data analysis techniques.

----

# Database Structure

The database consists of the following tables:

- Employees
- Departments
- Attendance
- LeaveRequests
- TrainingRecords

  ---

# SQL Skills Demonstrated

- INNER JOIN
- LEFT JOIN
- Aggregations
- CASE WHEN
- CTEs
- Window Functions
- UNION ALL
- HAVING
- Subqueries
- Views

---

## 1. Workforce Distribution Analysis

### Business Question: How is the workforce distributed across departments?

```sql
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalEmployees DESC;
--
### Insight
This analysis helps HR understand workforce concentration across departments and supports resource planning.

```
## 2. High-Performing Employee Analysis

### Business Question: Which employees scored above 85 in training, remained within lower salary bands, and were hired after 2022?

```sql
SELECT 
    e.FirstName,
    e.LastName,
    e.JobTitle,
    CONCAT('£', CAST(e.Salary AS INT)) AS Salary,
    t.TrainingName,
    t.Score,
    e.HireDate
FROM Employees e
JOIN TrainingRecords t
    ON e.EmployeeID = t.EmployeeID
WHERE t.Score > 85
    AND e.Salary < 40000
    AND YEAR(e.HireDate) > 2022
ORDER BY t.Score DESC;
```

### Insight
This analysis identified newer high-performing employees who achieved strong training results while remaining within lower salary bands. The findings could support salary review discussions, employee retention strategies, and internal progression planning.

---
## 3. Employees Without Training Records
### Business Question: Which employees have not completed training?

```sql
SELECT 
    e.FirstName,
    e.LastName,
    e.JobTitle,
    d.DepartmentName
FROM Employees e
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
LEFT JOIN TrainingRecords t
    ON e.EmployeeID = t.EmployeeID
WHERE t.EmployeeID IS NULL;
```
### Insight:
This helps HR identify employees who may require onboarding or additional development support.

----
### 4. Salary Ranking by Department
## Business Question: Who are the highest-paid employees within each department?

```sql
SELECT 
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    CONCAT('£', CAST(e.Salary AS INT)) AS Salary,
    RANK() OVER (
        PARTITION BY d.DepartmentName
        ORDER BY e.Salary DESC
    ) AS SalaryRank
FROM Employees e
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;
   ``` 
## Insight:
Window functions were used to rank employees by salary within departments to support internal pay analysis.

---
## 5. Department Salary Analysis Using CTE

### Business Question: Which departments have an average salary above £50,000?

```sql
WITH DepartmentSalary AS (
    SELECT 
        d.DepartmentName,
        AVG(e.Salary) AS AverageSalary
    FROM Employees e
    JOIN Departments d
        ON e.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentName
)
SELECT *
FROM DepartmentSalary
WHERE AverageSalary > 50000;
```

### Insight:
A Common Table Expression (CTE) was used to simplify salary aggregation analysis and identify departments with higher average salary levels.

## Tools Used

- SQL Server
- SQL Server Management Studio
- SQL
---

## Project Outcome
```
This project demonstrates my ability to create relational databases, write business-focused SQL queries, and transform raw HR data into actionable workforce insights for reporting and decision-making.

```
# Author

Stephanie Madojemu

