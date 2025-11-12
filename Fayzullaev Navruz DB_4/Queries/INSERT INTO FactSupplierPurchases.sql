-- STEP 4: Populate FactSupplierPurchases
INSERT INTO FactSupplierPurchases (SupplierID, TotalPurchaseAmount, PurchaseDate, NumberOfProducts)
SELECT 
    p.SupplierID, 
    SUM(od.UnitPrice * od.Quantity) AS TotalPurchaseAmount,
    CURRENT_DATE AS PurchaseDate,
    COUNT(DISTINCT od.ProductID) AS NumberOfProducts
FROM staging_order_details od
JOIN staging_products p ON od.ProductID = p.ProductID
GROUP BY p.SupplierID;