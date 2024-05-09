-- Check for the existence of the 'users' table and remove it if it exists
IF OBJECT_ID('users', 'U') IS NOT NULL
    DROP TABLE users;

-- Creation of the 'users' table with unique email addresses
CREATE TABLE users (
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    email NVARCHAR(255) NOT NULL,
    name NVARCHAR(255),
    CONSTRAINT UC_Email UNIQUE (email)
);
