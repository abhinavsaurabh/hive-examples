use movie-analysis;

CREATE TABLE top_rated_movies AS
SELECT a.movieId,b.movieTitle, a.usercount FROM
(
SELECT movieId, count(distinct userId) AS usercount
FROM ratings
GROUP BY movieId
ORDER BY usercount DESC
)a
JOIN movies b
ON a.movieId = b.movieId
WHERE a.usercount>40;

SELECT * FROM top_rated_movies limit 20;


