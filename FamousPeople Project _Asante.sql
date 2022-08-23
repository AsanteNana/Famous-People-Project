#Creating a database named  project
CREATE DATABASE project;
USE project;

#Creating a table for authors and their books
CREATE TABLE authors (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, book_title TEXT);
INSERT INTO authors (name, book_title) 
	VALUES ("J.K.Rowling", "Harry Potter"),
		("Stephanie Meyer", "Twilight"),
		("J.R.R. Tolkein", "Lord of The Rings"),
		("G.R.R. Martin", "A Song of Ice and Fire"),
		("Frank Herbert", "Dune"),
		("Stephen King", "The Shining"),
		("C.S. Lewis", "The Chronicles of Narnia"),
		("Mario Puzo", "The Godfather"),
		("Jane Austen", "Pride and Prejudice"),
		("Chuck Palahniuk", "Fight Club"),
		("Scott Fitzgerald", "The Great Gatsby");
		

#Creating a table for mocvies
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT, award TEXT, book_id INT, box_office INTEGER, genre TEXT);
INSERT INTO movies (title, award, book_id, box_office, genre)
	VALUES ("Harry Potter and the Philosopher's Stone", "Oscar", 1, 1000000, "Fantasy"),
		("Harry Potter and the Chamber of Secrets", "None", 1, 900000, "Fantasy"),
		("Harry Potter and the Prisoner of Azkaban", "None", 1, 1100000, "Fantasy"),
		("Harry Potter and the Goblet of Fire", "None", 1, 1000000, "Fantasy"),
		("Harry Potter and the Order of the Phoenix", "None", 1, 1057000, "Fantasy"),
		("Harry Potter and the Half-Blood Prince", "None", 1, 1300000, "Fantasy"),
		("Harry Potter and the Deathly Hallows", "None", 1, 1500000, "Fantasy"),
		("Twilight", "None", 2, 750000, "Fantasy, Romance"),
		("New Moon", "None", 2, 845000, "Fantasy, Romance"),
		("Eclipse", "None", 2, 834000, "Fantasy, Romance"),
		("Breaking Dawn", "None", 2, 1000000, "Fantasy, Romance"),
		("The Hobbit", "None", 3, 1800000, "Fantasy, Adventure"),
		("Fellowship of the Ring", "None", 3, 1500000, "Fantasy, Adventure"),
		("Two Towers", "None", 3, 1700000, "Fantasy, Adventure"),
		("Return of the King", "None", 3, 1600000, "Fantasy, Adventure"),
		("The Great Gatsby", "None", 11, 1160700, "Romance, Drama"),
		("The Godfather Part 1", "Oscar", 8, 1400000, "Crime, Drama"),
		("The Godfather Part 2", "None", 8, 1300000, "Crime, Drama"),
		("The Godfather Part 3", "None", 8, 1500000, "Crime, Drama"),
		("Game of Thrones", "Emmy", 4, 2600000, "Drama"),
		("House of The Dragon", "None", 4, 500000, "Drama"),
		("Dune", "Oscar", 5, 1200000, "Sci-Fi, Adventure"),
		("The Lion, the witch and the Wardrobe", "None", 7, 650000, "Fantasy, Adventure"),
		("Prince Caspian", "None", 7, 650000, "Fantasy, Adventure"),
		("The Voyage of the Dawn Treader", "None", 7, 450000, "Fantasy, Adventure"),
		("The Shining", "Oscar", 6, 960000, "Horror"),
		("Pride and Prejudice", "None", 9, 800000, "Romance"),
		("Fight Club", "Oscar", 10, 1100000, "Drama");

#Creating a table for actors
CREATE TABLE actors (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age INTEGER);
INSERT INTO actors (name, age)
	VALUES ("Daniel Radcliffe", 32),
		("Rupert Grint", 33),
		("Emma Watson", 32),
		("Kristen Stewart", 32),
		("Robert Pattinson", 36),
		("Orlando Bloom", 45),
		("Kate Blanchett", 53),
		("Leonardo DiCarprio", 47),
		("Al Pacino", 82),
		("Robert De Niro", 78),
		("Emilia Clarke", 35),
		("Kit harington", 35),
		("Matt Smith", 39),		
		("Zendaya", 25),
		("Jason Momoa", 42),
		("William Moseley", 35),
		("Georgie Henly", 27),
		("Shelly Duval", 73),
		("Keira Knightley", 37),
		("Brad Pitt", 58),
		("Edward Norton", 52);

