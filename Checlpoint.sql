-- CREATE DATABASE Workings


 CREATE TABLE Customers(
 Customer_ID INT PRIMARY KEY,
 Customer_Name VARCHAR(30) NOT NULL,
 Customer_Email VARCHAR(50) NOT NULL,
 Customer_Address VARCHAR(50) NOT NULL
 );
 
 INSERT INTO Customers
 VALUES
 (1, 'Alice', 'alc@gmail.com', '123 Main St.'),
 (2, 'Bob', 'bb@gmail.com', '456 Market St.'),
 (3, 'Charlie', 'crl@gmail.com', '789 Elm St.')
 SELECT * FROM Customers
 
 CREATE TABLE Products(
 Product_ID INT PRIMARY KEY,
 Product_Name VARCHAR(20) NOT NULL,
 Product_Price DECIMAL CHECK(Product_Price > 0) NOT NULL
 );
 INSERT INTO Products
 VALUES
 (1, 'Widget', '10.00'),
 (2, 'Gadget', '20.00'),
 (3, 'Doohickey', '15.00')
 SELECT * FROM Products
 
 CREATE TABLE Orders(
 Order_ID INT PRIMARY KEY,
 Order_Quantity INT NOT NULL,
 Order_Date DATE NOT NULL,
 Customer_ID INT FOREIGN KEY (Customer_ID) REFERENCES Customers,
 Product_ID INT FOREIGN KEY (Product_ID) REFERENCES Products
 );

 INSERT INTO Orders
VALUES
(1, 10, '2021-01-01', 1, 1),
(2, 5, '2021-01-02', 1, 2),
(3, 3, '2021-01-03', 2, 1),
(4, 7, '2021-01-04', 2, 2),
(5, 2, '2021-01-05', 3, 1),
(6, 3, '2021-01-06', 3, 3)
SELECT * FROM Orders

-- Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product.

SELECT Customers.Customer_Name, SUM(Products.Product_Price * Orders.Order_Quantity) As Total_Cost
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
WHERE Products.Product_Name IN ('Widget', 'Gadget')
GROUP BY Customers.Customer_ID, Customers.Customer_Name
HAVING COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Widget' THEN Orders.Product_ID END) >= 1
    AND COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Gadget'THEN Orders.Product_ID END)>=1;





-- SELECT Customers.Customer_Name, SUM(Products.Product_Price * Orders.Order_Quantity) As Total_Cost, Products.Product_Name
-- FROM Customers
-- FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
-- FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
-- WHERE Products.Product_Name IN ('Widget', 'Gadget') 
-- GROUP BY Customers.Customer_Name, Products.Product_Name 
-- HAVING COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Widget' THEN Orders.Product_ID END) >= 1
--     AND COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Gadget'THEN Orders.Product_ID END)>=1;


-- SELECT Customers.Customer_Name, Products.Product_ID, Products.Product_Price, Orders.Order_Quantity
-- FROM Orders
-- FULL OUTER JOIN Customers ON Customers.Customer_ID = Orders.Customer_ID
-- FULL OUTER JOIN Products ON Products.Product_ID = Orders.Product_ID 
-- WHERE Products.Product_Name = 'Widget' AND Orders.Order_Quantity >=1 AND Products.Product_Name = 'gadget' AND Orders.Order_Quantity >=1 

-- SELECT c.Customer_Name, 
--        SUM(o.Order_Quantity * p.Product_Price) AS Total_Cost
-- FROM Customers c
-- FULL OUTER JOIN Orders o ON c.Customer_ID = o.Customer_ID
-- FULL OUTER JOIN Products p ON o.Product_ID = p.Product_ID
-- WHERE p.Product_Name IN ('Widget', 'Gadget')
-- GROUP BY c.Customer_ID, c.Customer_Name
-- HAVING COUNT(DISTINCT CASE WHEN p.Product_Name = 'Widget' THEN o.Product_ID END) >= 1
--    AND COUNT(DISTINCT CASE WHEN p.Product_Name = 'Gadget' THEN o.Product_ID END) >= 1;


