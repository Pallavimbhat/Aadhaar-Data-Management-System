-- -------------------
-- Table: city
-- -------------------
CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10)
);

-- -------------------
-- Table: users
-- -------------------
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- -------------------
-- Table: emails
-- -------------------
CREATE TABLE emails (
    email_id INT PRIMARY KEY,
    user_id INT,
    email VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- -------------------
-- Table: verification
-- -------------------
CREATE TABLE verification (
    verification_id INT PRIMARY KEY,
    user_id INT,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- -------------------
-- Table: biometric
-- -------------------
CREATE TABLE biometric (
    biometric_id INT PRIMARY KEY,
    user_id INT,
    face_scan BOOLEAN,
    fingerprint BOOLEAN,
    iris_scan BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- -------------------
-- Table: logs
-- -------------------
CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    action VARCHAR(50),
    timestamp DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
