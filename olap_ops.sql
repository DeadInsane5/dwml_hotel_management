-- ============================================================
-- HOTEL MANAGEMENT SYSTEM - OLAP OPERATIONS
-- ============================================================

-- 1. ROLL-UP (Aggregating data to a higher hierarchy: Month to Year)
-- Total revenue and total days booked aggregated per year across all bookings
SELECT 
    D.Year, 
    SUM(B.Total_Amount) AS Total_Revenue,
    SUM(B.Number_of_Days) AS Total_Nights_Booked
FROM Booking_Fact B
JOIN Date_Dim D ON B.Date_ID = D.Date_ID
GROUP BY D.Year;


-- 2. DRILL-DOWN (Navigating to lower-level details: Year down to Month)
-- Total revenue and booking counts broken down by month for the year 2026
SELECT 
    D.Month, 
    SUM(B.Total_Amount) AS Monthly_Revenue,
    COUNT(B.Booking_ID) AS Total_Bookings
FROM Booking_Fact B
JOIN Date_Dim D ON B.Date_ID = D.Date_ID
WHERE D.Year = 2026
GROUP BY D.Month
ORDER BY D.Month;


-- 3. SLICING (Selecting a single dimension value: Filtering specifically for 'Credit Card' payments)
-- Total amount generated per customer sliced strictly by Credit Card payments
SELECT 
    C.Customer_Name, 
    SUM(B.Total_Amount) AS Total_Credit_Card_Spent
FROM Booking_Fact B
JOIN Customer C ON B.Customer_ID = C.Customer_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
WHERE P.Payment_Mode = 'Credit Card'
GROUP BY C.Customer_Name;


-- 4. DICING (Selecting a sub-cube by applying conditions across multiple dimensions)
-- Filter bookings for female customers from New York staying 2 or more days in Q1 2026
SELECT 
    C.Customer_Name, 
    RD.Room_Type, 
    D.Date, 
    B.Number_of_Days, 
    B.Total_Amount
FROM Booking_Fact B
JOIN Customer C ON B.Customer_ID = C.Customer_ID
JOIN Location L ON C.Location_ID = L.Location_ID
JOIN Room R ON B.Room_ID = R.Room_ID
JOIN Room_Details RD ON R.Room_Details_ID = RD.Room_Details_ID
JOIN Date_Dim D ON B.Date_ID = D.Date_ID
WHERE C.Gender = 'Female'
  AND L.City = 'New York'
  AND D.Month BETWEEN 1 AND 3
  AND B.Number_of_Days >= 2;


-- 5. PIVOT (Cross-tabulation: Rotating customer gender across payment modes)
-- Total revenue generated per payment mode pivoted by customer gender
SELECT 
    P.Payment_Mode,
    SUM(CASE WHEN C.Gender = 'Male' THEN B.Total_Amount ELSE 0 END) AS Male_Revenue,
    SUM(CASE WHEN C.Gender = 'Female' THEN B.Total_Amount ELSE 0 END) AS Female_Revenue
FROM Booking_Fact B
JOIN Customer C ON B.Customer_ID = C.Customer_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
GROUP BY P.Payment_Mode;
