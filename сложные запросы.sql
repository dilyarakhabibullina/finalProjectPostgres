

--сортируем игроков по результатам 

SELECT players.id, first_name, last_name, results.scores, what_was_injured FROM players
LEFT JOIN results ON players.id = results.player_id
LEFT JOIN injuries ON injury_id = injuries.id ORDER BY results.scores DESC;

--смотрим, сколько штрафных бросков и фолов у самого результативного игрока

SELECT free_throws, faults FROM results 
WHERE player_id = (SELECT players.id FROM players WHERE first_name ='Yasir' AND last_name = 'Thornton');

--выбираем игрока ростом выше 220 см с амплуа легкого защитника, не играющего на текущий момент ни в какой команде

SELECT DISTINCT first_name, last_name, height, teams.name, name_of_country AS player_country, date_of_birth,
detailed_position
FROM players JOIN teams ON players.team_id= teams.id
JOIN countries ON players.country_id = countries.id
JOIN playing_position ON players.player_position_id=playing_position.id WHERE height > 220 
AND detailed_position ='light guard'
AND teams.name IS NULL;

--выберем всех игроков команды УНИКС

SELECT first_name, last_name, date_of_birth, height FROM players WHERE team_id = (SELECT teams.id FROM teams WHERE name ='УНИКС');