-
-- Get the cross-product of all the tables.
--SELECT *
 --FROM Player, PlayerGame, Game
 --;

--Retrieve a list of all the games, ordered by date with the most recent game coming first.
--SELECT ID, time, completed,
--FROM Game
--ORDER BY time DESC;

--Retrieve all the games that occurred in the past week.
--SELECT *
--  FROM Game
--  WHERE time > (NOW() - interval '7 DAYS')
  ;
--Retrieve a list of players who have (non-NULL) names.
--SELECT *
--  FROM Player
--  WHERE name is not NULL

--Retrieve a list of IDs for players who have some game score larger than 2000.
--SELECT ID
--  FROM Player
--  WHERE score is
--Retrieve a list of players who have GMail accounts.
--SELECT *
--  FROM PLayer
--  WHERE emailAddress LIKE '%gmail%'
