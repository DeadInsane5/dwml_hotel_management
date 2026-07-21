-- ============================================================
-- POPULATE DATA
-- ============================================================

-- ------------------------------------------------------------
-- 1. SUB-DIMENSION TABLES
-- ------------------------------------------------------------

-- Location Sub-Dimension
INSERT INTO Location (Location_ID, City, State, Country) VALUES
(1, 'New York', 'New York', 'USA'),
(2, 'Los Angeles', 'California', 'USA'),
(3, 'Chicago', 'Illinois', 'USA'),
(4, 'Houston', 'Texas', 'USA'),
(5, 'Phoenix', 'Arizona', 'USA'),
(6, 'Philadelphia', 'Pennsylvania', 'USA'),
(7, 'San Antonio', 'Texas', 'USA'),
(8, 'San Diego', 'California', 'USA'),
(9, 'Dallas', 'Texas', 'USA'),
(10, 'San Jose', 'California', 'USA'),
(11, 'Austin', 'Texas', 'USA'),
(12, 'Jacksonville', 'Florida', 'USA'),
(13, 'Fort Worth', 'Texas', 'USA'),
(14, 'Columbus', 'Ohio', 'USA'),
(15, 'Charlotte', 'North Carolina', 'USA'),
(16, 'San Francisco', 'California', 'USA'),
(17, 'Indianapolis', 'Indiana', 'USA'),
(18, 'Seattle', 'Washington', 'USA'),
(19, 'Denver', 'Colorado', 'USA'),
(20, 'Washington', 'District of Columbia', 'USA');

-- Room_Details Sub-Dimension
INSERT INTO Room_Details (Room_Details_ID, Room_Type, Capacity, Price_Per_Night) VALUES
(1, 'Single Standard (Low Tier)', 1, 80.00),
(2, 'Single Standard (Mid Tier)', 1, 85.00),
(3, 'Single Standard (High Tier)', 1, 90.00),
(4, 'Double Deluxe (Standard)', 2, 140.00),
(5, 'Double Deluxe (City View)', 2, 150.00),
(6, 'Double Deluxe (Ocean View)', 2, 160.00),
(7, 'Junior Suite (Low Floor)', 2, 200.00),
(8, 'Junior Suite (Mid Floor)', 2, 210.00),
(9, 'Junior Suite (High Floor)', 2, 220.00),
(10, 'Family Suite (Basic)', 4, 250.00),
(11, 'Family Suite (Deluxe)', 5, 280.00),
(12, 'Family Suite (Premium)', 4, 290.00),
(13, 'Executive Suite (Basic)', 3, 350.00),
(14, 'Executive Suite (Deluxe)', 3, 370.00),
(15, 'Presidential Suite (Standard)', 4, 600.00),
(16, 'Presidential Suite (VIP)', 4, 650.00),
(17, 'Penthouse Suite', 6, 1000.00),
(18, 'Economy Single', 1, 60.00),
(19, 'Economy Double', 2, 100.00),
(20, 'Accessible Suite', 2, 180.00);

-- ------------------------------------------------------------
-- 2. PRIMARY DIMENSION TABLES
-- ------------------------------------------------------------

