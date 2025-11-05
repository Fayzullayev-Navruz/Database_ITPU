-- 1) Staging tables
-- These tables temporarily hold raw data from the Northwind source tables
-- ==========================

CREATE TABLE staging_customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName TEXT,
    ContactName TEXT,
    ContactTitle TEXT,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT
);

CREATE TABLE staging_employees (
    EmployeeID INTEGER PRIMARY KEY,
    LastName TEXT,
    FirstName TEXT,
    Title TEXT,
    BirthDate DATE,
    HireDate DATE,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    HomePhone TEXT,
    Extension TEXT
);

CREATE TABLE staging_suppliers (
    SupplierID INTEGER PRIMARY KEY,
    CompanyName TEXT,
    ContactName TEXT,
    ContactTitle TEXT,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT
);

CREATE TABLE staging_categories (
    CategoryID INTEGER PRIMARY KEY,
    CategoryName TEXT,
    Description TEXT
);

CREATE TABLE staging_shippers (
    ShipperID INTEGER PRIMARY KEY,
    CompanyName TEXT,
    Phone TEXT
);

CREATE TABLE staging_products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    SupplierID INTEGER,
    CategoryID INTEGER,
    QuantityPerUnit TEXT,
    UnitPrice NUMERIC(12,4),
    UnitsInStock INTEGER
);

CREATE TABLE staging_orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID VARCHAR(10),
    EmployeeID INTEGER,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INTEGER,
    Freight NUMERIC(12,4),
    ShipName TEXT,
    ShipAddress TEXT,
    ShipCity TEXT,
    ShipRegion TEXT,
    ShipPostalCode TEXT,
    ShipCountry TEXT
);

CREATE TABLE staging_order_details (
    OrderID INTEGER,
    ProductID INTEGER,
    UnitPrice NUMERIC(12,4),
    Quantity INTEGER,
    Discount NUMERIC(12,4),
    PRIMARY KEY (OrderID, ProductID)
);