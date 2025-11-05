-- Purpose: Load raw data into staging tables

-- Customers
INSERT INTO staging_customers
SELECT * FROM Customers;

-- Employees
INSERT INTO staging_employees
SELECT * FROM Employees;

-- Suppliers
INSERT INTO staging_suppliers
SELECT * FROM Suppliers;

-- Categories
INSERT INTO staging_categories
SELECT * FROM Categories;

-- Shippers
INSERT INTO staging_shippers
SELECT * FROM Shippers;

-- Products
INSERT INTO staging_products
SELECT * FROM Products;

-- Orders
INSERT INTO staging_orders
SELECT * FROM Orders;

-- Order Details
INSERT INTO staging_order_details
SELECT * FROM "Order Details";

