--Find users who have placed at least one order.
SELECT name FROM Users
WHERE UserID IN (SELECT UserID FROM Orders);

--Get each user's name and the number of orders they have placed.
SELECT FirstName, LastName,
       (SELECT COUNT(*) FROM Orders WHERE Orders.UserID = Users.UserID) AS order_count
FROM Users;

--List users with more than 2 orders.
SELECT FirstName, LastName, order_count FROM (
    SELECT Users.FirstName, Users.LastName, COUNT(Orders.OrderID) AS order_count
    FROM Users
    JOIN Orders ON Users.UserID = Orders.UserID
    GROUP BY Users.name
) AS UserOrders
WHERE order_count > 2;

--Find users who have placed at least one order
--using IN
SELECT FirstName, LastName FROM Users 
WHERE UserID IN (SELECT UserID FROM Orders);

--using EXISTS
SELECT FirstName, LastName FROM Users U 
WHERE EXISTS (
  	SELECT 1 FROM Orders O WHERE O.UserID = U.UserID 
);

--Subqueries with EXISTS
SELECT FirstName, LastName FROM Users U 
WHERE EXISTS (
  	SELECT 1 FROM Orders O WHERE O.UserID = U.UserID 
);

--Find users who haven’t placed any orders:
--using NOT IN
SELECT FirstName, LastName FROM Users
WHERE UserID NOT IN (SELECT UserID FROM Orders);

--using NOT EXISTS
ELECT FirstName, LastName FROM Users U 
WHERE NOT EXISTS (
  	SELECT 1 FROM Orders O WHERE O.UserID = U.UserID 
);

--JOINS
SELECT Users.FirstName, Users.LastName, COUNT(Orders.OrderID) AS order_count
FROM Users
LEFT JOIN Orders ON Users.UserID = Orders.UserID
GROUP BY Users.FirstName, Users.LastName;

--Subquery
SELECT FirstName, LastName
       (SELECT COUNT(*) FROM Orders WHERE Orders.UserID = Users.UserID) AS order_count
FROM Users;

--Users With Above-Average Orders
SELECT FirstName, LastName 
FROM Users U
WHERE 
	(SELECT COUNT(*) FROM Orders O WHERE O.UserID = O.UserID) 
    > 
    (SELECT AVG(order_count) FROM (
            SELECT UserID, COUNT(*) AS order_count
            FROM Orders
            GROUP BY UserID) 
     AS UserOrderCounts
);
