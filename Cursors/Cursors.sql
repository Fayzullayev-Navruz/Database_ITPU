-- Use a cursor to iterate through orders and calculate totals
DO $$
DECLARE
    order_rec RECORD;
    order_total NUMERIC;
    order_cursor CURSOR FOR SELECT OrderID FROM Orders WHERE OrderID <= 20;
BEGIN
    OPEN order_cursor;
    LOOP
        FETCH order_cursor INTO order_rec;
        EXIT WHEN NOT FOUND;

        order_total := calculate_order_total(order_rec.OrderID);
        RAISE NOTICE 'Order ID: %, Total: %', order_rec.OrderID, order_total;
    END LOOP;
    CLOSE order_cursor;
END;
$$;
