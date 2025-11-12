-- STEP 1: Fact Table
CREATE TABLE IF NOT EXISTS FactSales (
    FactSalesID SERIAL PRIMARY KEY,
    DateID INT,
    CustomerID VARCHAR(10),
    ProductID INT,
    EmployeeID INT,
    CategoryID INT,
    ShipperID INT,
    SupplierID INT,
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(10,2),
    TotalAmount DECIMAL(12,2),
    TaxAmount DECIMAL(12,2),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES DimCategory(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES DimSupplier(SupplierID)
);