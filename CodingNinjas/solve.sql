use coding_ninjas_imdb;

/*https://www.codingninjas.com/codestudio/problems/testingg-sql_1755903?topList=top-100-sql-problems&leftPanelTab=0*/
select IMDB.Movie_id, Title, Rating, Budget, genre
from IMDB
         inner join (select Movie_id, genre
                     from genre
                     where genre.genre like 'C%') as G on IMDB.Movie_id = G.Movie_id
where Title like '%(2014)'
  and Budget > 40000000;
#
select IMDB.Movie_id, Title, Rating, Budget
from IMDB
where IMDB.Movie_id in (select Movie_id
                        from genre
                        where genre.genre like 'C%')
  and Title like '%(2014)'
  and Budget > 40000000;

/*https://www.codingninjas.com/codestudio/problems/imdb_1755910?topList=top-100-sql-problems*/
select Title, Rating
from IMDB
where MetaCritic > 60
  and Title like '%(2012)'
  and Movie_id in (select Movie_id from earning where Domestic > 100000000);
#
select Title, rating
from earning
         left join
     IMDB on earning.movie_id = IMDB.movie_id
where domestic > 100000000
  and metacritic > 60
  and IMDB.title like '%2012%';
#
select *
from IMDB
         natural left join earning
where domestic > 100000000
  and metacritic > 60
  and IMDB.title like '%2012%';

/*https://www.codingninjas.com/codestudio/problems/imdb_1755912?topList=top-100-sql-problems*/
select genre, max()