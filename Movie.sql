create database hack;
use hack;
select * from movies;
select * from ratings;
select * from tags;
SELECT m.title, COUNT(r.movieId) AS ratings
FROM movies m
JOIN ratings r ON m.movieId = r.movieId
GROUP BY m.title
ORDER BY ratings DESC
LIMIT 1;

SELECT AVG(rating) AS avg_rating
FROM ratings r
JOIN movies m ON r.movieId = m.movieId
WHERE m.title = 'Terminator 2: Judgment Day (1991)';

SELECT m.title, r.count, r.mean
FROM movies m
JOIN (
    SELECT movieId, COUNT(*) AS count, AVG(rating) AS mean
    FROM ratings
    GROUP BY movieId
    HAVING COUNT(*) > 50
) r ON m.movieId = r.movieId
ORDER BY r.mean DESC
LIMIT 1;

SELECT m.title, r.count, r.mean
FROM movies m
JOIN (
    SELECT movieId, COUNT(*) AS count, AVG(rating) AS mean
    FROM ratings
    GROUP BY movieId
    HAVING COUNT(*) > 50
) r ON m.movieId = r.movieId
ORDER BY r.count DESC
LIMIT 5;

SELECT m.title, r.count
FROM movies m
JOIN (
    SELECT movieId, COUNT(*) AS count, AVG(rating) AS mean
    FROM ratings
    GROUP BY movieId
    HAVING COUNT(*) > 50
) r ON m.movieId = r.movieId
WHERE m.genres = 'Sci-Fi'
ORDER BY r.count DESC
LIMIT 2, 1;


