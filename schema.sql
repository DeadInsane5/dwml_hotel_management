-- ============================================================
-- SCHEMA SETUP
-- ============================================================

-- ------------------------------------------------------------
-- Hotel Management Database
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS Hotel_Management;
USE Hotel_Management;

-- ------------------------------------------------------------
-- Sub-Dimension: Location (Extracted from Customer)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Location (
    Location_ID     INT PRIMARY KEY,
    City            VARCHAR(50),
    State           VARCHAR(50),
    Country         VARCHAR(50)
);

-- ------------------------------------------------------------
-- Sub-Dimension: Room_Details (Extracted from Room)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Room_Details (
    Room_Details_ID INT PRIMARY KEY,
    Room_Type       VARCHAR(50),
    Capacity        INT,
    Price_Per_Night DECIMAL(10, 2)
);

-- ------------------------------------------------------------
-- Dimension: Customer (Normalized)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID     INT PRIMARY KEY,
    Customer_Name   VARCHAR(100) NOT NULL,
    Gender          VARCHAR(10),
    DOB             DATE,
    Mobile_Number   VARCHAR(20),
    Location_ID     INT,
    
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

-- ------------------------------------------------------------
-- Dimension: Room (Normalized)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Room (
    Room_ID         INT PRIMARY KEY,
    Room_Number     VARCHAR(20) NOT NULL,
    Room_Details_ID INT,
    
    FOREIGN KEY (Room_Details_ID) REFERENCES Room_Details(Room_Details_ID)
);

-- ------------------------------------------------------------
-- Dimension: Date
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Date_Dim (
    Date_ID         INT PRIMARY KEY,
    Date            DATE NOT NULL,
    Day             INT,
    Month           INT,
    Year            INT
);

-- ------------------------------------------------------------
-- Dimension: Payment
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Payment (
    Payment_ID      INT PRIMARY KEY,
    Payment_Mode    VARCHAR(50),
    Payment_Status  VARCHAR(50),
    Payment_Date    DATE
);

-- ------------------------------------------------------------
-- Dimension: Employee
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Employee (
    Employee_ID     INT PRIMARY KEY,
    Employee_Name   VARCHAR(100) NOT NULL,
    Designation     VARCHAR(50),
    Department      VARCHAR(50),
    Contact_Number  VARCHAR(20)
);

-- ------------------------------------------------------------
-- Fact TABLE IF NOT EXISTS: Booking_Fact
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Booking_Fact (
    Booking_ID     INT PRIMARY KEY,
    Customer_ID    INT NOT NULL,
    Room_ID        INT NOT NULL,
    Date_ID        INT NOT NULL,
    Payment_ID     INT NOT NULL,
    Employee_ID    INT NOT NULL,
    Number_of_Days INT,
    Total_Amount   DECIMAL(10, 2),
    
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Room_ID)     REFERENCES Room(Room_ID),
    FOREIGN KEY (Date_ID)     REFERENCES Date_Dim(Date_ID),
    FOREIGN KEY (Payment_ID)  REFERENCES Payment(Payment_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);