-- 3) Fact table
-- FactSales contains numerical measures for sales analysis
-- ==========================

CREATE TABLE FactSales (
    SalesID SERIAL PRIMARY KEY,
    DateID INTEGER REFERENCES DimDate(DateID),
    CustomerID VARCHAR(10) REFERENCES DimCustomer(CustomerID),
    ProductID INTEGER REFERENCES DimProduct(ProductID),
    EmployeeID INTEGER REFERENCES DimEmployee(EmployeeID),
    CategoryID INTEGER REFERENCES DimCategory(CategoryID),
    ShipperID INTEGER REFERENCES DimShipper(ShipperID),
    SupplierID INTEGER REFERENCES DimSupplier(SupplierID),
    QuantitySold INTEGER,
    UnitPrice NUMERIC(12,4),
    Discount NUMERIC(12,4),
    TotalAmount NUMERIC(14,4),
    TaxAmount NUMERIC(14,4)
);