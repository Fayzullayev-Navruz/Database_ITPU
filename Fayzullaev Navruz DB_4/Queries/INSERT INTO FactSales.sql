-- STEP 2: Populate FactSales
INSERT INTO FactSales (DateID, CustomerID, ProductID, QuantitySold, UnitPrice, Discount, TotalAmount, TaxAmount)
SELECT 
    d.DateID,
    o.CustomerID,
    p.ProductID,
    od.Quantity,
    od.UnitPrice,
    od.Discount,
    (od.Quantity * od.UnitPrice - od.Discount) AS TotalAmount,
    (od.Quantity * od.UnitPrice - od.Discount) * 0.1 AS TaxAmount
FROM staging_order_details od
JOIN staging_orders o ON od.OrderID = o.OrderID
JOIN staging_products p ON od.ProductID = p.ProductID
JOIN DimDate d ON d.Date = o.OrderDate;