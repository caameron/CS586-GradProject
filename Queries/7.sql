SELECT C.name AS college_name, COUNT(P.player_id) AS Number_Of_Players
FROM player P JOIN positionplayed PP ON P.player_id = PP.player_id
              JOIN position PO ON PO.position_id = PP.position_id
              JOIN college C ON C.college_id = P.college_id
WHERE position = 'Guard' AND C.college_id <> 58
GROUP BY C.name
HAVING COUNT(P.player_id) = 
(SELECT MAX(t1.player_count)
FROM
(SELECT CO.name, COUNT(PL.player_id) AS player_count
FROM player PL JOIN positionplayed PPP ON PL.player_id = PPP.player_id
              JOIN position POS ON POS.position_id = PPP.position_id
              JOIN college CO ON CO.college_id = PL.college_id
WHERE position = 'Guard' AND CO.college_id <> 58
GROUP BY CO.name) t1)
