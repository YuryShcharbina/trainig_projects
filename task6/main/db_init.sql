CREATE DATABASE test_students;

\c test_students

CREATE TABLE IF NOT EXISTS Students (
                ID SERIAL PRIMARY KEY,
                Student VARCHAR(50) NOT NULL,
                StudentId INT NOT NULL);

CREATE TABLE IF NOT EXISTS Result (
                ID SERIAL PRIMARY KEY,
                StudentId INT NOT NULL,
                Task1 VARCHAR(20) NOT NULL,
                Task2 VARCHAR(20) NOT NULL,
                Task3 VARCHAR(20) NOT NULL,
                Task4 VARCHAR(20) NOT NULL);
