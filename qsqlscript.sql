-- Drop tables if they exist (for re-running the script)
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;

-- 1. Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Finance', 'Chicago'),
(4, 'Sales', 'Los Angeles'),
(5, 'Operations', 'Houston');

-- 2. Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    job_title VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT NULL,
    commission DECIMAL(10,2) NULL
);

INSERT INTO employees VALUES
(101, 'John Doe', 'Manager', 2, 85000.00, '2018-03-15', NULL, NULL),
(102, 'Jane Smith', 'Developer', 2, 75000.00, '2019-07-22', 101, NULL),
(103, 'Mike Johnson', 'Accountant', 3, 65000.00, '2020-01-10', NULL, NULL),
(104, 'Emily Davis', 'HR Specialist', 1, 52000.00, '2021-05-05', NULL, NULL),
(105, 'Robert Brown', 'Sales Executive', 4, 60000.00, '2017-09-12', NULL, 5000.00),
(106, 'Laura Wilson', 'Sales Executive', 4, 62000.00, '2018-11-23', 105, 3000.00),
(107, 'David Lee', 'Developer', 2, 68000.00, '2020-06-15', 101, NULL),
(108, 'Sarah Kim', 'Accountant', 3, 67000.00, '2019-02-20', NULL, NULL),
(109, 'James White', 'Manager', 4, 90000.00, '2016-08-30', NULL, NULL),
(110, 'Anna Black', 'Operations Manager', 5, 95000.00, '2015-12-01', NULL, NULL),
(111, 'Tom Green', 'Intern', 2, 30000.00, '2022-01-10', 102, NULL),
(112, 'Sara Blue', 'Intern', 1, 32000.00, '2022-02-01', 104, NULL);

-- 3. Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales VALUES
(1, 105, 2000.00, '2022-01-15'),
(2, 106, 3000.00, '2022-01-20'),
(3, 102, 1500.00, '2022-02-10'),
(4, 107, 2500.00, '2022-02-15'),
(5, 109, 5000.00, '2022-03-05'),
(6, 105, 3500.00, '2022-03-10'),
(7, 106, 4000.00, '2022-04-01'),
(8, 102, 1800.00, '2022-04-07');

-- 4. Users Table (for email and other info)
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100),
    last_active DATE,
    created_at TIMESTAMP
);

INSERT INTO users VALUES
(1, 'alice@example.com', '2023-10-05', '2023-01-10 09:00:00'),
(2, 'bob@example.com', '2023-10-04', '2023-02-15 10:30:00'),
(3, 'charlie@example.com', '2023-10-03', '2023-03-20 11:45:00'),
(4, 'alice@example.com', '2023-10-02', '2023-04-01 14:20:00'), -- duplicate email
(5, 'eve@example.com', '2023-10-01', '2023-05-05 16:00:00');

-- 5. Invoices Table (for sequence gaps)
CREATE TABLE invoices (
    invoice_number INT PRIMARY KEY,
    invoice_date DATE,
    customer_name VARCHAR(50)
);

INSERT INTO invoices VALUES
(1001, '2022-01-10', 'Customer A'),
(1002, '2022-01-15', 'Customer B'),
(1004, '2022-02-01', 'Customer C'),
(1005, '2022-02-20', 'Customer D'),
(1006, '2022-03-01', 'Customer E');

-- Note: invoice number 1003 is missing, creating a gap.

-- 6. Sales by Month (for pivot/unpivot)
-- For simplicity, assume a sales table with quarterly sales
CREATE TABLE quarterly_sales (
    product VARCHAR(50),
    Q1 DECIMAL(10,2),
    Q2 DECIMAL(10,2),
    Q3 DECIMAL(10,2),
    Q4 DECIMAL(10,2)
);

INSERT INTO quarterly_sales VALUES
('ProductA', 1000.00, 1500.00, 2000.00, 2500.00),
('ProductB', 2000.00, 1800.00, 2200.00, 2400.00);

-- Now you can start practicing your queries based on these tables.
