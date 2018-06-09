DROP DATABASE movie-analysis cascade;

use movie-analysis;

CREATE EXTERNAL TABLE movies(
movieId String,
movieTitle String,
genre ARRAY<STRING>)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '|'
LINES TERMINATED BY '\n'
location '/user/hive/movies';

CREATE EXTERNAL TABLE ratings(
userId String,
movieId String,
rating int
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
location '/user/hive/ratings';


CREATE EXTERNAL TABLE users(
userId String,
gender String,
age int,
occupationCode int
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
location '/user/hive/users';


CREATE TABLE age_group(
age int,
agegroup String
);

INSERT INTO TABLE age_group VALUES
(1,"Under 18"),
(18,"18-24"),
(25,"25-34"),
(35,"35-44"),
(45,"45-49"),
(50,"50-55"),
(56,"56+");

CREATE TABLE occupations(
occupationCode int, 
occupation String
);

INSERT INTO TABLE occupations VALUES
(0,"other"),
(1,"academic/educator"),
(2,"artist"),
(3,"clerical/admin"),
(4,"college/grad student"),
(5,"customer service"),
(6,"doctor/health care"),
(7,"executive/managerial"),
(8,"farmer"),
(9,"homemaker"),
(10,"K-12 student"),
(11,"lawyer"),
(12,"programmer"),
(13,"retired"),
(14,"sales/marketing"),
(15,"scientist"),
(16,"self-employed"),
(17,"technician/engineer"),
(18,"tradesman/craftsman"),
(19,"unemployed"),
(20,"writer");



