--NOT NULL
CREATE TABLE Users (
    UserID INT NOT NULL,
    UserName VARCHAR(100) NOT NULL
);

--UNIQUE
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Email VARCHAR(255) UNIQUE
);

--PRIMARY KEY
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255)
);

--FOREIGN KEY
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--CHECK
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    Balance DECIMAL(10,2) CHECK (Balance >= 0)
);

--DEFAULT
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    JoinDate DATE DEFAULT CURRENT_DATE
);

--Composite Keys
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID)
);

--Adding Constrains after table is created
ALTER TABLE Orders ADD CONSTRAINT chk_amount CHECK (OrderAmount > 0);

--Real-World Example
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2) CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

