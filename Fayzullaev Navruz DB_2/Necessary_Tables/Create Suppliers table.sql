-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    Homepage TEXT
);
