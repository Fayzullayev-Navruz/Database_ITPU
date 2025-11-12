-- Top 5 Customers by Spending
SELECT 
    c.CompanyName,
    SUM(fcs.TotalAmount) AS TotalSpent
FROM FactCustomerSales fcs
JOIN DimCustomer c ON fcs.CustomerID = c.CustomerID
GROUP BY c.CompanyName
ORDER BY TotalSpent DESC
LIMIT 5;