SELECT 
    p.ProductName,
    SUM(fps.QuantitySold) AS TotalQuantitySold,
    SUM(fps.TotalSales) AS TotalRevenue
FROM 
    FactProductSales fps
JOIN DimProduct p ON fps.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;