-- 1. Get a list of users who live in "Mumbai."
SELECT * FROM users u
JOIN city c ON u.city_id = c.city_id
WHERE c.city_name = 'Mumbai';

-- 2. Get users who do not live in "Delhi."
SELECT * FROM users u
JOIN city c ON u.city_id = c.city_id
WHERE c.city_name <> 'Delhi';

-- 3. How many users have updated their phone number
SELECT COUNT(*) FROM users
WHERE phone_number IS NOT NULL;

-- 4. Find the names of users who have entered their biometrics (FaceScan, Fingerprint, IrisScan).
SELECT u.first_name, u.last_name FROM users u
JOIN biometric b ON u.user_id = b.user_id
WHERE b.face_scan = TRUE OR b.fingerprint = TRUE OR b.iris_scan = TRUE;

-- 5. List the full names of users who have a city starting with "B"
SELECT u.first_name, u.last_name FROM users u
JOIN city c ON u.city_id = c.city_id
WHERE c.city_name LIKE 'B%';

-- 6. Get the full names of users who live in either 'Mumbai' or 'Delhi'.
SELECT u.first_name, u.last_name FROM users u
JOIN city c ON u.city_id = c.city_id
WHERE c.city_name IN ('Mumbai', 'Delhi');

-- 7. Select all users who have logged in at least once.
SELECT DISTINCT u.* FROM users u
JOIN logs l ON u.user_id = l.user_id
WHERE l.action = 'Login';

-- 8. Select all users who have not logged in.
SELECT * FROM users
WHERE user_id NOT IN (
  SELECT DISTINCT user_id FROM logs WHERE action = 'Login'
);

-- 9. Get users whose verification status is 'Verified'.
SELECT u.* FROM users u
JOIN verification v ON u.user_id = v.user_id
WHERE v.status = 'Verified';

-- 10. Get users with specific verification status ('Verified') and at least one login action.
SELECT DISTINCT u.* FROM users u
JOIN verification v ON u.user_id = v.user_id
JOIN logs l ON u.user_id = l.user_id
WHERE v.status = 'Verified' AND l.action = 'Login';

-- 11. Select the city and the number of users in that city.
SELECT c.city_name, COUNT(u.user_id) AS total_users
FROM city c LEFT JOIN users u ON c.city_id = u.city_id
GROUP BY c.city_name;

-- 12. Get the verification status of users along with their names.
SELECT u.first_name, u.last_name, v.status
FROM users u
JOIN verification v ON u.user_id = v.user_id;

-- 13. List the total number of actions performed by each user.
SELECT u.user_id, u.first_name, COUNT(l.log_id) AS total_actions
FROM users u
LEFT JOIN logs l ON u.user_id = l.user_id
GROUP BY u.user_id;

-- 14. Select users and the cities they belong to, sorted by city name.
SELECT u.first_name, u.last_name, c.city_name
FROM users u
JOIN city c ON u.city_id = c.city_id
ORDER BY c.city_name;

-- 15. Select users and the cities they belong to, sorted by city name.
-- (Duplicate of 14)

-- 16. Get users who have not updated their address.
SELECT * FROM users
WHERE address IS NULL;

-- 17. Get the number of users in each city who have entered biometric data.
SELECT c.city_name, COUNT(DISTINCT b.user_id) AS biometric_users
FROM city c
JOIN users u ON c.city_id = u.city_id
JOIN biometric b ON u.user_id = b.user_id
GROUP BY c.city_name;
