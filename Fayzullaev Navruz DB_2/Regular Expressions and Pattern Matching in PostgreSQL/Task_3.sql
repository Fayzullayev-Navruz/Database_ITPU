-- Exercise 3: Classify Customers Based on Postal Codes
CREATE OR REPLACE FUNCTION classify_customer_by_postal_code(postal_code VARCHAR)
RETURNS VARCHAR AS $$
BEGIN
    IF postal_code ~ '^\d{5}$' THEN
        RETURN 'Local';
    ELSIF postal_code ~ '^\d{3}-\d{3}$' THEN
        RETURN 'National';
    ELSE
        RETURN 'International';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Invalid';
END;
$$ LANGUAGE plpgsql;
