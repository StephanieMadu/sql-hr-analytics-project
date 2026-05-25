---- Databse Creation and Table
CREATE DATABASE HR_Analytics;
USE HR_Analytics;

-- EMPLOYEES TABLE
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    DepartmentID INT,
    JobTitle VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10,2),
    PerformanceScore VARCHAR(20),
    ManagerID INT,
    WorkLocation VARCHAR(50)
);

-- DEPARTMENTS TABLE
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- ATTENDANCE TABLE
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    AttendanceDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- LEAVE REQUESTS TABLE
CREATE TABLE LeaveRequests (
    LeaveID INT PRIMARY KEY,
    EmployeeID INT,
    LeaveType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    ApprovalStatus VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- TRAINING TABLE
CREATE TABLE TrainingRecords (
    TrainingID INT PRIMARY KEY,
    EmployeeID INT,
    TrainingName VARCHAR(100),
    CompletionDate DATE,
    Score INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- INSERT DEPARTMENTS
INSERT INTO Departments VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');

-- INSERT EMPLOYEES
INSERT INTO Employees VALUES
(101, 'Stephanie', 'Sunday', 'Female', 30, 1, 'HR Analyst', '2023-01-10', 32000, 'Excellent', NULL, 'Manchester'),
(102, 'James', 'Wilson', 'Male', 31, 2, 'Finance Officer', '2021-06-15', 40000, 'Good', 101, 'London'),
(103, 'Sarah', 'Brown', 'Female', 28, 3, 'Data Analyst', '2022-03-20', 45000, 'Excellent', 101, 'Manchester'),
(104, 'Daniel', 'Smith', 'Male', 35, 5, 'Operations Manager', '2020-09-01', 55000, 'Average', NULL, 'Birmingham'),
(105, 'Grace', 'Johnson', 'Female', 29, 4, 'Marketing Executive', '2024-02-12', 35000, 'Good', 104, 'Leeds'),
(106, 'Michael', 'Taylor', 'Male', 40, 3, 'IT Manager', '2019-11-11', 65000, 'Excellent', NULL, 'Manchester'),
(107, 'Linda', 'White', 'Female', 26, 1, 'Recruitment Coordinator', '2023-07-17', 30000, 'Good', 101, 'Liverpool'),
(108, 'Chris', 'Evans', 'Male', 32, 2, 'Payroll Specialist', '2022-10-08', 39000, 'Average', 102, 'London'),
(109, 'Emma', 'Walker', 'Female', 30, 5, 'Operations Analyst', '2021-05-25', 42000, 'Excellent', 104, 'Manchester'),
(110, 'David', 'Hall', 'Male', 27, 4, 'Social Media Officer', '2024-01-15', 31000, 'Good', 105, 'Leeds');

-- INSERT ATTENDANCE
INSERT INTO Attendance VALUES
(1, 101, '2026-05-01', 'Present'),
(2, 102, '2026-05-01', 'Absent'),
(3, 103, '2026-05-01', 'Present'),
(4, 104, '2026-05-01', 'Present'),
(5, 105, '2026-05-01', 'Late'),
(6, 106, '2026-05-01', 'Present'),
(7, 107, '2026-05-01', 'Absent'),
(8, 108, '2026-05-01', 'Present'),
(9, 109, '2026-05-01', 'Present'),
(10, 110, '2026-05-01', 'Late');

-- INSERT LEAVE REQUESTS
INSERT INTO LeaveRequests VALUES
(1, 101, 'Annual Leave', '2026-06-01', '2026-06-05', 'Approved'),
(2, 103, 'Sick Leave', '2026-04-10', '2026-04-12', 'Approved'),
(3, 105, 'Annual Leave', '2026-07-15', '2026-07-20', 'Pending'),
(4, 107, 'Maternity Leave', '2026-08-01', '2026-12-01', 'Approved'),
(5, 109, 'Emergency Leave', '2026-05-03', '2026-05-04', 'Rejected');

-- INSERT TRAINING RECORDS
INSERT INTO TrainingRecords VALUES
(1, 101, 'Power BI Training', '2026-03-01', 90),
(2, 102, 'Excel Advanced', '2026-02-10', 75),
(3, 103, 'SQL Bootcamp', '2026-01-15', 95),
(4, 105, 'Digital Marketing', '2026-04-01', 82),
(5, 107, 'Recruitment Skills', '2026-03-20', 88),
(6, 109, 'Leadership Workshop', '2026-02-28', 91);
