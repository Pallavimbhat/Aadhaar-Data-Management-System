-- -----------------------------
-- Insertion into city table
-- -----------------------------
INSERT INTO city (city_id, city_name, state, pincode) VALUES
(1, 'Mumbai', 'Maharashtra', '400001'),
(2, 'Delhi', 'Delhi', '110001'),
(3, 'Bangalore', 'Karnataka', '560001'),
(4, 'Chennai', 'Tamil Nadu', '600001');

-- -----------------------------
-- Insertion into user table
-- -----------------------------
INSERT INTO users (user_id, first_name, last_name, dob, gender, phone_number, email, address, city_id) VALUES
(101, 'Amit', 'Sharma', '1990-01-01', 'Male', '9876543210', 'amit.sharma@example.com', '123 Main St', 1),
(102, 'Neha', 'Verma', '1992-05-10', 'Female', '9123456780', 'neha.verma@example.com', '456 South Ave', 2),
(103, 'Raj', 'Kapoor', '1988-03-25', 'Male', '9988776655', 'raj.kapoor@example.com', '789 North Blvd', 3),
(104, 'Sita', 'Devi', '1995-09-15', 'Female', NULL, NULL, NULL, 4);

-- -----------------------------
-- Insertion into logs table
-- -----------------------------
INSERT INTO logs (log_id, user_id, action, timestamp) VALUES
(1, 101, 'Login', '2023-01-01 08:00:00'),
(2, 102, 'Login', '2023-01-02 09:15:00'),
(3, 103, 'Logout', '2023-01-03 10:30:00');

-- -----------------------------
-- Insertion into verification table
-- -----------------------------
INSERT INTO verification (verification_id, user_id, status) VALUES
(1, 101, 'Verified'),
(2, 102, 'Pending'),
(3, 103, 'Verified');

-- -----------------------------
-- Insertion into emails table
-- -----------------------------
INSERT INTO emails (email_id, user_id, email) VALUES
(1, 101, 'amit.sharma@example.com'),
(2, 102, 'neha.verma@example.com'),
(3, 103, 'raj.kapoor@example.com');

-- -----------------------------
-- Insertion into biometric table
-- -----------------------------
INSERT INTO biometric (biometric_id, user_id, face_scan, fingerprint, iris_scan) VALUES
(1, 101, TRUE, TRUE, FALSE),
(2, 102, FALSE, TRUE, TRUE),
(3, 104, FALSE, FALSE, FALSE);
