use coding_ninjas_imdb;

/*https://www.codingninjas.com/codestudio/problems/testingg-sql_1755903?topList=top-100-sql-problems&leftPanelTab=0*/
select IMDB.Movie_id, g.genre
from IMDB
         cross join genre as g;

select IMDB.Movie_id, g.genre
from IMDB
         inner join genre g on IMDB.Movie_id = g.Movie_id;

select IMDB.Movie_id, Title, Rating, Budget, genre
from IMDB
         inner join (select Movie_id, genre
                     from genre
                     where genre.genre like 'C%') as G on IMDB.Movie_id = G.Movie_id
where Title like '%(2014)'
  and Budget > 40000000;