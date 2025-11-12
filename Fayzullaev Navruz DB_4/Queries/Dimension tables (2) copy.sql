
-- STEP 1: Dimension Tables
CREATE TABLE IF NOT EXISTS DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(40),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(20),
    UnitPrice DECIMAL(10,2),
    UnitsInStock SMALLINT
);

CREATE TABLE IF NOT EXISTS DimCategory (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(15),
    Description TEXT
);

CREATE TABLE IF NOT EXISTS DimDate (
    DateID SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Day INT NOT NULL,
    Month INT NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    WeekOfYear INT NOT NULL
);