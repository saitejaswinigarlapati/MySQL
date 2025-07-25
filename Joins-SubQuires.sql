use learning;
CREATE TABLE courses(
		course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        instructor VARCHAR(50),
        credits INT
    );

INSERT INTO courses ( course_id , course_name , instructor,credits) 
VALUES  (101, 'Database Systems', 'Dr. Rao', 4),
		(102, 'Computer Networks', 'Dr. Iyer', 3),
		(103, 'Operating Systems', 'Dr. Sharma', 4),
		(104, 'Digital Electronics', 'Dr. Menon', 3),
		(105, 'Thermodynamics', 'Dr. Singh', 4);
        

CREATE TABLE student_courses (
	student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id ,course_id),
    FOREIGN KEY (student_id) REFERENCES students_info(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students_courses (student_id, course_id, enrollment_date)
VALUES
(1, 101, '2023-06-05'),
(1, 102, '2023-06-10'),
(2, 101, '2022-07-15'),
(2, 103, '2022-08-01'),
(3, 101, '2023-01-10'),
(3, 104, '2023-02-01'),
(4, 105, '2021-08-20'),
(5, 101, '2020-10-05'),
(6, 102, '2023-03-01'),
(7, 104, '2021-06-15'),
(8, 103, '2022-01-05'),
(9, 101, '2023-04-01'),
(10, 105, '2020-08-01');


select * from student_courses;


-- JOINS
--  Find students enrolled in any course with their enrollment date
SELECT s.name , c.course_name , sc.enrollment_date
FROM student_courses sc
JOIN students_info s ON sc.student_id = s.id
JOIN courses c ON sc.course_id = c.course_id;

-- LEFT JOIN
-- List all students and the courses they are enrolled in (show NULL if not enrolled)
SELECT s.name, c.course_name
FROM students_info s
LEFT JOIN student_courses sc ON s.id = sc.student_id
LEFT JOIN courses c ON sc.course_id = c.course_id;

-- Count number of students enrolled in each course
SELECT c.course_name, COUNT(sc.student_id) AS num_students
FROM courses c
LEFT JOIN student_courses sc ON c.course_id = sc.course_id
GROUP BY c.course_name;

-- RIGHT JOIN
-- Find all courses and the students enrolled in them (show NULL if no student is enrolled)
SELECT s.name, c.course_name
FROM students_info s
RIGHT JOIN student_courses sc ON s.id = sc.student_id
RIGHT JOIN courses c ON sc.course_id = c.course_id;


-- SUB QUIRES
-- Find students with marks above the average
SELECT name, marks
FROM students_info
WHERE  marks > (SELECT AVG(marks) FROM students_info);


-- Find students enrolled in the 'Database Systems' course
SELECT name
FROM students_info
WHERE id IN (
    SELECT student_id
    FROM student_courses
    WHERE course_id = (
        SELECT course_id
        FROM courses
        WHERE course_name = 'Database Systems'
    )
);

-- Show course names that have more than 2 students enrolled
SELECT course_name
FROM courses
WHERE course_id IN (
    SELECT course_id
    FROM student_courses
    GROUP BY course_id
    HAVING COUNT(student_id) > 2
);



