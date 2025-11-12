-- STEP 4: Populate FactCustomerSales
INSERT INTO FactCustomerSales (DateID, CustomerID, TotalAmount, TotalQuantity, NumberOfTransactions)
SELECT
    d.DateID,
    c.CustomerID,
    SUM((od.UnitPrice * od.Quantity) - (od.UnitPrice * od.Quantity * od.Discount)) AS TotalAmount,
    SUM(od.Quantity) AS TotalQuantity,
    COUNT(DISTINCT o.OrderID) AS NumberOfTransactions
FROM staging_orders o
JOIN staging_order_details od ON o.OrderID = od.OrderID
JOIN DimDate d ON d.Date = o.OrderDate
JOIN DimCustomer c ON c.CustomerID = o.CustomerID
GROUP BY d.DateID, c.CustomerID;