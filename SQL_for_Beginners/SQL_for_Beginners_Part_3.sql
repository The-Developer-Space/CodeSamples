--Create the Orders table
CREATE TABLE Orders (
    OrderID BIGSERIAL PRIMARY KEY,
    UserID INT,
    Product VARCHAR(50),
    Amount DECIMAL(10,2)
);

--Insert Sample Orders
INSERT INTO Orders 
    (UserID, Product, Amount) 
VALUES
((SELECT UserID FROM Users WHERE FirstName='John' AND LastName='Doe'), 'Keyboard', 50),
((SELECT UserID FROM Users WHERE FirstName='Jane' AND LastName='Smith'), 'Mouse', 30),
((SELECT UserID FROM Users WHERE FirstName='John' AND LastName='Doe'), 'Monitor', 150),
((SELECT UserID FROM Users WHERE FirstName='Bob' AND LastName='Brown'), 'Webcam', 70),
((SELECT UserID FROM Users WHERE FirstName='Olivia' AND LastName='Martin'), 'Laptop', 900),
((SELECT UserID FROM Users WHERE FirstName='James' AND LastName='King'), 'Desktop', 1200),
((SELECT UserID FROM Users WHERE FirstName='Amelia' AND LastName='Gonzalez'), 'Digicam', 200),
((SELECT UserID FROM Users WHERE FirstName='Amelia' AND LastName='Gonzalez'), 'Tripod', 30),
(NULL, 'External Drive', 100),
(NULL, 'Speaker', 50),
(NULL, 'Microphone', 25);

--INNER JOIN
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
INNER JOIN Orders ON Users.UserID = Orders.UserID;

--LEFT JOIN
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
LEFT JOIN Orders ON Users.UserID = Orders.UserID;

--RIGHT JOIN
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
RIGHT JOIN Orders ON Users.UserID = Orders.UserID;

--FULL JOIN
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
LEFT JOIN Orders ON Users.UserID = Orders.UserID
UNION
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
RIGHT JOIN Orders ON Users.UserID = Orders.UserID;

--CROSS JOIN
SELECT Users.FirstName, Users.LastName, Orders.Product, Orders.Amount
FROM Users
CROSS JOIN Orders;
