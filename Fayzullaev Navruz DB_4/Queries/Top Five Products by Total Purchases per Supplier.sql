SELECT
    s.CompanyName,
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity) AS TotalSpend
FROM staging_order_details od
JOIN staging_products p ON od.ProductID = p.ProductID
JOIN DimSupplier s ON p.SupplierID = s.SupplierID
GROUP BY s.CompanyName, p.ProductName
ORDER BY s.CompanyName, TotalSpend DESC
LIMIT 5;