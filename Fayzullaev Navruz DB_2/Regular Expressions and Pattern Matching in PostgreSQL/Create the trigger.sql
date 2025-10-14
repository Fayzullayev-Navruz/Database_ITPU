-- Create the trigger
DROP TRIGGER IF EXISTS trg_validate_product_name ON Products;
CREATE TRIGGER trg_validate_product_name
BEFORE INSERT ON Products
FOR EACH ROW
EXECUTE FUNCTION validate_product_name();
