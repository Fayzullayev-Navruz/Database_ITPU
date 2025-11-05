-- Purpose: Load transformed data into FactSales table

INSERT INTO FactSales (DateID, CustomerID, ProductID, EmployeeID, CategoryID, ShipperID, SupplierID, QuantitySold, UnitPrice, Discount, TotalAmount, TaxAmount)
SELECT
    d.DateID,   
    c.CustomerID,  
    p.ProductID,  
    e.EmployeeID,  
    cat.CategoryID,  
    s.ShipperID,  
    sup.SupplierID, 
    od.Quantity, 
    od.UnitPrice, 
    od.Discount,    
    (od.Quantity * od.UnitPrice - od.Discount) AS TotalAmount,
    (od.Quantity * od.UnitPrice - od.Discount) * 0.1 AS TaxAmount     
FROM staging_order_details od 
JOIN staging_orders o ON od.OrderID = o.OrderID 
JOIN DimCustomer c ON o.CustomerID = c.CustomerID 
JOIN DimProduct p ON od.ProductID = p.ProductID  
LEFT JOIN DimEmployee e ON o.EmployeeID = e.EmployeeID 
LEFT JOIN DimCategory cat ON p.CategoryID = cat.CategoryID 
LEFT JOIN DimShipper s ON o.ShipVia = s.ShipperID  
LEFT JOIN DimSupplier sup ON p.SupplierID = sup.SupplierID
LEFT JOIN DimDate d ON o.OrderDate = d."Date";

