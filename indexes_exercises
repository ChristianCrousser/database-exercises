USE codeup_test_db;

SHOW TABLES;

ALTER TABLE albums
ADD UNIQUE (artist, name);

SELECT * FROM albums;
DESCRIBE albums;
## the below does not work!
INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Michael Jackson', 'Thriller', 1982, 47.3, 'Pop');