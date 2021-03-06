-- Question 2

-- a) How many orders were shipped by Speedy Express in total?

-- There were 54 orders by Speedy Express in total. The query is given below:
SELECT COUNT(a.OrderID) FROM Orders as a 
INNER JOIN Shippers as b ON a.ShipperID = b.ShipperID
WHERE b.ShipperName = 'Speedy Express'

-- For this query, we count the Order ID to determine how many orders there are since it is the primary key in the Orders table. 
-- This will thus count the unique number of columns per Shipper. We use the Shipper ID to distinguish between the shippers as this 
-- is the primary key in the Shippers table. This is preferred over Shipper Name in case there are duplicate names in the database. 
-- Then, we check where the Shipper Name is Speedy Express, as required.

-- b) What is the last name of the employee with the most orders?

-- The last name of the employee with the most orders is Peacock . The query is given below:

SELECT  a.LastName, COUNT(*) FROM Employees AS a INNER JOIN Orders AS b on a.EmployeeID = b.EmployeeID
GROUP BY a.EmployeeID
ORDER BY COUNT(*) DESC
LIMIT 1 

-- For this query, we want the last name so we look at the last names and the number of orders per customer. This is grouped by the 
-- employee ID to avoid any duplicate cases of people with the same last name. Lastly, it is limited to the top customer after ordering
-- by the count column in descending order. 

-- c) What product was ordered the most by customers in Germany?

-- The product that was ordered the most by customers in Germany is Gorgonzolo Telino. The query is given below: 

SELECT d.ProductName, COUNT(*) FROM Customers AS a 
INNER JOIN ORDERS as b ON a.CustomerID = b.CustomerID
INNER JOIN OrderDetails as c ON b.OrderID = c.OrderID
INNER JOIN Products as d ON c.ProductID = d.ProductID

WHERE a.Country = 'Germany'
GROUP BY c.ProductID
ORDER BY COUNT(*) DESC
LIMIT 1 

-- For this query, we want the product name and the count which is the number of times that it was ordered. We take the subset of the 
-- data where the country is Germany, group by Product ID so that the unique products are being considered. Then, it is ordered by the 
-- count in descending order and limited to one so the top product is shown. 

