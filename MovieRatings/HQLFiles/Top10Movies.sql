use movie-analysis;

CREATE TABLE top_viewed_movies AS
select a.movieId, b.movieTitle,a.count from
(
select movieId, count(movieId) as count from ratings group by movieId order by count desc
)a
JOIN movies b
ON b.movieId = a.movieId;

SELECT * FROM top_viewed_movies LIMIT 20;