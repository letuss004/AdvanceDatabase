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
select genre, max(net_profit) as net_profit
from (select genre, sum(Worldwide + Domestic - Budget) as net_profit
      from (select Title, genre, Domestic, Worldwide, Budget
            from genre g
                     inner join earning e on g.Movie_id = e.Movie_id
                     inner join (select * from IMDB where Title like '%(2012)') as i on i.Movie_id = g.Movie_id) as info
      group by Title, genre) as NP
where genre is not null
  and net_profit is not null
group by genre
order by genre;

/*https://www.codingninjas.com/codestudio/problems/imdb_1755913?topList=top-100-sql-problems*/
select genre, max(Rating) as weighted_rating
from (select genre, (Rating + MetaCritic / 10) / 2 as Rating
      from IMDB
               inner join genre g on IMDB.Movie_id = g.Movie_id
      where Title like '%(2014)'
        and genre is not null
        and Rating is not null
        and MetaCritic is not null) as movie
group by genre
order by genre;
#
select genre, max((Rating + MetaCritic / 10) / 2) as weighted_rating
from genre
         natural join IMDB
where IMDB.Title like '%2014%'
  and genre.genre is not null
group by genre
order by genre;

