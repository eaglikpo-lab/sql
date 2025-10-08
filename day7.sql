-- 1. List all students with their enrolled courses and scores.
SELECT s.last_name, s.first_name, c.course_name, e.score
FROM students s
LEFT JOIN enrollments e on s.id = e.student_id
left JOIN courses c on e.course_id = c.id;

-- 2. Show the top 3 students (by average score).
SELECT AVG(e.score) as average
FROM enrollments e
GROUP BY e.student_id 
order by average DESC
LIMIT 3;

-- 3. Display the number of students per city.
SELECT city, Count(student_id) as numberOfStudents
FROM students 
GROUP BY city;

-- 4. List courses with no enrollments
SELECT course_name
FROM courses
left JOIN enrollments e on courses.id = e.course_id
WHERE e.student_id is NULL;

-- 5. Show each teacher with the average score of their students.
SELECT c.teacher_name, AVG(e.score) as studentAverage
FROM courses c
LEFT JOIN enrollments e on c.id = e.course_id
GROUP BY e.course_id;

-- 6.  Create a view student_performance summarizing for each student
CREATE VIEW student_performance AS
SELECT 
  s.id AS student_id,
  CONCAT(s.first_name, ' ', s.last_name) AS student_name,
  COUNT(e.course_id) AS number_of_courses,
  ROUND(AVG(e.score), 2) AS average_score,
  MAX(e.score) AS highest_score,
  MIN(e.score) AS lowest_score
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.first_name, s.last_name;

-- 7. Write a query to export the list of students who scored above the global average score.
SELECT 
  s.id,
  CONCAT(s.first_name, ' ', s.last_name) AS student_name,
  ROUND(AVG(e.score), 2) AS avg_student_score
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.first_name, s.last_name
HAVING avg_student_score > (
  SELECT AVG(score) FROM enrollments
);

