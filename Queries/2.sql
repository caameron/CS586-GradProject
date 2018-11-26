SELECT CAST(AVG(P.height) AS DECIMAL(10,2)) AS Average_Height, CAST(AVG(P.weight) AS DECIMAL(10,2)) AS Average_Weight
FROM Player P JOIN played_in PI ON P.player_id = PI.player_id
              JOIN season S ON PI.season_id = S.season_id
WHERE S.year = 2017
