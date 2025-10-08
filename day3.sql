CREATE TABLE if NOT EXISTS enrollments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrolled_on DATE NOT NULL,
  score DECIMAL(5,2),
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO enrollments (student_id, course_id, enrolled_on, score)
VALUES
(1, 1, '2025-01-15', 85.50),
(1, 2, '2025-01-16', 78.25),
(2, 1, '2025-01-18', 90.00),
(3, 3, '2025-01-20', 66.75),
(4, 2, '2025-02-01', 92.00),
(5, 3, '2025-02-05', 74.50),
(6, 1, '2025-02-10', 88.00),
(7, 4, '2025-02-11', 79.25),
(8, 2, '2025-02-15', 84.00),
(9, 4, '2025-02-20', 95.00);


/* 1. Show the number of enrollments per course.*/
SELECT courses.course_name, COUNT(*) as nb_enroll
FROM enrollments
INNER join courses on courses.id = enrollments.course_id
group by courses.course_name;


/* 2. Display the average score per course. */
SELECT courses.course_name, AVG(score) as Moyenne 
FROM enrollments 
INNER join courses on courses.id = enrollments.course_id
group by courses.course_name;

/* 3. List all courses where the average score is above 70.*/
SELECT courses.course_name, AVG(score) as Moyenne 
FROM enrollments 
INNER join courses on courses.id = enrollments.course_id
group by courses.course_name
HAVING Moyenne > 75;

/* 4. Show for each student, how many courses they have enrolled in.*/
SELECT CONCAT(students.first_name, ' ', students.last_name) as student_name, COUNT(course_id) as nb_courses
FROM enrollments
RIGHT join students on enrollments.student_id = students.id
GROUP BY student_name;

/* 5. Find the course with the highest average score.*/
SELECT courses.course_name, AVG(score) as Moyenne 
FROM enrollments 
INNER join courses on courses.id = enrollments.course_id
group by courses.course_name
ORDER BY Moyenne DESC
Limit 1;

/* Mini Projet*/
SELECT courses.course_name, COUNT(*) as nb_enroll, AVG(score) as Moyenne 
FROM enrollments
INNER join courses on courses.id = enrollments.course_id
group by courses.course_name
HAVING nb_enroll>2;  /*>3 normalement demandé*/