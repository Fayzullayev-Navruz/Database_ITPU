-- STEP 2: Fact Table
CREATE TABLE IF NOT EXISTS FactCustomerSales (
    FactCustomerSalesID SERIAL PRIMARY KEY,
    DateID INT,
    CustomerID VARCHAR(10),
    TotalAmount DECIMAL(10,2),
    TotalQuantity INT,
    NumberOfTransactions INT,
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID)
);