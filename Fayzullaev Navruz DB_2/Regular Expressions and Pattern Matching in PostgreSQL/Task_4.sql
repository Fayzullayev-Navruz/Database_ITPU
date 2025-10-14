-- Exercise 4: Create a Trigger to Validate the Names of New Products
CREATE OR REPLACE FUNCTION validate_product_name()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ProductName !~ '^[A-Z].{4,}$' THEN
        RAISE EXCEPTION 'Product name must start with an uppercase letter and be at least five characters long.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
