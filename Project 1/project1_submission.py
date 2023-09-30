# Collaborators: ZAINAB RIZWAN (2019-CE-36)

def query_one():
    """Query for Stanford's venue"""
    return """
      SELECT venue_name, venue_capacity 
      FROM `bigquery-public-data.ncaa_basketball.mbb_teams` 
      WHERE market='Stanford'
    """

def query_two():
    """Query for games in Stanford's venue"""
    return """
       SELECT COUNT(*) AS games_at_maples_pavilion 
       FROM `bigquery-public-data.ncaa_basketball.mbb_games_sr` 
       WHERE venue_name='Maples Pavilion' AND season=2013
    """

def query_three():
    """Query for maximum-red-intensity teams"""
    return """
       SELECT market, color 
       FROM `bigquery-public-data.ncaa_basketball.team_colors` 
       WHERE UPPER(color) 
       LIKE '%FF%' 
       ORDER BY market ASC
    """

def query_four():
    """Query for Stanford's wins at home"""
    return """
        SELECT COUNT(*) as number , ROUND(AVG(points_game),2) as avg_stanford, ROUND(AVG(opp_points_game),2) as avg_opponent 
        FROM `bigquery-public-data.ncaa_basketball.mbb_teams_games_sr` 
        WHERE market='Stanford' AND win=True AND season BETWEEN 2013 AND 2017 AND home_team=True   
    """

def query_five():
    """Query for players for birth city"""
    return """
       SELECT  COUNT(DISTINCT player_id) AS num_players 
       FROM `bigquery-public-data.ncaa_basketball.mbb_players_games_sr` AS G 
       INNER JOIN `bigquery-public-data.ncaa_basketball.mbb_teams` AS T 
       ON G.team_id= T.id 
       WHERE birthplace_city=venue_city AND birthplace_state=venue_state
    """

def query_six():
    """Query for biggest blowout"""
    return """      
    SELECT win_name, lose_name, win_pts, lose_pts, MAX(win_pts-lose_pts) AS margin
    FROM `bigquery-public-data.ncaa_basketball.mbb_historical_tournament_games` 
    GROUP BY win_name, lose_name, win_pts, lose_pts 
    ORDER BY margin DESC LIMIT 1

    """

def query_seven():
    """Query for historical upset percentage"""
    return """
       SELECT ROUND((COUNT(CASE WHEN (win_seed>lose_seed) THEN 1 END) *100)/ COUNT(*), 2) AS upset_percentage 
       FROM `bigquery-public-data.ncaa_basketball.mbb_historical_tournament_games` 
    """

def query_eight():
    """Query for teams with same states and colors"""
    return """
       SELECT A.name as teamA, B.name as teamB, A.venue_state as state
       FROM `bigquery-public-data.ncaa_basketball.mbb_teams` A, 
            `bigquery-public-data.ncaa_basketball.mbb_teams` B,
            `bigquery-public-data.ncaa_basketball.team_colors` C,
            `bigquery-public-data.ncaa_basketball.team_colors` D
       WHERE A.venue_state=B.venue_state AND A.id=C.id AND B.id=D.id AND C.color=D.color AND A.name<B.name
       ORDER BY teamA 
    """

def query_nine():
    """Query for top geographical locations"""
    return """
       SELECT birthplace_city AS city, birthplace_country AS country, birthplace_state AS state, SUM(points) as total_points
       FROM `bigquery-public-data.ncaa_basketball.mbb_players_games_sr` 
       WHERE season BETWEEN 2013 AND 2017 AND team_market='Stanford'
       GROUP BY city, country, state, team_id
       ORDER BY total_points DESC
       LIMIT 3
 
    """

def query_ten():
    """Query for teams with lots of high-scorers"""
    return """
        SELECT team_market,COUNT(*) AS num_players
        FROM (SELECT DISTINCT(player_id), team_market FROM `bigquery-public-data.ncaa_basketball.mbb_pbp_sr`
        WHERE season>=2013 AND period=1 
        GROUP BY player_id, game_id, team_market
        HAVING SUM(points_scored)>=15)
        GROUP BY team_market
        ORDER BY COUNT(*) DESC, team_market
        LIMIT 5
    """

def query_eleven():
    """Query for highest-winner teams"""
    return """
        SELECT  market, COUNT(*) FROM as top_performer_count 
        (SELECT season, MAX(wins) wins FROM `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons`
        season1 WHERE season>=1900 AND season<=2000 
        GROUP BY season 
        ORDER BY season) season1,
       `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` season2
        WHERE season1.season=season2.season AND season1.wins= season2.wins AND market IS NOT NULL
        GROUP BY market 
        ORDER BY COUNT(*) DESC, 
        LIMIT 5;
    """
