--NOT NULL
CREATE TABLE Users (
    UserID INT NOT NULL,
    UserName VARCHAR(100) NOT NULL
);

--UNIQUE
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SKU VARCHAR(255) CONSTRAINT UQ_Products_SKU UNIQUE
);

--PRIMARY KEY
CREATE TABLE Products (
    ProductID INT CONSTRAINT PK_Products PRIMARY KEY,
    ProductName VARCHAR(255)
);

--FOREIGN KEY
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--CHECK
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2) CONSTRAINT CHK_Products_Price CHECK (Price > 0),
    DiscountedPrice DECIMAL(10, 2) CONSTRAINT CHK_Products_DiscountedPrice CHECK (DiscountedPrice > 0),
    CONSTRAINT CHK_Products_Price_gt_DiscountedPrice CHECK (Price > DiscountedPrice)
);

--DEFAULT
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE CONSTRAINT DF_Orders_OrderDate DEFAULT CURRENT_DATE
);

--Composite Keys
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
);

--Adding Constrains after table is created
-- Create the constrain without checking existing data
ALTER TABLE Orders ADD CONSTRAINT CHK_Orders_Amount CHECK (Amount > 0);
--Throws 23514: check constraint "chk_orders_amount" of relation "orders" is violated by some row

-- Create the constraint without checking existing data
ALTER TABLE Orders ADD CONSTRAINT CHK_Orders_Amount CHECK (Amount > 0) NOT VALID;

--Validate constraint
ALTER TABLE Orders VALIDATE CONSTRAINT CHK_Orders_Amount;


--Real-World Example
CREATE TABLE Customers (
    CustomerID INT CONSTRAINT PK_Customers PRIMARY KEY,
    Email VARCHAR(100) CONSTRAINT UQ_Products_Email UNIQUE NOT NULL
);

CREATE TABLE Products (
    ProductID INT CONSTRAINT PK_Products PRIMARY KEY,
    Price DECIMAL(10, 2) CONSTRAINT CHK_Products_Price CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID INT CONSTRAINT PK_Orders PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE CONSTRAINT DF_Orders_OrderDate DEFAULT CURRENT_DATE,
    CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Constraint violation example
INSERT INTO Customers (CustomerID, Email)
VALUES (1, 'john.doe@example.com');
INSERT INTO Customers (CustomerID, Email)
VALUES (2, 'john.doe@example.com');

-- Disable the constraint 
ALTER TABLE Orders DISABLE CONSTRAINT CHK_Orders_Amount;

--Insert data that violate the constraint
INSERT INTO Orders (....) VALUES (.....)

--Enable the constraint
ALTER TABLE Orders ENABLE CONSTRAINT CHK_Orders_Amount;

-- Drop the constraint 
ALTER TABLE Orders DROP CONSTRAINT CHK_Orders_Amount;
