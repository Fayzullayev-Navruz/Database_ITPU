-- Indexes to speed up queries on frequently filtered columns
CREATE INDEX idx_factsales_dateid ON FactSales(DateID);
CREATE INDEX idx_factsales_productid ON FactSales(ProductID);
CREATE INDEX idx_factsales_customerid ON FactSales(CustomerID);