/* 1. Display each student’s name with the courses they are enrolled in.*/
SELECT CONCAT(students.first_name, ' ', students.last_name, ' ',courses.course_name) as student_name
FROM enrollments
INNER join students on enrollments.student_id = students.id
INNER join courses on  courses.id = enrollments.course_id;

/* 2. Show the students and their scores in the course “Mathematics”*/
SELECT CONCAT(s.first_name, '  ', s.last_name) AS student_name, e.score
FROM enrollments e
inner join students as  s on s.id = e.student_id
WHERE e.course_id = 1;

/* List all students who are not enrolled in any course (LEFT JOIN).*/
SELECT CONCAT(s.first_name, '  ', s.last_name) AS students, e.course_id as "enrolled in"
FROM students s
LEFT JOIN enrollments e on s.id = e.student_id
WHERE e.course_id  IS null;

/* 4. Show all courses that currently have no students (RIGHT JOIN).*/
SELECT course_name 	AS courseNoStudent, e.student_id
FROM enrollments e 
RIGHT JOIN courses on courses.id = e.course_id
WHERE e.student_id is null;

/*  5. Display the average score per teacher.*/
SELECT courses.teacher_name, courses.course_name, AVG(e.score) as moyenne
FROM enrollments e
RIGHT join courses on courses.id = e.course_id
GROUP BY courses.teacher_name;

/* Mini Project*/
SELECT CONCAT (s.first_name, ' ', s.last_name) as Student, c.course_name, c.teacher_name, e.score
FROM students s
LEFT JOIN enrollments e on s.id = e.student_id
LEFT JOIN courses c on  e.course_id = c.id
ORDER BY c.teacher_name, Student;