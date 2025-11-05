-- Purpose: Transform staging data and load dimensions

-- DimCustomer
-- --------------------------
INSERT INTO DimCustomer (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone
FROM staging_customers
ON CONFLICT (CustomerID) DO UPDATE
  SET CompanyName = EXCLUDED.CompanyName,
      ContactName = EXCLUDED.ContactName;

-- DimEmployee
-- --------------------------
INSERT INTO DimEmployee (EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension)
SELECT EmployeeID, LastName, FirstName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension
FROM staging_employees
ON CONFLICT (EmployeeID) DO UPDATE
  SET LastName = EXCLUDED.LastName,
      FirstName = EXCLUDED.FirstName;

-- DimSupplier
-- --------------------------
INSERT INTO DimSupplier (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
SELECT SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone
FROM staging_suppliers
ON CONFLICT (SupplierID) DO UPDATE
  SET CompanyName = EXCLUDED.CompanyName;

-- DimCategory
-- --------------------------
INSERT INTO DimCategory (CategoryID, CategoryName, Description)
SELECT CategoryID, CategoryName, Description
FROM staging_categories
ON CONFLICT (CategoryID) DO UPDATE
  SET CategoryName = EXCLUDED.CategoryName;

-- DimShipper
-- --------------------------
INSERT INTO DimShipper (ShipperID, CompanyName, Phone)
SELECT ShipperID, CompanyName, Phone
FROM staging_shippers
ON CONFLICT (ShipperID) DO UPDATE
  SET CompanyName = EXCLUDED.CompanyName;

-- DimProduct
-- --------------------------
INSERT INTO DimProduct (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock)
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock
FROM staging_products
ON CONFLICT (ProductID) DO UPDATE
  SET ProductName = EXCLUDED.ProductName,
      UnitPrice = EXCLUDED.UnitPrice;

-- DimDate
-- --------------------------
-- Generate unique dates from orders for date dimension
INSERT INTO DimDate ("Date", Day, Month, Year, Quarter, WeekOfYear)
SELECT DISTINCT OrderDate,
       EXTRACT(DAY FROM OrderDate)::smallint,
       EXTRACT(MONTH FROM OrderDate)::smallint,
       EXTRACT(YEAR FROM OrderDate)::smallint,
       EXTRACT(QUARTER FROM OrderDate)::smallint,
       EXTRACT(WEEK FROM OrderDate)::smallint
FROM staging_orders
WHERE OrderDate IS NOT NULL
ON CONFLICT ("Date") DO NOTHING;

