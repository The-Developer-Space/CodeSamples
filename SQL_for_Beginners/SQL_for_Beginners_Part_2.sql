--Drop the table and recreate it with additional columns
DROP TABLE Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    State VARCHAR(5),
    PhoneNumber VARCHAR(20),
    SignUpDate DATE,
    IsActive BOOLEAN,
    AccountBalance DECIMAL(10,2),
    MembershipLevel VARCHAR(20)
);

--Delete all rows from the table
DELETE FROM Users;

--Insert new values
INSERT INTO Users 
(FirstName, LastName, Age, Email, City, State, PhoneNumber, SignUpDate, IsActive, AccountBalance, MembershipLevel, CreatedAt) 
VALUES
('John', 'Doe', 30, 'john.doe@example.com', 'New York', 'NY', '+1888412374', '2024-12-15', TRUE, 150.75, 'Gold', CURRENT_TIMESTAMP),
('Jane', 'Smith', 25, 'jane.smith@example.com', 'Los Angeles', 'CA', '+1222111432', '2024-11-20', TRUE, 200.50, 'Silver', CURRENT_TIMESTAMP),
('Alice', 'Johnson', 28, 'alice.johnson@example.com', 'Dallas', 'TX', '+1333098345', '2025-01-10', TRUE, 89.00, 'Bronze', CURRENT_TIMESTAMP),
('Bob', 'Brown', 35, 'bob.brown@example.com', 'Dallas', 'TX', '+1999810923', '2023-09-05', FALSE, 0.00, 'Free', CURRENT_TIMESTAMP),
('Emily', 'Davis', 22, 'emily.davis@example.com', 'Chicago', 'IL', '+1444555123', '2025-02-18', TRUE, 305.99, 'Gold', CURRENT_TIMESTAMP),
('Michael', 'Miller', 40, 'michael.miller@example.com', 'Seattle', 'WA', '+1555666789', '2023-12-01', FALSE, 120.00, 'Silver', CURRENT_TIMESTAMP),
('Sarah', 'Wilson', 31, 'sarah.wilson@example.com', 'Boston', 'MA', '+1666777432', '2024-10-10', TRUE, 75.50, 'Bronze', CURRENT_TIMESTAMP),
('David', 'Moore', 29, 'david.moore@example.com', 'Austin', 'TX', '+1777888999', '2025-03-01', TRUE, 650.00, 'Platinum', CURRENT_TIMESTAMP),
('Laura', 'Taylor', 27, 'laura.taylor@example.com', 'San Francisco', 'CA', '+1888999001', '2023-11-25', FALSE, 0.00, 'Free', CURRENT_TIMESTAMP),
('Daniel', 'Anderson', 33, 'daniel.anderson@example.com', 'Miami', 'FL', '+1999000111', '2024-05-14', TRUE, 480.00, 'Gold', CURRENT_TIMESTAMP),
('Olivia', 'Martin', 26, 'olivia.martin@example.com', 'Houston', 'TX', '+1234567890', '2025-01-05', TRUE, 350.25, 'Gold', CURRENT_TIMESTAMP),
('Ethan', 'Clark', 38, 'ethan.clark@example.com', 'Denver', 'CO', '+1987654321', '2023-06-22', FALSE, 45.00, 'Bronze', CURRENT_TIMESTAMP),
('Chloe', 'Lewis', 24, 'chloe.lewis@example.com', 'Atlanta', 'GA', '+1321654987', '2024-07-19', TRUE, 95.50, 'Silver', CURRENT_TIMESTAMP),
('Liam', 'Walker', 32, 'liam.walker@example.com', 'Portland', 'OR', '+1415098765', '2025-02-03', TRUE, 540.90, 'Platinum', CURRENT_TIMESTAMP),
('Sophia', 'Hall', 30, 'sophia.hall@example.com', 'San Diego', 'CA', '+1765432987', '2024-09-08', TRUE, 230.75, 'Gold', CURRENT_TIMESTAMP),
('Noah', 'Allen', 36, 'noah.allen@example.com', 'Orlando', 'FL', '+1212121212', '2023-08-15', FALSE, 0.00, 'Free', CURRENT_TIMESTAMP),
('Ava', 'Young', 21, 'ava.young@example.com', 'Phoenix', 'AZ', '+1432543321', '2024-05-01', TRUE, 150.00, 'Silver', CURRENT_TIMESTAMP),
('James', 'King', 45, 'james.king@example.com', 'Philadelphia', 'PA', '+1345983210', '2024-03-22', TRUE, 500.00, 'Gold', CURRENT_TIMESTAMP),
('Isabella', 'Wright', 27, 'isabella.wright@example.com', 'Austin', 'TX', '+1789456321', '2025-01-28', TRUE, 625.00, 'Platinum', CURRENT_TIMESTAMP),
('Lucas', 'Scott', 29, 'lucas.scott@example.com', 'Dallas', 'TX', '+1231231234', '2024-10-30', TRUE, 275.00, 'Silver', CURRENT_TIMESTAMP),
('Mia', 'Green', 23, 'mia.green@example.com', 'Charlotte', 'NC', '+1456743210', '2023-12-12', TRUE, 80.00, 'Bronze', CURRENT_TIMESTAMP),
('Alexander', 'Baker', 34, 'alex.baker@example.com', 'Nashville', 'TN', '+1999888777', '2024-08-18', TRUE, 130.00, 'Silver', CURRENT_TIMESTAMP),
('Amelia', 'Gonzalez', 39, 'amelia.gonzalez@example.com', 'Columbus', 'OH', '+1888000999', '2023-07-01', FALSE, 0.00, 'Free', CURRENT_TIMESTAMP),
('Henry', 'Nelson', 31, 'henry.nelson@example.com', 'Salt Lake City', 'UT', '+1222333444', '2025-03-11', TRUE, 410.25, 'Gold', CURRENT_TIMESTAMP),
('Grace', 'Carter', 28, 'grace.carter@example.com', 'Indianapolis', 'IN', '+1555444333', '2024-11-03', TRUE, 215.40, 'Silver', CURRENT_TIMESTAMP);

