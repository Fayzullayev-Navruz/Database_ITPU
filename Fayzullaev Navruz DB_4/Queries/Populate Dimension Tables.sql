-- STEP 3: Populate Dimension Tables
INSERT INTO DimProduct (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock)
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock
FROM staging_products
WHERE Discontinued = FALSE;

INSERT INTO DimCategory (CategoryID, CategoryName, Description)
SELECT CategoryID, CategoryName, Description
FROM staging_categories;