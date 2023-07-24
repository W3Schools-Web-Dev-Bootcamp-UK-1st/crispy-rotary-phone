-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50)
);

-- Create the countries table
CREATE TABLE countries (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create the addresses table
CREATE TABLE addresses (
    id INT PRIMARY KEY,
    user_id INT,
    country_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Insert data into the users table
INSERT INTO users (id, username, password, email, firstName, lastName) VALUES
(1, 'User1', 'Password1', 'user1@example.com', 'John', 'Doe'),
(2, 'User2', 'Password2', 'user2@example.com', 'Jane', 'Smith');

-- Insert data into the countries table
INSERT INTO countries (id, name) VALUES
(1, 'Country1'),
(2, 'Country2'),
(3, 'Country3');

-- Insert data into the addresses table
INSERT INTO addresses (user_id, country_id) VALUES
(1, 1),
(2, 1),
(2, 3);

-- Query to list all the countries
SELECT name FROM countries;

-- Query to list all user emails
SELECT email FROM users;

-- Query to list all user firstNames that have the letter "e" in the name
SELECT firstName FROM users WHERE firstName LIKE '%e%';

-- Query to list all the countries where user_id = 2 lives
SELECT countries.name
FROM countries
JOIN addresses ON countries.id = addresses.country_id
WHERE addresses.user_id = 2;
