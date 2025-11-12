SELECT 
    c.CustomerID, 
    c.CompanyName, 
    SUM(fcs.TotalAmount) AS TotalSpent,
    SUM(fcs.TotalQuantity) AS TotalItemsPurchased,
    SUM(fcs.NumberOfTransactions) AS TransactionCount
FROM 
    FactCustomerSales fcs
JOIN DimCustomer c ON fcs.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalSpent DESC;