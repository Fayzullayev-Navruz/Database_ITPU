WITH MonthlySales AS (
    SELECT
        d.Year,
        d.Month,
        SUM(fs.TotalAmount) AS TotalSales
    FROM FactSales fs
    JOIN DimDate d ON fs.DateID = d.DateID
    GROUP BY d.Year, d.Month
),
MonthlyGrowth AS (
    SELECT
        Year,
        Month,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY Year, Month) AS PreviousMonthSales,
        (TotalSales - LAG(TotalSales) OVER (ORDER BY Year, Month)) / LAG(TotalSales) OVER (ORDER BY Year, Month) AS GrowthRate
    FROM MonthlySales
)
SELECT * FROM MonthlyGrowth;