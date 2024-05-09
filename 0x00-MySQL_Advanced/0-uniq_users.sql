-- This statement removes the 'users' table if it already exists, then creates a new 'users' table with a primary key 'id', a unique 'email', and a 'name' field.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
