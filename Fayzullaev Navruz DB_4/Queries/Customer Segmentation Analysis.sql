SELECT 
    c.CustomerID, 
    c.CompanyName,
    CASE
        WHEN SUM(fcs.TotalAmount) > 10000 THEN 'VIP'
        WHEN SUM(fcs.TotalAmount) BETWEEN 5000 AND 10000 THEN 'Premium'
        ELSE 'Standard'
    END AS CustomerSegment
FROM 
    FactCustomerSales fcs
JOIN DimCustomer c ON fcs.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY SUM(fcs.TotalAmount) DESC;