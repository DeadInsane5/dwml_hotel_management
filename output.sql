-- ============================================================
-- HOTEL MANAGEMENT SYSTEM - ANALYTICAL QUERIES
-- ============================================================


-- Display Data
SELECT * from Customer;
SELECT * from Room;
SELECT * from Date_Dim;
SELECT * from Payment;
SELECT * from Employee;
SELECT * from Location;
SELECT * from Room_Details;
SELECT * from Booking_Fact;

-- Query 1: Filter female customers residing in New York by joining Customer with Location
SELECT 
    C.Customer_ID, 
    C.Customer_Name, 
    C.Mobile_Number, 
    L.City
FROM Customer C
JOIN Location L ON C.Location_ID = L.Location_ID
WHERE C.Gender = 'Female' 
  AND L.City = 'New York';

-- Query 2: Retrieve high-value rooms costing over $200.00/night by joining Room with Room_Details
SELECT 
    R.Room_ID, 
    R.Room_Number, 
    RD.Room_Type, 
    RD.Price_Per_Night
FROM Room R
JOIN Room_Details RD ON R.Room_Details_ID = RD.Room_Details_ID
WHERE RD.Price_Per_Night > 200.00;

-- Query 3: Retrieve payment records processed via digital or card payment channels
SELECT 
    Payment_ID, 
    Payment_Mode, 
    Payment_Status, 
    Payment_Date
FROM Payment
WHERE Payment_Mode IN ('UPI/Online', 'Credit Card');

-- Query 4: List contact details for all staff working in the Reception department
SELECT 
    Employee_ID, 
    Employee_Name, 
    Designation, 
    Contact_Number
FROM Employee
WHERE Department = 'Reception';

-- Query 5: Aggregate total revenue and booking counts by room type using Room_Details
SELECT 
    RD.Room_Type, 
    SUM(B.Total_Amount) AS Total_Revenue, 
    COUNT(B.Booking_ID) AS Total_Bookings
FROM Booking_Fact B
JOIN Room R ON B.Room_ID = R.Room_ID
JOIN Room_Details RD ON R.Room_Details_ID = RD.Room_Details_ID
GROUP BY RD.Room_Type
ORDER BY Total_Revenue DESC;