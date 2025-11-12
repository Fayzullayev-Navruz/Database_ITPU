-- STEP 4: Populate FactProductSales
INSERT INTO FactProductSales (DateID, ProductID, QuantitySold, TotalSales)
SELECT 
    d.DateID, 
    p.ProductID,
    od.Quantity,
    (od.Quantity * od.UnitPrice) AS TotalSales
FROM staging_order_details od
JOIN staging_orders o ON od.OrderID = o.OrderID
JOIN staging_products p ON od.ProductID = p.ProductID
JOIN DimDate d ON d.Date = o.OrderDate;