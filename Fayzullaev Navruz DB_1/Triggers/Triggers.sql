-- Trigger to log price updates in the Products table
-- Step 1: Create the log table
DROP TABLE IF EXISTS price_update_log;

CREATE TABLE price_update_log (
    log_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    old_price NUMERIC(10, 2),
    new_price NUMERIC(10, 2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the trigger function
CREATE OR REPLACE FUNCTION log_price_update_func()
RETURNS TRIGGER AS $$
BEGIN
    -- Only log if the price has changed
    IF NEW.UnitPrice IS DISTINCT FROM OLD.UnitPrice THEN
        INSERT INTO price_update_log (product_id, old_price, new_price)
        VALUES (OLD.ProductID, OLD.UnitPrice, NEW.UnitPrice);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 3: Create the trigger on the Products table
DROP TRIGGER IF EXISTS log_price_update ON Products;

CREATE TRIGGER log_price_update
AFTER UPDATE ON Products
FOR EACH ROW
WHEN (OLD.UnitPrice IS DISTINCT FROM NEW.UnitPrice)
EXECUTE FUNCTION log_price_update_func();

-- Step 4: Test the trigger by updating a product's price
-- This should create a log entry if the price changes
UPDATE Products
SET UnitPrice = UnitPrice + 1
WHERE ProductID = 11;

-- Step 5: Verify the log entry
SELECT * FROM price_update_log WHERE product_id = 11;