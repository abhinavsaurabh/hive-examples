use movie-analysis;



CREATE TABLE enriched_user_table AS
select a.userId,a.gender,b.agegroup,c.occupation
from users a
JOIN age_group b 
ON
a.age=b.age
JOIN occupations c
ON
a.occupationCode=c.occupationCode;

CREATE TABLE  movie_genre_rank AS 
select occupation,agegroup,genreName,dense_rank() over(partition by occupation order by avgRating DESC) as generRank from
(
select occupation, agegroup, genreName, avg(rating) as avgRating from
(
select rating, genreName, agegroup, occupation from
(
select a.rating as rating, b.genre as genreList, c.agegroup as agegroup, c.occupation as occupation
FROM ratings a
JOIN movies b
ON a.movieId=b.movieId
JOIN enriched_user_table c
ON a.userId=c.userId
)a
LATERAL VIEW explode(genreList)l as genreName 
)b
group by occupation, agegroup, genreName
)c 
group by  occupation,agegroup,genreName, avgRating;






