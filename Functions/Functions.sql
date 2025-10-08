-- Function to calculate the total amount of an order

CREATE OR REPLACE FUNCTION calculate_order_total(order_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC := 0;
BEGIN
    SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))
    INTO total
    FROM "Order Details" od
    WHERE od.OrderID = order_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;
