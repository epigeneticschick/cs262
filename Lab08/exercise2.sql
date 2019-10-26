--Retrieve all “The King”’s game scores in decreasing order.
--SELECT PlayerGame.score
-- FROM Player, PlayerGame
--WHERE Player.ID = PlayerGame.playerID
-- AND Player.name = 'The King'
-- ORDER BY PlayerGame.score DESC;



--Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.

--SELECT Player.name
--  FROM Player, Game, PlayerGame
--  WHERE  Game.ID = PlayerGame.gameID
--  AND Player.ID  = PlayerGame.playerID
  --AND PlayerGame.score = (
  --  SELECT MAX(PlayerGame.score)
  --  FROM PlayerGame, game
  --  WHERE Game.completed = TRUE
  --  AND PlayerGame.gameID = Game.ID
  --  AND Game.time = '2006-06-28 13:20:00'
  --);
--So what does that P1.ID < P2.ID clause do in the last example query?
-- We want to check and make sure that the IDS aren't the same otherwise it will return pairs of the same player's iD


--The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
--Possible a situation where you would want to compare values to themselves. One example if a table had values that were related to itself like studying social interactions. You might want to know who has met who so that you don't reintroduce people.