#Creating a table for movies_acted
CREATE TABLE movies_acted (id INTEGER PRIMARY KEY AUTO_INCREMENT, actors_id INTEGER, movies_id INTEGER);
INSERT into movies_acted (actors_id, movies_id)
	VALUES (1, 1),
		(1, 2),
		(1, 3),
		(1, 4),
		(1, 5),
		(1, 6),
		(1, 7),
		(2, 1),
		(2, 2),
		(2, 3),
		(2, 4),
		(2, 5),
		(2, 6),
		(2, 7),
		(3, 1),
		(3, 2),
		(3, 3),
		(3, 4),
		(3, 5),
		(3, 6),
		(3, 7),
		(4, 8),
		(4, 9),
		(4, 10),
		(4, 11),
		(5, 8),
		(5, 9),
		(5, 10),
		(5, 11),
		(6, 12),
		(6, 13),
		(6, 14),
		(6, 15),
		(7, 12),
		(7, 13),
		(7, 14),
		(7, 15),
		(8, 16),
		(9, 17),
		(9, 18),
		(9, 19),
		(10, 17),
		(10, 18),
		(10, 19),
		(11, 20),
		(12, 20),
		(13, 21),
		(14, 22),
		(15, 20),
		(15, 22),
		(16, 23),
		(16, 24),
		(16, 25),
		(17, 23),
		(17, 24),
		(17, 25),
		(18, 26),
		(19, 27),
		(20, 28),
		(21, 28);

#Avearage box office amount
SELECT AVG(box_office) AS Average_box_office_amount from movies;

# Selecting movies that have won an oscar
SELECT * FROM movies WHERE award = "Oscar";

# Selecting the authors of the movies adapted from books
SELECT authors.name, movies.title FROM authors 
LEFT JOIN movies ON authors.id = movies.book_id;

#Selecting name and movie title  where genre contains fantasy
SELECT authors.name, movies.title FROM authors 
LEFT JOIN movies ON authors.id = movies.book_id 
	WHERE genre REGEXP "Fantasy";

#Querying maximum grossing movie per author (this is based on movies adapted from their books)
SELECT authors.name, movies.title, MAX(movies.box_office) AS maximum_box_office 
FROM authors LEFT JOIN movies ON authors.id = movies.book_id  GROUP BY authors.name;

#Querying total money from movies per author and sorting in descending order (this is based on movies adapted from their books)
SELECT authors.name, SUM(movies.box_office) AS gross_box_office 
FROM authors LEFT JOIN movies ON authors.id = movies.book_id  GROUP BY authors.name 
ORDER BY gross_box_office DESC;

#Selecting movie titles and corresponding actor name
SELECT movies.title, actors.name FROM movies_acted 
JOIN movies ON movies.id= movies_acted.movies_id 
JOIN actors ON actors.id = movies_acted.actors_id;

#Selecting book title and corresponding actor name
SELECT actors.name, authors.book_title FROM movies_acted 
JOIN movies ON movies.id= movies_acted.movies_id 
JOIN actors ON actors.id = movies_acted.actors_id
JOIN authors ON authors.id = movies.book_id GROUP BY actors.name;

#Selecting actors and movies bassed on age and box_office
SELECT actors.name, actors.age, movies.title, movies.box_office FROM movies_acted 
JOIN movies ON movies.id= movies_acted.movies_id 
JOIN actors ON actors.id = movies_acted.actors_id
JOIN authors ON authors.id = movies.book_id
WHERE actors.age > 40 AND movies.box_office > 1000000;

#Querying movies that won an oscar or emmy
SELECT * FROM movies WHERE award IN ("Oscar","Emmy");

#Categorizing movies based on box office performance
SELECT title AS Movie, CASE
WHEN box_office < 500000 THEN "Poor"
WHEN box_office < 900000 THEN "Average"
WHEN box_office < 1100000 THEN "Good"
ELSE "Amazing"
END AS Performance FROM movies;

#selecting books with movies with the exact same title
SELECT title, genre FROM movies WHERE title IN (SELECT book_title FROM authors);

