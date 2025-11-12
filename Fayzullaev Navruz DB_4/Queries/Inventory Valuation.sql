SELECT 
    p.ProductName,
    p.UnitsInStock,
    p.UnitPrice,
    (p.UnitsInStock * p.UnitPrice) AS InventoryValue
FROM 
    DimProduct p
ORDER BY InventoryValue DESC;