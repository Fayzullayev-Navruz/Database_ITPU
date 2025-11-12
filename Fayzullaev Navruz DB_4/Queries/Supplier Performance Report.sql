SELECT
    s.CompanyName,
    COUNT(fsp.PurchaseID) AS TotalOrders,
    SUM(fsp.TotalPurchaseAmount) AS TotalPurchaseValue,
    AVG(fsp.NumberOfProducts) AS AverageProductsPerOrder
FROM
    FactSupplierPurchases fsp
JOIN
    DimSupplier s ON fsp.SupplierID = s.SupplierID
GROUP BY
    s.CompanyName
ORDER BY
    TotalOrders DESC, TotalPurchaseValue DESC;