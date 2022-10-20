SELECT players.id, first_name, second_name, results.scores, what_was_hurt FROM players
LEFT JOIN results ON players.id = results.player_id
LEFT JOIN injuries ON injury_id = injuries.id ORDER BY results.scores DESC;


SELECT free_throws, faults FROM results 
WHERE player_id = (SELECT players.id FROM players WHERE first_name ='Noah' AND second_name = 'Baldwin');