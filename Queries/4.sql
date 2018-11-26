SELECT S.year AS Season, COUNT(DISTINCT P.player_id) AS Players_Played
FROM player P JOIN played_in PI ON P.player_id = PI.player_id
              JOIN season S ON PI.season_id = S.season_id
GROUP BY S.year
