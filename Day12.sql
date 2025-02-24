use zoom;
-- Views, CTE

/*

1. Views
Definition: A view is a virtual table in a database that is based on the result of a SELECT query.
It does not store data itself but provides a way to present data from one or more tables in a
structured format. Views can simplify complex queries, enhance security by restricting access to
specific data, and provide a consistent interface to data.

Key Features of Views
1. Simplification: Views can simplify complex queries by encapsulating them.
2. Security: They can restrict access to specific rows or columns of data.
3. Reusability: Once created, views can be reused in other queries.

*/


-- Example 1: Employee Management System

-- Step 1: Create the Employee table
CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Step 2: Insert sample data into Employees
INSERT INTO Employee (name, position, active, status) VALUES
('John Doe', 'Manager', TRUE, 'active'),
('Jane Smith', 'Developer', TRUE, 'active'),
('Bob Johnson', 'Designer', FALSE, 'inactive');

select * from employee;

-- Step 3: Create a view for active employees
CREATE VIEW EmployeeView AS
SELECT id, name, position
FROM Employee
WHERE active = 1;

-- Step 4: Use the view
SELECT * FROM EmployeeView;

-- Step 5: Update the view
CREATE OR REPLACE VIEW ActiveEmployees AS
SELECT id, name, position
FROM Employee
WHERE status = 'active';

-- Step 6: Use the updated view
SELECT * FROM ActiveEmployees;

-- Step 7: Delete the view
DROP VIEW IF EXISTS EmployeeView;

-- Optionally, delete the updated view
DROP VIEW IF EXISTS ActiveEmployees;


-- Example 2: Product Management System
-- Step 1: Create the Products Table
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Step 2: Insert Sample Data into Products
INSERT INTO Products (name, price, stock, category) VALUES
('Laptop', 999.99, 10, 'Electronics'),
('Smartphone', 499.99, 20, 'Electronics'),
('Desk', 199.99, 15, 'Furniture'),
('Chair', 89.99, 30, 'Furniture'),
('Headphones', 149.99, 25, 'Electronics');

-- Step 3: Create a View for Available Products
CREATE VIEW AvailableProducts AS
SELECT id, name, price, stock
FROM Products
WHERE stock > 0;

-- Step 4: Use the View
SELECT * FROM AvailableProducts;

-- Step 5: Update the View to Include Category
CREATE OR REPLACE VIEW AvailableProductsWithCategory AS
SELECT id, name, price, stock, category
FROM Products
WHERE stock > 0;

-- Step 6: Use the Updated View
SELECT * FROM AvailableProductsWithCategory;

-- Step 7: Delete the Views
DROP VIEW IF EXISTS AvailableProducts;
DROP VIEW IF EXISTS AvailableProductsWithCategory;


-- Example 3: Order Management System
-- Step 1: Create the Orders Table
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Step 2: Insert Sample Data into Orders
INSERT INTO Orders (customer_name, product_id, quantity, order_date) VALUES
('Alice', 1, 1, '2023-10-01'),
('Bob', 2, 2, '2023-10-02'),
('Charlie', 3, 1, '2023-10-03'),
('David', 1, 3, '2023-10-04');

-- Step 3: Create a View for Order Summary
CREATE VIEW OrderSummary AS
SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date
FROM Orders o
JOIN Products p ON o.product_id = p.id;

-- Step 4: Use the View
SELECT * FROM OrderSummary;

-- Step 5: Update the View to Include Total Price
CREATE OR REPLACE VIEW OrderSummaryWithTotal AS
SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date,
       (o.quantity * p.price) AS total_price
FROM Orders o
JOIN Products p ON o.product_id = p.id;

-- Step 6: Use the Updated View
SELECT * FROM OrderSummaryWithTotal;

-- Step 7: Delete the Views
DROP VIEW IF EXISTS OrderSummary;
DROP VIEW IF EXISTS OrderSummaryWithTotal;


