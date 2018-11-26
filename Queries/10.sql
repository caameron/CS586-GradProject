SELECT C.name AS college_name, COUNT(P.player_id) AS Number_Of_Players
FROM player P JOIN college C ON C.college_id = P.college_id
GROUP BY C.name
