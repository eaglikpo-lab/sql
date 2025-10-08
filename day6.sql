CREATE TABLE if NOT EXISTS  teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

/* 2. Insert 3–5 teachers into the table.*/
INSERT INTO teachers (name, email, specialty)
VALUES
('Marie Dupont', 'marie.dupont@school.com', 'Mathematics'),
('Jean Martin', 'jean.martin@school.com', 'Physics'),
('Sophie Leroy', 'sophie.leroy@school.com', 'Computer Science'),
('David Moreau', 'david.moreau@school.com', 'History'),
('Camille Bernard', 'camille.bernard@school.com', 'Literature');

/* 3. Update one teacher’s email.*/
UPDATE teachers SET email = 'dav.moreau@school.com' WHERE id = 4;

/* 4. Delete one teacher from the table.*/
Delete from teachers where id = 2;

/* 5. Add a foreign key column teacher_id in the courses table linking to teachers(id).*/
ALTER TABLE courses  
ADD COLUMN teacher_id INT;  /* Ajouter la colonne teacher_id dans la table courses*/

ALTER TABLE courses
ADD CONSTRAINT fk_teacher
FOREIGN KEY (teacher_id) REFERENCES teachers(id); /* Clé étrangères*/



/*  Mini Projet: “Library Database"*/
-- Table books
CREATE TABLE IF NOT EXISTS books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  year INT
);

-- Table members
CREATE TABLE IF NOT EXISTS members (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE
);

-- Table borrowings
CREATE TABLE IF NOT EXISTS borrowings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  borrowed_on DATE NOT NULL,
  returned_on DATE,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);

-- Ajout de quelques livres
INSERT INTO books (title, author, year) VALUES
('1984', 'George Orwell', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('To Kill a Mockingbird', 'Harper Lee', 1960),
('The Catcher in the Rye', 'J.D. Salinger', 1951);

-- Ajout de quelques membres
INSERT INTO members (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- Ajout de quelques emprunts
INSERT INTO borrowings (book_id, member_id, borrowed_on, returned_on) VALUES
(1, 1, '2025-09-01', '2025-09-15'),
(2, 2, '2025-09-05', NULL),  -- pas encore rendu
(3, 3, '2025-09-10', '2025-09-25'),
(4, 1, '2025-09-20', NULL);  -- pas encore rendu



SELECT 
  m.name AS member_name,
  b.title AS book_title,
  br.borrowed_on AS borrow_date,
  CASE 
    WHEN br.returned_on IS NULL THEN 'Not returned'
    ELSE br.returned_on
  END AS return_date
FROM borrowings br
JOIN members m ON br.member_id = m.id
JOIN books b ON br.book_id = b.id;