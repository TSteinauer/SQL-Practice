select 


(SELECT P.player_name 
from games G, players P, teams T
where G.home_team_id = T.team_id and T.captain_id = P.player_id and P.player_id =12) as "HOST",

(SELECT P.player_name 
from games G, players P, teams T
where G.home_team_id = T.team_id and T.captain_id = P.player_id and P.player_id =14) as "GUEST",
(SELECT date 
from games G
where G.home_team_id = 1) as "DATE",
(SELECT score 
from games G
where G.home_team_id = 1) as "SCORE";


