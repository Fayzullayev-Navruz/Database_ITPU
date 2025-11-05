-- 2) Dimension tables
-- Store descriptive attributes for analysis
-- ==========================

CREATE TABLE DimDate (
    DateID SERIAL PRIMARY KEY,
    "Date" DATE UNIQUE,
    Day SMALLINT,
    Month SMALLINT,
    Year SMALLINT,
    Quarter SMALLINT,
    WeekOfYear SMALLINT
);

CREATE TABLE DimCustomer (
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

CREATE TABLE DimEmployee (
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

CREATE TABLE DimCategory (
    CategoryID INTEGER PRIMARY KEY,
    CategoryName TEXT,
    Description TEXT
);

CREATE TABLE DimShipper (
    ShipperID INTEGER PRIMARY KEY,
    CompanyName TEXT,
    Phone TEXT
);

CREATE TABLE DimSupplier (
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

CREATE TABLE DimProduct (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    SupplierID INTEGER,
    CategoryID INTEGER,
    QuantityPerUnit TEXT,
    UnitPrice NUMERIC(12,4),
    UnitsInStock INTEGER
);