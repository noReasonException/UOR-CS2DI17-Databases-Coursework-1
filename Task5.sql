--Question 1
SELECT
    student_id as "Student No",
    player_first_name as "First Name",
    player_last_name as "Last Name",
    dept_name as "Department Name"
FROM players p
JOIN departments d ON p.dept_id = d.dept_id
--Choose the name of the department
WHERE d.dept_name = 'Biological Science'
;


--Question 2
SELECT
      game_datetime AS "Date",
      home.team_name AS "Home Team",
      away.team_name AS "Away Team",
      st_name AS "Venue"
FROM stadiums s
JOIN games g ON s.st_id = g.st_id
JOIN teams as home ON g.home_team_id = home.team_id
JOIN teams as away ON g.away_team_id = away.team_id
--We cast the timestamp to a date on order to leave us with just the date (no time) 
WHERE game_datetime::pg_catalog.date = '2018-10-08'
;


--Question 3
SELECT
    player_first_name AS "First Name",
    player_last_name AS "Last Name",
    COUNT(s.player_id) AS "Number of Goals"
FROM players p
JOIN scorers s ON p.player_id = s.player_id
GROUP BY player_first_name, player_last_name
HAVING COUNT(s.player_id) > 2
;


--Question 4
SELECT
    COUNT(*) AS "Total Num of Goals in Season"
FROM scorers WHERE player_id
;


--Question 5
SELECT
     teams.team_name AS "Team" ,
     home_goals_scored + away_goals_scored AS "Goals For",
     home_goal_received + away_goals_received AS "Goals Against",
     home_goals_scored + away_goals_scored - home_goal_received - away_goals_received AS "Goal Difference",
     "Home Points" + "Away Points" AS "Points"
     --Above information extracted from joint subqueries (below)
FROM (
    SELECT
        home_team_id,
        SUM(CASE WHEN away_goals > home_goals THEN 0 WHEN away_goals < home_goals THEN 3 ELSE 1 END) AS "Home Points"
    FROM games
    GROUP BY home_team_id
) AS A JOIN (
    SELECT
         away_team_id,
         SUM(CASE WHEN away_goals > home_goals THEN 3 WHEN away_goals < home_goals THEN 0 ELSE 1 END) AS "Away Points"
    FROM games
    GROUP BY away_team_id
 ) AS B
  ON A.home_team_id = B.away_team_id JOIN (
      SELECT
          home_team_id,
          SUM(home_goals) AS home_goals_scored,
          SUM(away_goals) AS home_goal_received
      FROM games
      GROUP by home_team_id
  ) AS C
  ON A.home_team_id = C.home_team_id JOIN (
      SELECT away_team_id,SUM(away_goals) AS away_goals_scored,SUM(home_goals) AS away_goals_received
      FROM games
      GROUP BY away_team_id
  ) AS D
  ON C.home_team_id = D.away_team_id JOIN teams
  ON A.home_team_id = teams.team_id
  ORDER BY "Home Points" + "Away Points" DESC
;
