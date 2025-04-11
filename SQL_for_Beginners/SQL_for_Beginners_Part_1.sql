--Create a new Database
CREATE DATABASE BeginnerSQL;

--Switch to the database
USE BeginnerSQL;

-- Create a table
CREATE TABLE Users (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    Age INT CHECK (age > 0),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Add a new column  
ALTER TABLE Users
ADD PhoneNumber VARCHAR(20) NULL;

-- Drop the newly added column
ALTER TABLE Users
DROP COLUMN PhoneNumber;

--Drop a table
DROP TABLE Users;

--Insert data into the table
INSERT INTO Users (FirstName, LastName, Age, Email) VALUES
('John', 'Doe', 30, 'john.doe@example.com'),
('Jane', 'Smith', 25, 'jane.smith@example.com'),
('Alice', 'Johnson', 28, 'alice.johnson@example.com'),
('Bob', 'Brown', 35, 'bob.brown@example.com');

--Select all rows from a table
SELECT * FROM Users;

--Update data in a table
UPDATE Users 
SET Age = 42 
WHERE FirstName = 'David';

--Delete rows in a table
DELETE FROM Users 
WHERE FirstName = 'David';

--Select Commands
SELECT FirstName, LastName, Age 
FROM Users;

SELECT * 
FROM Users 
WHERE Age >= 30;

SELECT * 
FROM Users 
WHERE Age >= 30 
  AND FirstName = 'Bob';

SELECT * 
FROM Users 
ORDER BY Age ASC;
