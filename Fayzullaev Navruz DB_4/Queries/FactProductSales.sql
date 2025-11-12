-- STEP 2: Fact Table
CREATE TABLE IF NOT EXISTS FactProductSales (
    FactSalesID SERIAL PRIMARY KEY,
    DateID INT,
    ProductID INT,
    QuantitySold INT,
    TotalSales DECIMAL(10,2),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)
);