/*
2. Common Table Expressions (CTE)
Definition:
A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
It is defined using the WITH clause.

Key Features of CTEs
1. Readability: CTEs can make complex queries easier to read and maintain.
2. Recursion: CTEs can be recursive, allowing for hierarchical data traversal.
3. Modularity: They can be defined once and referenced multiple times within the same query.
*/

-- Example 1: Employee Management System with CTE
-- Step 3: Use a CTE to Get Active Employees
WITH ActiveEmployees AS (
    SELECT id, name, position
    FROM Employee
    WHERE active = 1
)
SELECT * FROM ActiveEmployees;

-- Step 4: Use a CTE to Count Active Employees by Position
WITH ActiveEmployeeCounts AS (
    SELECT position, COUNT(*) AS count
    FROM Employee
    WHERE active = 1
    GROUP BY position
)
SELECT * FROM ActiveEmployeeCounts;

-- Step 5: Use a CTE to Get Inactive Employees
WITH InactiveEmployees AS (
    SELECT id, name, position
    FROM Employee
    WHERE active = 0
)
SELECT * FROM InactiveEmployees;

-- Step 6: Use a CTE to Get Employees with Status Counts
WITH EmployeeStatusCounts AS (
    SELECT status, COUNT(*) AS count
    FROM Employee
    GROUP BY status
)
SELECT * FROM EmployeeStatusCounts;

-- Step 7: Use a CTE to Delete Inactive Employees
WITH InactiveEmployees AS (
    SELECT id
    FROM Employee
    WHERE active = 0
)
DELETE FROM Employee
WHERE id IN (SELECT id FROM InactiveEmployees);


-- Example 2: Product Management System with CTE
-- Step 3: Use a CTE to Get Available Products
WITH AvailableProducts AS (
    SELECT id, name, price, stock
    FROM Products
    WHERE stock > 0
)
SELECT * FROM AvailableProducts;

-- Step 4: Use a CTE to Calculate Total Inventory Value
WITH InventoryValue AS (
    SELECT SUM(price * stock) AS total_value
    FROM Products
)
SELECT * FROM InventoryValue;

-- Step 5: Use a CTE to Get Products Below a Certain Stock Level
WITH LowStockProducts AS (
    SELECT id, name, stock
    FROM Products
    WHERE stock < 5
)
SELECT * FROM LowStockProducts;

-- Step 6: Use a CTE to Get Products by Category
WITH ProductsByCategory AS (
    SELECT category, COUNT(*) AS count
    FROM Products
    GROUP BY category
)
SELECT * FROM ProductsByCategory;

-- Step 7: Use a CTE to Delete Products with Zero Stock
WITH OutOfStockProducts AS (
    SELECT id
    FROM Products
    WHERE stock = 0
)
DELETE FROM Products
WHERE id IN (SELECT id FROM OutOfStockProducts);


-- Example 3: Order Management System with CTE
-- Step 3: Use a CTE to Get Order Summary
WITH OrderSummary AS (
    SELECT o.id, o.customer_name, p.name AS product_name, o.quantity, o.order_date
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
)
SELECT * FROM OrderSummary;

-- Step 4: Use a CTE to Calculate Total Sales by Product
WITH TotalSales AS (
    SELECT p.name AS product_name, SUM(o.quantity) AS total_quantity
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
    GROUP BY p.name
)
SELECT * FROM TotalSales;

-- Step 5: Use a CTE to Get Orders by Customer
WITH OrdersByCustomer AS (
    SELECT customer_name, COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_name
)
SELECT * FROM OrdersByCustomer;

-- Step 6: Use a CTE to Get Orders with Total Amounts
WITH OrderAmounts AS (
    SELECT o.id, o.customer_name, SUM(p.price * o.quantity) AS total_amount
    FROM Orders o
    JOIN Products p ON o.product_id = p.id
    GROUP BY o.id, o.customer_name
)
SELECT * FROM OrderAmounts;

-- Step 7: Use a CTE to Delete Orders Older Than a Certain Date
WITH OldOrders AS (
    SELECT id
    FROM Orders
    WHERE order_date < '2023-01-01'
)
DELETE FROM Orders
WHERE id IN (SELECT id FROM OldOrders);