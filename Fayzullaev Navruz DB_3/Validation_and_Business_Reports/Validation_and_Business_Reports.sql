-- Purpose: Validate data and generate business reports for Northwind DWH
-- PostgreSQL compliant

-- Validation Queries
-- ==========================

-- Count total records in FactSales
SELECT COUNT(*) AS total_fact_sales FROM FactSales;

-- Check for null foreign keys in FactSales
SELECT COUNT(*) AS null_dateid FROM FactSales WHERE DateID IS NULL;
SELECT COUNT(*) AS null_customerid FROM FactSales WHERE CustomerID IS NULL;
SELECT COUNT(*) AS null_productid FROM FactSales WHERE ProductID IS NULL;
SELECT COUNT(*) AS null_employeeid FROM FactSales WHERE EmployeeID IS NULL;

-- Business Report Queries
-- ==========================

-- 1) Sales trends per product category monthly (Jan-Mar)
-- Displays average sales, total quantity sold, and transaction count
SELECT
    EXTRACT(MONTH FROM d."Date") AS Month,
    cat.CategoryName,
    AVG(f.TotalAmount) AS AvgSales,
    SUM(f.QuantitySold) AS TotalQuantity,
    COUNT(f.SalesID) AS TransactionCount
FROM FactSales f
JOIN DimProduct p ON f.ProductID = p.ProductID
JOIN DimCategory cat ON p.CategoryID = cat.CategoryID
JOIN DimDate d ON f.DateID = d.DateID
WHERE EXTRACT(MONTH FROM d."Date") IN (1,2,3)
GROUP BY EXTRACT(MONTH FROM d."Date"), cat.CategoryName
ORDER BY EXTRACT(MONTH FROM d."Date"), cat.CategoryName;

-- 2) Top 5 products by transactions and total sales per month
SELECT *
FROM (
    SELECT
        p.ProductName,
        cat.CategoryName,
        EXTRACT(MONTH FROM d."Date") AS Month,
        COUNT(f.SalesID) AS TransactionCount,
        SUM(f.TotalAmount) AS TotalSales,
        SUM(f.TaxAmount) AS TotalTax,
        RANK() OVER (PARTITION BY EXTRACT(MONTH FROM d."Date") ORDER BY SUM(f.TotalAmount) DESC) AS SalesRank
    FROM FactSales f
    JOIN DimProduct p ON f.ProductID = p.ProductID
    LEFT JOIN DimCategory cat ON p.CategoryID = cat.CategoryID
    JOIN DimDate d ON f.DateID = d.DateID
    GROUP BY p.ProductName, cat.CategoryName, EXTRACT(MONTH FROM d."Date")
) sub
WHERE SalesRank <= 5
ORDER BY Month, SalesRank;

-- 3) Top five customers by transactions and total purchases
SELECT *
FROM (
    SELECT
        c.CustomerID,
        c.CompanyName,
        COUNT(f.SalesID) AS TransactionCount,
        SUM(f.TotalAmount) AS TotalPurchases,
        RANK() OVER (ORDER BY SUM(f.TotalAmount) DESC) AS PurchaseRank
    FROM FactSales f
    JOIN DimCustomer c ON f.CustomerID = c.CustomerID
    GROUP BY c.CustomerID, c.CompanyName
) sub
WHERE PurchaseRank <= 5
ORDER BY PurchaseRank;

-- 4) Sales chart for first week of each month
SELECT
    EXTRACT(MONTH FROM d."Date") AS Month,
    SUM(f.TotalAmount) AS TotalSales,
    SUM(f.QuantitySold) AS TotalQuantity
FROM FactSales f
JOIN DimDate d ON f.DateID = d.DateID
WHERE d.Day <= 7
GROUP BY EXTRACT(MONTH FROM d."Date")
ORDER BY EXTRACT(MONTH FROM d."Date");

-- 5) Weekly sales report by product categories (one year)
SELECT
    EXTRACT(YEAR FROM d."Date") AS Year,
    EXTRACT(WEEK FROM d."Date") AS Week,
    cat.CategoryName,
    SUM(f.TotalAmount) AS TotalSales,
    SUM(f.QuantitySold) AS TotalQuantity
FROM FactSales f
JOIN DimProduct p ON f.ProductID = p.ProductID
JOIN DimCategory cat ON p.CategoryID = cat.CategoryID
JOIN DimDate d ON f.DateID = d.DateID
GROUP BY EXTRACT(YEAR FROM d."Date"), EXTRACT(WEEK FROM d."Date"), cat.CategoryName
ORDER BY Year, Week, cat.CategoryName;

-- 6) Median sales value by product category and country
-- Uses PERCENTILE_CONT for median calculation
SELECT
    cat.CategoryName,
    c.Country,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY f.TotalAmount) AS MedianSales
FROM FactSales f
JOIN DimProduct p ON f.ProductID = p.ProductID
JOIN DimCategory cat ON p.CategoryID = cat.CategoryID
JOIN DimCustomer c ON f.CustomerID = c.CustomerID
GROUP BY cat.CategoryName, c.Country
ORDER BY cat.CategoryName, c.Country;

-- 7) Sales ranking by product categories
-- Best-selling categories at the top
SELECT *
FROM (
    SELECT
        cat.CategoryName,
        SUM(f.TotalAmount) AS TotalSales,
        RANK() OVER (ORDER BY SUM(f.TotalAmount) DESC) AS CategoryRank
    FROM FactSales f
    JOIN DimProduct p ON f.ProductID = p.ProductID
    JOIN DimCategory cat ON p.CategoryID = cat.CategoryID
    GROUP BY cat.CategoryName
) sub
ORDER BY CategoryRank;

