

-- Question 1: Achieving 1NF
-- Split the Products column into individual rows
SELECT 
  OrderID, 
  CustomerName, 
  TRIM(value) AS Product
FROM 
  ProductDetail
CROSS APPLY 
  STRING_SPLIT(Products, ',');

-- Question 2: Achieving 2NF
-- Remove partial dependency by creating separate tables

-- Create Orders table
SELECT DISTINCT OrderID, CustomerName 
INTO Orders 
FROM OrderDetails;

-- Create OrderItems table
SELECT OrderID, Product, Quantity 
INTO OrderItems 
FROM OrderDetails;
