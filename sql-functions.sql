USE learning;

CREATE TABLE students_info (
		id INT PRIMARY KEY,
        name VARCHAR(50),
        age INT,
        dob DATE,
        marks INT,
        joining_date DATE
);

INSERT INTO students_info (id, name, age, dob, marks, joining_date)
VALUES 
(1, 'Alice', 20, '2005-01-15', 88, '2023-06-01'),
(2, 'Bob', 22, '2003-04-10', 76, '2022-07-10'),
(3, 'Charlie', 19, '2006-09-22', 90, '2023-01-05'),
(4, 'David', 21, '2004-12-01', 65, '2021-08-15'),
(5, 'Eva', 23, '2002-11-30', 93, '2020-09-20'),
(6, 'Frank', 20, '2005-03-10', 81, '2023-02-15'),
(7, 'Grace', 22, '2003-07-24', 69, '2021-06-10'),
(8, 'Hannah', 21, '2004-08-05', 78, '2022-01-01'),
(9, 'Ian', 19, '2006-11-18', 59, '2023-03-20'),
(10, 'Jack', 23, '2002-05-29', 85, '2020-07-01'),
(11, 'Karen', 20, '2005-06-12', 72, '2023-05-20'),
(12, 'Leo', 22, '2003-10-30', 67, '2021-08-25'),
(13, 'Mia', 21, '2004-02-14', 95, '2022-09-10'),
(14, 'Nathan', 24, '2001-12-17', 88, '2019-11-05'),
(15, 'Olivia', 20, '2005-09-07', 91, '2023-01-30');

SELECT * FROM students_info;
show tables;
describe students_info;

-- Aggregate Functions
SELECT COUNT(*) FROM students_info;
SELECT AVG(marks) FROM students_info;
SELECT MAX(age) , MIN(age) FROM students_info;

-- String Functions
SELECT UPPER(name) AS upper_name FROM students_info;
SELECT CONCAT(name , ' is ' , age , ' years old ') FROM students;

-- Date Functions
SELECT name, YEAR(dob) AS birth_year FROM students_info;
SELECT name, DATEDIFF(CURDATE(), joining_date) AS days_since_joining FROM students_info;

-- Math Functions
SELECT name  marks , CEIL(marks/10.0) AS grade_band FROM students_info;

-- Conditional Functions
SELECT name , marks ,
	CASE
		WHEN marks >= 90 THEN 'A'
        WHEN marks >=75 THEN 'B'
        WHEN marks >=60 THEN 'C'
        ELSE 'D'
	END AS grade
FROM students_info;

SELECT * FROM students_info WHERE marks>80 ORDER BY marks DESC;

-- ADD column
ALTER TABLE students_info ADD COLUMN department VARCHAR(30);

UPDATE students_info SET department = 'CSE' WHERE id IN (1, 2, 3, 4, 5);
UPDATE students_info SET department = 'ECE' WHERE id IN (6, 7, 8, 9, 10);
UPDATE students_info SET department = 'MECH' WHERE id IN (11, 12, 13, 14, 15);

-- GROUP BY

SELECT department , AVG(marks) AS avg_marks
FROM students_info
Group BY department;

SELECT * FROM students_info LIMIT 5;