-- Exercise 1: Identify Email Addresses in Contacts with Nonstandard Latin Symbols
SELECT *
FROM Suppliers
WHERE Homepage ~ '[^ -]';
