-- This SQL script first checks for an existing 'users' table and drops it if present. Then, it creates a new 'users' table with an auto-incrementing 'id' as the primary key, a unique 'email' field, a 'name' field, and a 'country' field with a default value of 'US' and a constraint to allow only 'US', 'CO', or 'TN' as valid entries.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country CHAR(2) NOT NULL DEFAULT 'US' CHECK (country IN ('US', 'CO', 'TN'))
);
