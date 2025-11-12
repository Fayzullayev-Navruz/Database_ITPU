-- STEP 1: Dimension Table Creation
CREATE TABLE IF NOT EXISTS DimSupplier (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(40),
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24)
);