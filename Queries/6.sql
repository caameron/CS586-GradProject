SELECT PO.position, COUNT(*) AS Players FROM
Player P JOIN positionplayed PP ON P.player_id = PP.player_id
JOIN position PO ON PP.position_id = PO.position_id
GROUP BY PO.position
HAVING COUNT(*) = 
(SELECT MAX(T1.players)
FROM
(
SELECT POS.position, COUNT(*) AS Players FROM
Player PL JOIN positionplayed PPP ON PL.player_id = PPP.player_id
JOIN position POS ON PPP.position_id = POS.position_id
GROUP BY POS.position) T1)
