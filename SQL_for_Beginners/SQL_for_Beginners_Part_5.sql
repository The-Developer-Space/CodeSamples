--Create View
CREATE VIEW ActiveUsers AS
SELECT UserID, FirstName, LastName, Email
FROM Users
WHERE IsActive = TRUE;

--Query the View:
SELECT * FROM ActiveUsers;

--Creating a view from more than one table
CREATE VIEW UserOrderSummary AS
SELECT U.UserID, U.FirstName, U.LastName, COUNT(O.OrderID) AS OrderCount, SUM(O.Amount) AS OrderTotal
FROM Users U
INNER JOIN Orders O ON U.UserID = O.UserID
GROUP BY U.UserID, U.FirstName, U.LastName;

--Query the View
SELECT * FROM UserOrderSummary;

--Creating a view from other views
CREATE VIEW ActiveUserOrderSummary AS
SELECT U.UserID, U.FirstName, U.LastName, COUNT(O.OrderID) AS OrderCount, SUM(O.Amount) AS OrderTotal
FROM ActiveUsers U
INNER JOIN Orders O ON U.UserID = O.UserID
GROUP BY U.UserID, U.FirstName, U.LastName;

--Query the view
SELECT * FROM ActiveUserOrderSummary;

--Altering Views
CREATE OR REPLACE VIEW ActiveUsers AS
SELECT UserID, FirstName, LastName, Email, PhoneNumber
FROM Users
WHERE IsActive = TRUE;

--Deleting Views
DROP VIEW ActiveUsers;

--Materialized Views
CREATE MATERIALIZED VIEW UserSummary AS
SELECT UserID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY UserID;

--Refreshing Materialized Views
REFRESH MATERIALIZED VIEW UserSummary;