-- Finding Users from Texas
SELECT FirstName, LastName 
FROM Users 
WHERE State = 'TX';

-- Finding Users with Names Starting with "J"
SELECT FirstName, LastName 
FROM Users 
WHERE FirstName LIKE 'J%';

-- Finding Users with specific Email domain
SELECT * FROM Users
WHERE Email LIKE '%@example.com';

-- Sorting Users by Age in Ascending Order
SELECT FirstName, LastName, Age 
FROM Users 
ORDER BY Age ASC;

-- Sorting Users by Last Name in Descending Order
SELECT FirstName, LastName 
FROM Users 
ORDER BY LastName DESC;

-- Sorting Users by State in Ascending order and then by City in Descending Order
SELECT FirstName, LastName, City, State
FROM Users 
ORDER BY State ASC, City DESC;

-- Calculating the Average, Minimum and Maximum Age of Users
SELECT AVG(Age) AS AverageAge, MIN(Age) AS MinimumAge, MAX(Age) AS MaximumAge 
FROM Users;

-- Counting the number of users in each age group
SELECT Age, COUNT(*) AS UserCount 
FROM Users 
GROUP BY Age;

-- Finding the average age in each state
SELECT State, AVG(Age) AS AverageAge
FROM Users
GROUP BY State;

-- Finding the number of users in each membership level
SELECT MembershipLevel, COUNT(*) AS UserCount
FROM Users
GROUP BY MembershipLevel;

-- Finding membership levels with more than 5 users 
SELECT MembershipLevel, COUNT(*) AS UserCount
FROM Users
GROUP BY MembershipLevel
HAVING COUNT(*) > 5;

-- Finding users aged between 25 and 30
SELECT FirstName, LastName, Age 
FROM Users 
WHERE Age >= 25 AND Age <= 30;

SELECT FirstName, LastName, Age 
FROM Users 
WHERE Age BETWEEN 25 AND 30;

-- Finding users named "John" or "Jane"
SELECT FirstName, LastName 
FROM Users 
WHERE FirstName = 'John' OR FirstName = 'Jane';

-- Example of a complex condition
SELECT FirstName, LastName, Age
FROM Users 
WHERE (FirstName = 'John' OR FirstName = 'Jane')
    AND NOT (LastName = 'Adams')
    AND (State = 'TX' OR State = 'NY')
    AND (Age BETWEEN 20 AND 30) ;

-- Retrieving the first 5 users (MySQL, PostgreSQL)
SELECT FirstName, LastName 
FROM Users 
LIMIT 5;

-- Retrieving the first 5 users (Microsoft SQL Server)
SELECT TOP 5 FirstName, LastName 
FROM Users;