-- Customer (Uses Location_ID instead of City)
INSERT INTO Customer (Customer_ID, Customer_Name, Gender, DOB, Mobile_Number, Location_ID) VALUES
(101, 'Alice Smith', 'Female', '1990-05-12', '555-0101', 1),
(102, 'Bob Jones', 'Male', '1985-08-22', '555-0102', 2),
(103, 'Charlie Brown', 'Male', '1992-11-03', '555-0103', 3),
(104, 'Diana Prince', 'Female', '1988-02-14', '555-0104', 4),
(105, 'Evan Wright', 'Male', '1995-07-19', '555-0105', 5),
(106, 'Fiona Gallagher', 'Female', '1993-09-30', '555-0106', 6),
(107, 'George Clark', 'Male', '1980-12-05', '555-0107', 7),
(108, 'Hannah Abbott', 'Female', '1997-04-18', '555-0108', 8),
(109, 'Ian Malcolm', 'Male', '1975-06-25', '555-0109', 9),
(110, 'Julia Roberts', 'Female', '1983-01-11', '555-0110', 10),
(111, 'Kevin Bacon', 'Male', '1978-03-29', '555-0111', 11),
(112, 'Laura Croft', 'Female', '1991-10-15', '555-0112', 12),
(113, 'Michael Scott', 'Male', '1965-03-15', '555-0113', 13),
(114, 'Nina Williams', 'Female', '1994-08-08', '555-0114', 14),
(115, 'Oscar Martinez', 'Male', '1982-11-20', '555-0115', 15),
(116, 'Pam Beesly', 'Female', '1989-03-25', '555-0116', 16),
(117, 'Quentin Tarantino', 'Male', '1963-03-27', '555-0117', 17),
(118, 'Rachel Green', 'Female', '1990-05-05', '555-0118', 18),
(119, 'Steve Rogers', 'Male', '1920-07-04', '555-0119', 19),
(120, 'Tina Fey', 'Female', '1970-05-18', '555-0120', 20);

-- Room (Uses Room_Details_ID instead of room details fields)
INSERT INTO Room (Room_ID, Room_Number, Room_Details_ID) VALUES
(201, '101', 1),
(202, '102', 1),
(203, '103', 4),
(204, '104', 4),
(205, '105', 10),
(206, '201', 2),
(207, '202', 5),
(208, '203', 7),
(209, '204', 15),
(210, '205', 11),
(211, '301', 3),
(212, '302', 6),
(213, '303', 8),
(214, '304', 13),
(215, '305', 12),
(216, '401', 3),
(217, '402', 6),
(218, '403', 9),
(219, '404', 14),
(220, '405', 16);

-- Date_Dim
INSERT INTO Date_Dim (Date_ID, Date, Day, Month, Year) VALUES
(301, '2026-01-01', 1, 1, 2026),
(302, '2026-01-02', 2, 1, 2026),
(303, '2026-01-05', 5, 1, 2026),
(304, '2026-01-10', 10, 1, 2026),
(305, '2026-01-15', 15, 1, 2026),
(306, '2026-02-01', 1, 2, 2026),
(307, '2026-02-14', 14, 2, 2026),
(308, '2026-02-20', 20, 2, 2026),
(309, '2026-03-01', 1, 3, 2026),
(310, '2026-03-10', 10, 3, 2026),
(311, '2026-03-17', 17, 3, 2026),
(312, '2026-04-01', 1, 4, 2026),
(313, '2026-04-12', 12, 4, 2026),
(314, '2026-05-01', 1, 5, 2026),
(315, '2026-05-05', 5, 5, 2026),
(316, '2026-06-01', 1, 6, 2026),
(317, '2026-06-15', 15, 6, 2026),
(318, '2026-07-04', 4, 7, 2026),
(319, '2026-07-10', 10, 7, 2026),
(320, '2026-07-20', 20, 7, 2026);

-- Payment
INSERT INTO Payment (Payment_ID, Payment_Mode, Payment_Status, Payment_Date) VALUES
(401, 'Credit Card', 'Completed', '2026-01-01'),
(402, 'Debit Card', 'Completed', '2026-01-02'),
(403, 'Cash', 'Completed', '2026-01-05'),
(404, 'UPI/Online', 'Completed', '2026-01-10'),
(405, 'Credit Card', 'Completed', '2026-01-15'),
(406, 'Credit Card', 'Completed', '2026-02-01'),
(407, 'Cash', 'Completed', '2026-02-14'),
(408, 'Debit Card', 'Pending', '2026-02-20'),
(409, 'UPI/Online', 'Completed', '2026-03-01'),
(410, 'Credit Card', 'Completed', '2026-03-10'),
(411, 'Credit Card', 'Refunded', '2026-03-17'),
(412, 'Debit Card', 'Completed', '2026-04-01'),
(413, 'Cash', 'Completed', '2026-04-12'),
(414, 'Credit Card', 'Completed', '2026-05-01'),
(415, 'UPI/Online', 'Completed', '2026-05-05'),
(416, 'Credit Card', 'Completed', '2026-06-01'),
(417, 'Debit Card', 'Completed', '2026-06-15'),
(418, 'Credit Card', 'Completed', '2026-07-04'),
(419, 'Cash', 'Completed', '2026-07-10'),
(420, 'UPI/Online', 'Completed', '2026-07-20');

