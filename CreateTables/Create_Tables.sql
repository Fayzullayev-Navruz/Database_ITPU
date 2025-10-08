-- Sample data for testing
-- Insert products
INSERT INTO Products (ProductID, ProductName, UnitPrice, UnitsInStock) VALUES
(11, 'Queso Cabrales', 21.00, 22),
(12, 'Queso Manchego La Pastora', 38.00, 86);

-- Insert orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(5, 'ALFKI', '2023-01-10'),
(6, 'ANATR', '2023-01-11');

-- Insert order details
INSERT INTO "Order Details" (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(5, 11, 21.00, 5, 0.1),
(5, 12, 38.00, 2, 0.0),
(6, 11, 21.00, 3, 0.05);
