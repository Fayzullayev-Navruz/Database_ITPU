-- Procedure to update UnitsInStock for a given product

CREATE OR REPLACE PROCEDURE update_stock(product_id INT, quantity INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Products
    SET UnitsInStock = UnitsInStock + quantity
    WHERE ProductID = product_id;
END;
$$;

-- Test the procedure by updating stock for product ID 11
CALL update_stock(11, 10);
