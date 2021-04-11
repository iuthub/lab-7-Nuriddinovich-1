-- What are the names of all movies released in 1995?
SELECT movies.name
FROM movies
WHERE movies.year = 1995


-- How many people played a part in the movie ”Lost in Translation”?
-- And
-- What are the names of all the people who played a part in the movie ”Lost in Translation”?
SELECT a.first_name
FROM actors a
         JOIN roles r ON r.actor_id = a.id
         JOIN movies m ON m.id = r.movie_id
WHERE m.name = 'Lost in Translation'


-- Who directed the movie ”Fight Club”?
SELECT d.first_name
FROM directors d
         JOIN movies_directors md ON md.director_id = d.id
         JOIN movies m ON md.movie_id = m.id
WHERE m.name = 'Fight Club'


-- How many movies has Clint Eastwood directed?
-- And
-- What are the names of all movies Clint Eastwood has directed?
SELECT m.name
FROM movies m
         JOIN movies_directors md ON md.movie_id = m.id
         JOIN directors d ON d.id = md.director_id
WHERE d.first_name = 'Clint'
  AND d.last_name = 'Eastwood'


-- What are the names of all directors who have directed at least one horror film?
SELECT d.first_name
FROM directors d
         JOIN movies_directors md ON md.director_id = d.id
         JOIN movies m ON m.id = md.movie_id
         JOIN movies_genres mg ON mg.movie_id = m.id
WHERE mg.genre = 'Horror'


-- What are the names of every actor who has appeared in a movie directed by Christopher Nolan?
SELECT DISTINCT a.first_name
FROM actors a
         JOIN roles r ON r.actor_id = a.id
         JOIN movies_directors md ON md.movie_id = r.movie_id
         JOIN directors d ON d.id = md.director_id
WHERE d.first_name = 'Christopher'
  AND d.last_name = 'Nolan'