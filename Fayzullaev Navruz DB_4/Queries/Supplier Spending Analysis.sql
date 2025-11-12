SELECT
    s.CompanyName,
    SUM(fsp.TotalPurchaseAmount) AS TotalSpend,
    EXTRACT(YEAR FROM fsp.PurchaseDate) AS Year,
    EXTRACT(MONTH FROM fsp.PurchaseDate) AS Month
FROM FactSupplierPurchases fsp
JOIN DimSupplier s ON fsp.SupplierID = s.SupplierID
GROUP BY s.CompanyName, Year, Month
ORDER BY TotalSpend DESC;