-- Employee
INSERT INTO Employee (Employee_ID, Employee_Name, Designation, Department, Contact_Number) VALUES
(501, 'David Miller', 'Front Desk Agent', 'Reception', '555-0201'),
(502, 'Emily Davis', 'Concierge', 'Guest Services', '555-0202'),
(503, 'Frank Wilson', 'Manager', 'Front Office', '555-0203'),
(504, 'Grace Taylor', 'Front Desk Agent', 'Reception', '555-0204'),
(505, 'Henry Anderson', 'Bellhop', 'Guest Services', '555-0205'),
(506, 'Irene Thomas', 'Front Desk Agent', 'Reception', '555-0206'),
(507, 'Jack Jackson', 'Supervisor', 'Front Office', '555-0207'),
(508, 'Karen White', 'Front Desk Agent', 'Reception', '555-0208'),
(509, 'Leo Harris', 'Night Auditor', 'Finance', '555-0209'),
(510, 'Mia Martin', 'Front Desk Agent', 'Reception', '555-0210'),
(511, 'Nathan Thompson', 'Manager', 'Housekeeping', '555-0211'),
(512, 'Olivia Garcia', 'Concierge', 'Guest Services', '555-0212'),
(513, 'Peter Parker', 'Front Desk Agent', 'Reception', '555-0213'),
(514, 'Quinn Fabray', 'Front Desk Agent', 'Reception', '555-0214'),
(515, 'Ryan Howard', 'Sales Agent', 'Marketing', '555-0215'),
(516, 'Sarah Connor', 'Front Desk Agent', 'Reception', '555-0216'),
(517, 'Tom Holland', 'Bellhop', 'Guest Services', '555-0217'),
(518, 'Uma Thurman', 'Front Desk Agent', 'Reception', '555-0218'),
(519, 'Victor Stone', 'Night Auditor', 'Finance', '555-0219'),
(520, 'Wanda Maximoff', 'Supervisor', 'Front Office', '555-0220');

-- ------------------------------------------------------------
-- 3. FACT TABLE
-- ------------------------------------------------------------

-- Booking_Fact
INSERT INTO Booking_Fact (Booking_ID, Customer_ID, Room_ID, Date_ID, Payment_ID, Employee_ID, Number_of_Days, Total_Amount) VALUES
(1001, 101, 201, 301, 401, 501, 2, 160.00),
(1002, 102, 203, 302, 402, 502, 3, 420.00),
(1003, 103, 205, 303, 403, 504, 4, 1000.00),
(1004, 104, 209, 304, 404, 503, 2, 1200.00),
(1005, 105, 202, 305, 405, 501, 1, 80.00),
(1006, 106, 204, 306, 406, 506, 5, 700.00),
(1007, 107, 208, 307, 407, 504, 2, 400.00),
(1008, 108, 210, 308, 408, 508, 3, 840.00),
(1009, 109, 206, 309, 409, 510, 2, 170.00),
(1010, 110, 207, 310, 410, 501, 4, 600.00),
(1011, 111, 214, 311, 411, 513, 1, 350.00),
(1012, 112, 212, 312, 412, 514, 3, 480.00),
(1013, 113, 215, 313, 413, 506, 2, 580.00),
(1014, 114, 211, 314, 414, 516, 1, 90.00),
(1015, 115, 213, 315, 415, 518, 5, 1050.00),
(1016, 116, 217, 316, 416, 501, 2, 320.00),
(1017, 117, 219, 317, 417, 504, 3, 1110.00),
(1018, 118, 218, 318, 418, 508, 4, 880.00),
(1019, 119, 220, 319, 419, 510, 2, 1300.00),
(1020, 120, 216, 320, 420, 516, 1, 90.00);