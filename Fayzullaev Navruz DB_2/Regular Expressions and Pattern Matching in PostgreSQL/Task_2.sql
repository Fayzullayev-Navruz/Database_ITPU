-- Exercise 2: Format Phone Numbers in a Standard Format
SELECT CustomerID,
       REGEXP_REPLACE(
           LPAD(REGEXP_REPLACE(Phone, '\D', '', 'g'), 10, '0'),
           '(\d{3})(\d{3})(\d{4})',
           '() - '
       ) AS formatted_phone
FROM Customers
LIMIT 10;

