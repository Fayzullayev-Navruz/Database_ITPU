-- STEP 2: Fact Table Creation
CREATE TABLE IF NOT EXISTS FactSupplierPurchases (
    PurchaseID SERIAL PRIMARY KEY,
    SupplierID INT,
    TotalPurchaseAmount DECIMAL(12,2),
    PurchaseDate DATE,
    NumberOfProducts INT,
    FOREIGN KEY (SupplierID) REFERENCES DimSupplier(SupplierID)
);