-- SELECT c.Customer_Name, 
--        COALESCE(SUM(o.Order_Quantity * p.Product_Price), 0) AS Total_Cost
-- FROM Customers c
-- FULL OUTER JOIN Orders o ON c.Customer_ID = o.Customer_ID
-- FULL OUTER JOIN Products p ON o.Product_ID = p.Product_ID
-- WHERE p.Product_Name IN ('Widget', 'Gadget')
-- GROUP BY c.Customer_ID, c.Customer_Name
-- HAVING COUNT(DISTINCT CASE WHEN p.Product_Name = 'Widget' THEN o.Product_ID END) >= 1
--    AND COUNT(DISTINCT CASE WHEN p.Product_Name = 'Gadget' THEN o.Product_ID END) >= 1;


-- Write a query to retrieve thAe names of the customers who have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer.

SELECT Customers.Customer_Name, Orders.Order_Quantity, Products.Product_Name, SUM(Products.Product_Price * Orders.Order_Quantity) As Total_Cost
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
WHERE Products.Product_Name IN ('Widget') AND Orders.Order_Quantity >= 1
GROUP BY Customers.Customer_ID, Customers.Customer_Name, Products.Product_Name, Orders.Order_Quantity
HAVING COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Widget' THEN Orders.Product_ID END) >= 1


-- Write a query to retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.

SELECT Customers.Customer_Name, Orders.Order_Quantity, Products.Product_Name, SUM(Products.Product_Price * Orders.Order_Quantity) AS Total_Cost
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID
WHERE Products.Product_Name IN ('Gadget') AND Orders.Order_Quantity >=1
GROUP BY Customers.Customer_ID, Customers.Customer_Name, Products.Product_Name, Orders.Order_Quantity
HAVING COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Gadget' THEN Orders.Product_ID END) >=1


-- Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.

SELECT Customers.Customer_Name, Orders.Order_Quantity, Products.Product_Name, SUM(Products.Product_Price * Orders.Order_Quantity) AS Total_Cost
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID
WHERE Products.Product_Name IN ('Doohickey') AND Orders.Order_Quantity >=1
GROUP BY Customers.Customer_ID, Customers.Customer_Name, Products.Product_Name, Orders.Order_Quantity
HAVING COUNT(DISTINCT CASE WHEN Products.Product_Name = 'Doohickey' THEN Orders.Product_ID END) >=1

-- Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.

SELECT Customers.Customer_Name, Products.Product_Name, SUM(Orders.Order_Quantity)AS Total_Wid_Gad, SUM(Products.Product_Price * Orders.Order_Quantity) As Total_Cost
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
WHERE Products.Product_Name IN ('Widget', 'Gadget') 
GROUP BY Customers.Customer_Name, Products.Product_Name 

-- Write a query to retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.


SELECT Products.Product_Name, SUM(Orders.Order_Quantity) AS Total_Quantity
FROM Products 
FULL OUTER JOIN Orders  ON Products.Product_ID = Orders.Product_ID
GROUP BY Products.Product_Name
HAVING SUM(Orders.Order_Quantity) > 0;

-- Write a query to retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.

-- SELECT Customers.Customer_ID, Customers.Customer_Name, Products.Product_Name, SUM(Orders.Order_Quantity) AS Total_Order
-- FROM Customers
-- FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
-- FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
-- GROUP BY Customers.Customer_ID, Customers.Customer_Name, Products.Product_Name, Orders.Order_Quantity
-- HAVING SUM(Orders.Order_Quantity) > 0
-- ORDER BY Total_Order DESC

SELECT Customers.Customer_Name, SUM(Orders.Order_Quantity) AS Total_Order
FROM Customers
FULL OUTER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
FULL OUTER JOIN Products ON Orders.Product_ID = Products.Product_ID 
GROUP BY  Customers.Customer_Name
HAVING SUM(Orders.Order_Quantity) > 0
ORDER BY Total_Order DESC



-- Write a query to retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
SELECT Products.Product_Name, SUM(Orders,Order_Quantity) AS Total_Quantity
FROM Products
FULL OUTER JOIN Customers ON Products.Product_ID = 


-- Write a query to retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.