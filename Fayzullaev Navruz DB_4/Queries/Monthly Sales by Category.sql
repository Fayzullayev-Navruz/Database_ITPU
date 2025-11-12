-- Monthly Sales by Category
SELECT d.Month, d.Year, c.CategoryName, SUM(fs.TotalAmount) AS TotalSales
FROM FactSales fs
JOIN DimDate d ON fs.DateID = d.DateID
JOIN DimCategory c ON fs.CategoryID = c.CategoryID
GROUP BY d.Month, d.Year, c.CategoryName
ORDER BY d.Year, d.Month, TotalSales DESC;