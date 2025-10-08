CREATE TABLE if NOT EXISTS courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  teacher_name VARCHAR(100) NOT NULL,
  credits INT
); 


INSERT INTO courses (course_name, teacher_name, credits) VALUES
('Mathematics', 'Dr. Martin Dupont', 4),
('Physics', 'Mme Claire Moreau', 3),
('Chemistry', 'Dr. Jean Lambert', 3),
('History', 'M. Antoine Lefevre', 2),
('Computer Science', 'Mme Sophie Durand', 5),
('English', 'M. Patrick Bernard', 2),
('Biology', 'Dr. Marie Petit', 4),
('Economics', 'Mme Julie Robert', 3),
('Philosophy', 'M. Luc Gauthier', 2),
('Art and Design', 'Mme Emma Laurent', 2);

/* 1. Show all courses with more than 3 credits.*/
SELECT course_name FROM courses WHERE credits > 3;

/* 2. Find students whose city is either “Paris” or “London”*/
SELECT *FROM students WHERE city= 'Paris' OR city='London';

/* 3. Count the total number of students.*/
SELECT Count(*) FROM students;

/* 4. Find the average, minimum, and maximum age of students.*/
SELECT AVG(age) FROM students;
SELECT MIN(age) FROM students;
SELECT MAX(age) FROM students;

/* 5. Show the number of students per city.*/
SELECT city, COUNT(*) AS nb_eleves
FROM students
GROUP BY city;

/* Mini Project*/
SELECT COUNT(*) AS nb_eleves, AVG(grade) AS Moyenne, city
FROM students 
GROUP BY city
ORDER BY nb_eleves DESC;
