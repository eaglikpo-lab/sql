CREATE TABLE if NOT EXISTS students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age INT,
  grade VARCHAR(10),
  city VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, city)
VALUES
('Alice', 'Durand', 14, 15, 'Paris'),
('Lucas', 'Martin', 15, 11, 'Lyon'),
('Emma', 'Lefevre', 13, 18, 'Marseille'),
('Noah', 'Bernard', 16, 14, 'Paris'),
('Chloé', 'Petit', 18, 17, 'Paris'),
('Léo', 'Robert', 12, 12, 'Nantes'),
('Lina', 'Richard', 14, 13.5, 'Lyon'),
('Hugo', 'Dubois', 13, 17, 'Marseille'),
('Jade', 'Moreau', 18, 12, 'Rennes'),
('Gabriel', 'Laurent', 16, 18, 'Nantes');

/* 1. Display all columns from the students table.*/
SELECT * FROM students;

/* 2. Show only the first_name, last_name, and grade columns.*/
SELECT first_name,last_name,grade FROM students;

/* 3. Display the list of students ordered alphabetically by last_name.*/
SELECT * FROM students ORDER BY last_name;

/* 4. Find students who are younger than 18 years old.*/
SELECT * FROM students WHERE age < 18;

/* 5. Display the first 5 students in the table.*/
SELECT * FROM students LIMIT 5;

/* Mini Projet*/
SELECT CONCAT(first_name, ' ', last_name) as name, city
FROM students
ORDER BY last_name;