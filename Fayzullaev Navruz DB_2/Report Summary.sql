Report Summary
==============

Exercise 1:
Used a regular expression to detect non-ASCII characters in the Homepage field of the Suppliers table.

Exercise 2:
Used REGEXP_REPLACE to strip non-digits, pad to 10 digits, and format phone numbers as (XXX) XXX-XXXX.

Exercise 3:
Created a pgSQL function to classify postal codes using regex patterns. Includes error handling for invalid inputs.

Exercise 4:
Created a trigger function to validate that product names start with an uppercase letter and are at least five characters long. Raises an exception if validation fails.

Test Cases:
- Exercise 1: Verified with sample data containing accented characters.
- Exercise 2: Tested with various phone number lengths.
- Exercise 3: Tested with postal codes like '12345', '123-456', and 'ABC123'.
- Exercise 4: Inserted valid and invalid product names to confirm trigger behavior.
