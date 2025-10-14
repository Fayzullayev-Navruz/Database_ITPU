-- Test the function
SELECT CustomerID, PostalCode, classify_customer_by_postal_code(PostalCode) AS classification
FROM Customers
LIMIT 10;
