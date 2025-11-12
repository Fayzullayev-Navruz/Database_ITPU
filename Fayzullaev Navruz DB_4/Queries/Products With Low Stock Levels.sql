SELECT 
    ProductID,
    ProductName,
    UnitsInStock
FROM 
    DimProduct
WHERE 
    UnitsInStock < 10;  -- Assumes a critical low stock level threshold of 10 units