/*Get the average rating for a movie*/
select *
from movies;

select movies.movieid, movies.title, avg(ratings.rating)
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.movieid = '1'
group by  movies.movieid;

/*Get the total ratings for a movie*/
select movies.movieid, movies.title, count(ratings.rating)
from movies
  join ratings on movies.movieid = ratings.movieid
where movies.movieid = '1'
group by movies.movieid;

/*Get the total movies for a genre*/
select movie_genre.genre_id, count(movies.genres)
from movies
  join movie_genre on movies.movieid = movie_genre.movieid
where movie_genre.genre_id = '2'
group by movie_genre.genre_id;

/*Get the average rating for a user*/
select ratings.userid, avg(ratings.rating)
from ratings
where ratings.userid = '4'
group by ratings.userid;

/*Find the user with the most ratings*/
select ratings.userid, count(ratings.rating)
from ratings
group by ratings.userid
order by count DESC
limit 1;

/*Find the user with the highest average rating*/
select ratings.userid, avg(ratings.rating), max(ratings.rating)
from ratings
group by ratings.userid
limit 1;

/*Find the user with the highest average rating with more than 50 reviews*/
select userid, count(rating) as numb_avg, avg(rating) as avg_rating
from ratings
group by ratings.userid
having count(rating) > 50
order by avg_rating desc;

/*Find the movies with an average rating over 4 */
select m.title, avg(r.rating) AS avg_rating
from movies m
join ratings r
  ON m.movieid = r.movieid
GROUP BY m.title
HAVING avg(r.rating) > 4
ORDER BY avg_rating DESC;

/*For each genre find the total number of reviews as well as the average review sort by highest average review.*/
SELECT genres, count(ratings.rating) as reviews, avg(ratings.rating) as average
from ratings
  join movie_genre on  ratings.movieid = movie_genre.movieid
  join genre on movie_genre.genre_id = genre.id
group by genre.genres
order by average;

/*Create a new table called actors (We are going to pretend the actor can only play in one movie) The table should include name, character name, foreign key to movies and date of birth at least plus an id field.*/

/*Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements*/
insert into actors(name, character_name, date_of_birth, id, movieid)
values
    ('Tim', 'Zombie2', 'December 10 1984', 2, 1),
    ('Dustin', 'Zombie3', 'August 12 1900', 3, 1),
    ('Carrie', 'Zombie4', 'January 10 1990', 4, 1),
    ('Jason', 'Zombie5', 'March 8 2011', 5, 1),
    ('Ryan', 'Zombie1', 'September 9 1983', 6, 1),
    ('Tim', 'Zombie2', 'December 10 1984', 7, 1),
    ('Dustin', 'Zombie3', 'August 12 1900', 8, 1),
    ('Carrie', 'Zombie4', 'January 10 1990', 9, 1),
    ('Jason', 'Zombie5', 'March 8 2011', 10, 1),
    ('Ryan', 'Zombie1', 'September 9 1983', 11, 2),
    ('Tim', 'Zombie2', 'December 10 1984', 12, 2),
    ('Dustin', 'Zombie3', 'August 12 1900', 13, 2),
    ('Carrie', 'Zombie4', 'January 10 1990', 14, 2),
    ('Jason', 'Zombie5', 'March 8 2011', 15, 2),
    ('Ryan', 'Zombie1', 'September 9 1983', 16, 2),
    ('Tim', 'Zombie2', 'December 10 1984', 17, 2),
    ('Dustin', 'Zombie3', 'August 12 1900', 18, 2),
    ('Carrie', 'Zombie4', 'January 10 1990', 19, 2),
    ('Jason', 'Zombie5', 'March 8 2011', 20, 2),
    ('Ryan', 'Zombie1', 'September 9 1983', 21, 3),
    ('Tim', 'Zombie2', 'December 10 1984', 22, 3),
    ('Dustin', 'Zombie3', 'August 12 1900', 23, 3),
    ('Carrie', 'Zombie4', 'January 10 1990', 24, 3),
    ('Jason', 'Zombie5', 'March 8 2011', 25, 3),
    ('Ryan', 'Zombie1', 'September 9 1983', 26, 3),
    ('Tim', 'Zombie2', 'December 10 1984', 27, 3),
    ('Dustin', 'Zombie3', 'August 12 1900', 28, 3),
    ('Carrie', 'Zombie4', 'January 10 1990', 29, 3),
    ('Jason', 'Zombie5', 'March 8 2011', 30, 3);

select *
from actors;

update movies
  set mpaa_rating = 'G'
where title like '%Toy Story%';

update movies
  set mpaa_rating = 'PG-13'
where title like '%Last Action Hero%';

update movies
  set mpaa_rating = 'R'
where title like '%Godfather, The%';

update movies
  set mpaa_rating = 'PG'
where title like '%Jumanji%';

update movies
  set mpaa_rating = 'PG-13'
where title like '%GoldenEye%';

select title, mpaa_rating
from movies
where title like '%GoldenEye%';