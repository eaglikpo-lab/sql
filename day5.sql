/* Find students who scored above the average score (use subquery).*/
SELECT CONCAT(students.first_name, ' ', students.last_name, ' ') as  student, e.score
FROM students
LEFT JOIN enrollments e ON students.id = e.student_id
WHERE e.score > (SELECT AVG(score) FROM enrollments);

/* 2. List all courses that have at least one student from “Paris”.*/
SELECT  c.course_name AS course
FROM courses c
LEFT join enrollments e on c.id  = e.course_id
LEFT join  students s on s.id = e.course_id
WHERE s.city = 'Paris'
GROUP by course;

/* 3. Display students who are enrolled in more than 2 courses.*/
SELECT COUNT(courses.course_name) as nb_courses,
CONCAT(students.first_name, ' ', students.last_name, ' ') as student_name
FROM enrollments
INNER join students on enrollments.student_id = students.id
INNER join courses on  courses.id = enrollments.course_id
GROUP by student_name
HAVING nb_courses >1 /* >2 normalement*/
;

/* 4. Show the names of students who are not enrolled in any course (use NOT IN or NOT EXISTS).*/
SELECT CONCAT(s.first_name, ' ', s.last_name) AS students
FROM students s
WHERE s.id NOT IN (
    SELECT student_id
    FROM enrollments
);

/* 5. Combine results of two queries using UNION:*/
SELECT first_name, last_name FROM students WHERE city = 'Paris'
UNION
SELECT first_name, last_name FROM students WHERE city = 'Lyon';


/*  Mini projet  */
SELECT CONCAT(first_name, ' ', last_name) as "student name", courses.course_name, enrollments.score
FROM enrollments 
INNER join students on enrollments.student_id = students.id
INNER JOIN courses ON courses.id = enrollments.course_id
where enrollments.score > (SELECT AVG (e.score) as averageByCourse 
    from enrollments e
    INNER JOIN courses ON enrollments.course_id = courses.id 
    WHERE e.course_id = enrollments.course_id);


