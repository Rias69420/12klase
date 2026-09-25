CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    nationality TEXT,
    birth_year INTEGER,
    genre TEXT
);

CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    publication_year INTEGER,
    pages INTEGER,
    language TEXT,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (name, nationality, birth_year, genre) VALUES
('J.K. Rowling', 'British', 1965, 'Fantasy'),
('George Orwell', 'British', 1903, 'Dystopian'),
('Isabel Allende', 'Chilean', 1942, 'Historical Fiction'),
('Haruki Murakami', 'Japanese', 1949, 'Magical Realism'),
('Stephen King', 'American', 1947, 'Horror'),
('Chimamanda Ngozi Adichie', 'Nigerian', 1977, 'Literary Fiction'),
('Gabriel García Márquez', 'Colombian', 1927, 'Magical Realism'),
('Margaret Atwood', 'Canadian', 1939, 'Speculative Fiction');

INSERT INTO books (title, publication_year, pages, language, author_id) VALUES
('Harry Potter and the Sorcerer Stone', 1997, 309, 'English', 1),
('Harry Potter and the Chamber of Secrets', 1998, 341, 'English', 1),
('1984', 1949, 328, 'English', 2),
('Animal Farm', 1945, 112, 'English', 2),
('The House of the Spirits', 1982, 433, 'Spanish', 3),
('Portrait in Sepia', 2000, 304, 'Spanish', 3),
('Kafka on the Shore', 2002, 505, 'Japanese', 4),
('Norwegian Wood', 1987, 296, 'Japanese', 4),
('The Shining', 1977, 447, 'English', 5),
('It', 1986, 1138, 'English', 5),
('Half of a Yellow Sun', 2006, 448, 'English', 6),
('Americanah', 2013, 477, 'English', 6),
('One Hundred Years of Solitude', 1967, 417, 'Spanish', 7),
('Love in the Time of Cholera', 1985, 348, 'Spanish', 7),
('The Handmaids Tale', 1985, 311, 'English', 8);


-- 1. List all books published after the year 2000, ordered by year ascending.
-- 2. Find all books written in Japanese - display only their IDs, titles, and publication years.
-- 3. Show all books written by author with ID 3, ordered by title.
-- 4. Display all books published before 1950, ordered by year descending.
-- 5. List all book IDs and titles along with their author's name.
-- 6. Find the names of authors who wrote books in the genre 'Magical Realism'.
-- 7. Show all book IDs, book titles and their authors (author's name and birth year) born before 1950.
-- 8. List books and authors from the United Kingdom.
-- 9. How many books are in the dataset?
-- 10. How many books has each author written? (Display only author's name and amount of written books)
-- 11. What is the earliest and latest publication year in the dataset?
-- 12. Find the average birth year of all authors.


-- 1. 
SELECT * FROM books
WHERE publication_year > 2000
ORDER BY publication_year ASC;

-- 2.
SELECT book_id, title, publication_year
FROM books
WHERE language = 'Japanese';

-- 3
SELECT * FROM books
WHERE author_id = 3
ORDER BY title ASC;

-- 4. 
SELECT * FROM books
WHERE publication_year < 1950
ORDER BY publication_year DESC;

-- 5. 
SELECT b.book_id, b.title, a.name AS author_name
FROM books b
JOIN authors a ON b.author_id = a.author_id;

-- 6.
SELECT DISTINCT a.name
FROM authors a
JOIN books b ON a.author_id = b.author_id
WHERE a.genre = 'Magical Realism';

-- 7. 
SELECT b.book_id, b.title, a.name AS author_name, a.birth_year
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.birth_year < 1950;

-- 8. 
SELECT b.*, a.*
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.nationality = 'British';

-- 9. 
SELECT COUNT(*) AS total_books
FROM books;

-- 10.
SELECT a.name, COUNT(b.book_id) AS book_count
FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id
GROUP BY a.author_id, a.name;

-- 11. 
SELECT MIN(publication_year) AS earliest_year,
       MAX(publication_year) AS latest_year
FROM books;

-- 12. 
SELECT AVG(birth_year) AS average_birth_year
FROM authors;