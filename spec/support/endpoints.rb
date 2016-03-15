module Endpoints
  def nba_game_logs
    nba_game_logs = Stattleship::BasketballGameLogs.new
    nba_game_logs.extend(Stattleship::BasketballGameLogsRepresenter)

    json = File.read('spec/fixtures/nba/game_log.json')

    nba_game_logs.from_json(json)
    nba_game_logs.data
  end

  def nfl_game_logs
    nfl_game_logs = Stattleship::FootballGameLogs.new
    nfl_game_logs.extend(Stattleship::FootballGameLogsRepresenter)

    json = File.read('spec/fixtures/nfl/game_log.json')

    nfl_game_logs.from_json(json)
    nfl_game_logs.data
  end

  def nhl_game_logs
    nhl_game_logs = Stattleship::HockeyGameLogs.new
    nhl_game_logs.extend(Stattleship::HockeyGameLogsRepresenter)

    json = File.read('spec/fixtures/nhl/game_log.json')

    nhl_game_logs.from_json(json)
    nhl_game_logs.data
  end

  def leaders
    stat_leaders = Stattleship::StatLeaders.new
    stat_leaders.extend(Stattleship::StatLeadersRepresenter)

    json = File.read('spec/fixtures/nhl/stat_leaders.json')

    stat_leaders.from_json(json)
    stat_leaders.data
  end

  def nba_leaders
    stat_leaders = Stattleship::BasketballStatLeaders.new
    stat_leaders.extend(Stattleship::StatLeadersRepresenter)

    json = File.read('spec/fixtures/nba/stat_leaders.json')

    stat_leaders.from_json(json)
    stat_leaders.data
  end

  def nhl_leaders
    stat_leaders = Stattleship::HockeyStatLeaders.new
    stat_leaders.extend(Stattleship::StatLeadersRepresenter)

    json = File.read('spec/fixtures/nhl/stat_leaders.json')

    stat_leaders.from_json(json)
    stat_leaders.data
  end

  def nfl_leaders
    stat_leaders = Stattleship::FootballStatLeaders.new
    stat_leaders.extend(Stattleship::StatLeadersRepresenter)

    json = File.read('spec/fixtures/nfl/stat_leaders.json')

    stat_leaders.from_json(json)
    stat_leaders.data
  end

  def total_player_stat
    tps = Stattleship::TotalPlayerStat.new
    tps.extend(Stattleship::TotalPlayerStatRepresenter)

    json = File.read('spec/fixtures/nfl/total_player_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nba_total_player_stat
    tps = Stattleship::BasketballTotalPlayerStat.new
    tps.extend(Stattleship::BasketballTotalPlayerStatRepresenter)

    json = File.read('spec/fixtures/nba/total_player_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nfl_total_player_stat
    tps = Stattleship::FootballTotalPlayerStat.new
    tps.extend(Stattleship::FootballTotalPlayerStatRepresenter)

    json = File.read('spec/fixtures/nfl/total_player_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nhl_total_player_stat
    tps = Stattleship::HockeyTotalPlayerStat.new
    tps.extend(Stattleship::HockeyTotalPlayerStatRepresenter)

    json = File.read('spec/fixtures/nhl/total_player_stat.json')

    tps.from_json(json)
    tps.data
  end

  def total_team_stat
    tps = Stattleship::TotalTeamStat.new
    tps.extend(Stattleship::TotalTeamStatRepresenter)

    json = File.read('spec/fixtures/nfl/total_team_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nba_total_team_stat
    tps = Stattleship::BasketballTotalTeamStat.new
    tps.extend(Stattleship::BasketballTotalTeamStatRepresenter)

    json = File.read('spec/fixtures/nba/total_team_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nfl_total_team_stat
    tps = Stattleship::FootballTotalTeamStat.new
    tps.extend(Stattleship::FootballTotalTeamStatRepresenter)

    json = File.read('spec/fixtures/nfl/total_team_stat.json')

    tps.from_json(json)
    tps.data
  end

  def nhl_total_team_stat
    tps = Stattleship::HockeyTotalTeamStat.new
    tps.extend(Stattleship::HockeyTotalTeamStatRepresenter)

    json = File.read('spec/fixtures/nhl/total_team_stat.json')

    tps.from_json(json)
    tps.data
  end

  def top_stats
    top_stats = Stattleship::TopStats.new
    top_stats.extend(Stattleship::TopStatsRepresenter)

    json = File.read('spec/fixtures/nba/top_stats.json')

    top_stats.from_json(json)
    top_stats.data
  end

  def nba_top_stats
    top_stats = Stattleship::BasketballTopStats.new
    top_stats.extend(Stattleship::BasketballTopStatsRepresenter)

    json = File.read('spec/fixtures/nba/top_stats.json')

    top_stats.from_json(json)
    top_stats.data
  end

  def nfl_top_stats
    top_stats = Stattleship::FootballTopStats.new
    top_stats.extend(Stattleship::FootballTopStatsRepresenter)

    json = File.read('spec/fixtures/nfl/top_stats.json')

    top_stats.from_json(json)
    top_stats.data
  end

  def nhl_top_stats
    top_stats = Stattleship::HockeyTopStats.new
    top_stats.extend(Stattleship::HockeyTopStatsRepresenter)

    json = File.read('spec/fixtures/nhl/top_stats.json')

    top_stats.from_json(json)
    top_stats.data
  end

  def nba_team_game_logs
    nba_team_game_logs = Stattleship::BasketballTeamGameLogs.new
    nba_team_game_logs.extend(Stattleship::BasketballTeamGameLogsRepresenter)

    json = File.read('spec/fixtures/nba/team_game_logs.json')

    nba_team_game_logs.from_json(json)
    nba_team_game_logs.data
  end

  def nfl_team_game_logs
    nfl_team_game_logs = Stattleship::FootballTeamGameLogs.new
    nfl_team_game_logs.extend(Stattleship::FootballTeamGameLogsRepresenter)

    json = File.read('spec/fixtures/nfl/team_game_logs.json')

    nfl_team_game_logs.from_json(json)
    nfl_team_game_logs.data
  end

  def nhl_team_game_logs
    nhl_team_game_logs = Stattleship::HockeyTeamGameLogs.new
    nhl_team_game_logs.extend(Stattleship::HockeyTeamGameLogsRepresenter)

    json = File.read('spec/fixtures/nhl/team_game_logs.json')

    nhl_team_game_logs.from_json(json)
    nhl_team_game_logs.data
  end

  def nba_games
    nba_games = Stattleship::BasketballGames.new
    nba_games.extend(Stattleship::BasketballGamesRepresenter)

    json = File.read('spec/fixtures/nba/games.json')

    nba_games.from_json(json)
    nba_games.data
  end

  def nfl_games
    nfl_games = Stattleship::FootballGames.new
    nfl_games.extend(Stattleship::FootballGamesRepresenter)

    json = File.read('spec/fixtures/nfl/games.json')

    nfl_games.from_json(json)
    nfl_games.data
  end

  def nhl_games
    nhl_games = Stattleship::HockeyGames.new
    nhl_games.extend(Stattleship::HockeyGamesRepresenter)

    json = File.read('spec/fixtures/nhl/games.json')

    nhl_games.from_json(json)
    nhl_games.data
  end

  def nba_players
    nba_players = Stattleship::BasketballPlayers.new
    nba_players.extend(Stattleship::BasketballPlayersRepresenter)

    json = File.read('spec/fixtures/nba/players.json')

    nba_players.from_json(json)
    nba_players.data
  end

  def nfl_players
    nfl_players = Stattleship::FootballPlayers.new
    nfl_players.extend(Stattleship::FootballPlayersRepresenter)

    json = File.read('spec/fixtures/nfl/players.json')

    nfl_players.from_json(json)
    nfl_players.data
  end

  def nhl_players
    nhl_players = Stattleship::HockeyPlayers.new
    nhl_players.extend(Stattleship::HockeyPlayersRepresenter)

    json = File.read('spec/fixtures/nhl/players.json')

    nhl_players.from_json(json)
    nhl_players.data
  end

  def nba_teams
    nba_teams = Stattleship::BasketballTeams.new
    nba_teams.extend(Stattleship::BasketballTeamsRepresenter)

    json = File.read('spec/fixtures/nba/teams.json')

    nba_teams.from_json(json)
    nba_teams.data
  end

  def nfl_teams
    nfl_teams = Stattleship::FootballTeams.new
    nfl_teams.extend(Stattleship::FootballTeamsRepresenter)

    json = File.read('spec/fixtures/nfl/teams.json')

    nfl_teams.from_json(json)
    nfl_teams.data
  end

  def nhl_teams
    nhl_teams = Stattleship::HockeyTeams.new
    nhl_teams.extend(Stattleship::HockeyTeamsRepresenter)

    json = File.read('spec/fixtures/nhl/teams.json')

    nhl_teams.from_json(json)
    nhl_teams.data
  end

  def player_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nba/player_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nba_player_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nba/player_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nfl_player_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nfl/player_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nhl_player_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nhl/player_stats.json')

    stats.from_json(json)
    stats.data
  end

  def team_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nba/team_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nba_team_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nba/team_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nfl_team_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nfl/team_stats.json')

    stats.from_json(json)
    stats.data
  end

  def nhl_team_stats
    stats = Stattleship::Stats.new
    stats.extend(Stattleship::StatsRepresenter)

    json = File.read('spec/fixtures/nhl/team_stats.json')

    stats.from_json(json)
    stats.data
  end

  def player_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nfl/player_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nba_player_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nba/player_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nfl_player_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nfl/player_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nhl_player_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nhl/player_feats.json')

    feats.from_json(json)
    feats.data
  end

  def team_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nfl/team_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nba_team_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nba/team_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nfl_team_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nfl/team_feats.json')

    feats.from_json(json)
    feats.data
  end

  def nhl_team_feats
    feats = Stattleship::Feats.new
    feats.extend(Stattleship::FeatsRepresenter)

    json = File.read('spec/fixtures/nhl/team_feats.json')

    feats.from_json(json)
    feats.data
  end

  def injuries
    injuries = Stattleship::Injuries.new
    injuries.extend(Stattleship::InjuriesRepresenter)

    json = File.read('spec/fixtures/nfl/injuries.json')

    injuries.from_json(json)
    injuries.data
  end

  def nba_injuries
    injuries = Stattleship::Injuries.new
    injuries.extend(Stattleship::InjuriesRepresenter)

    json = File.read('spec/fixtures/nba/injuries.json')

    injuries.from_json(json)
    injuries.data
  end

  def nfl_injuries
    injuries = Stattleship::Injuries.new
    injuries.extend(Stattleship::InjuriesRepresenter)

    json = File.read('spec/fixtures/nfl/injuries.json')

    injuries.from_json(json)
    injuries.data
  end

  def nhl_injuries
    injuries = Stattleship::Injuries.new
    injuries.extend(Stattleship::InjuriesRepresenter)

    json = File.read('spec/fixtures/nhl/injuries.json')

    injuries.from_json(json)
    injuries.data
  end

  def nba_penalties
    penalties = Stattleship::Penalties.new
    penalties.extend(Stattleship::PenaltiesRepresenter)

    json = File.read('spec/fixtures/nba/penalties.json')

    penalties.from_json(json)
    penalties.data
  end

  def nfl_penalties
    penalties = Stattleship::Penalties.new
    penalties.extend(Stattleship::PenaltiesRepresenter)

    json = File.read('spec/fixtures/nfl/penalties.json')

    penalties.from_json(json)
    penalties.data
  end

  def nhl_penalties
    penalties = Stattleship::Penalties.new
    penalties.extend(Stattleship::PenaltiesRepresenter)

    json = File.read('spec/fixtures/nhl/penalties.json')

    penalties.from_json(json)
    penalties.data
  end

def nba_scoring_plays
    scoring_plays = Stattleship::ScoringPlays.new
    scoring_plays.extend(Stattleship::ScoringPlaysRepresenter)

    json = File.read('spec/fixtures/nba/scoring_plays.json')

    scoring_plays.from_json(json)
    scoring_plays.data
  end

  def nfl_scoring_plays
    scoring_plays = Stattleship::ScoringPlays.new
    scoring_plays.extend(Stattleship::ScoringPlaysRepresenter)

    json = File.read('spec/fixtures/nfl/scoring_plays.json')

    scoring_plays.from_json(json)
    scoring_plays.data
  end

  def nhl_scoring_plays
    scoring_plays = Stattleship::ScoringPlays.new
    scoring_plays.extend(Stattleship::ScoringPlaysRepresenter)

    json = File.read('spec/fixtures/nhl/scoring_plays.json')

    scoring_plays.from_json(json)
    scoring_plays.data
  end

  def nba_team_outcome_streaks
    team_outcome_streaks = Stattleship::TeamOutcomeStreaks.new
    team_outcome_streaks.extend(Stattleship::TeamOutcomeStreaksRepresenter)

    json = File.read('spec/fixtures/nba/team_outcome_streaks.json')

    team_outcome_streaks.from_json(json)
    team_outcome_streaks.data
  end

  def nfl_team_outcome_streaks
    team_outcome_streaks = Stattleship::TeamOutcomeStreaks.new
    team_outcome_streaks.extend(Stattleship::TeamOutcomeStreaksRepresenter)

    json = File.read('spec/fixtures/nfl/team_outcome_streaks.json')

    team_outcome_streaks.from_json(json)
    team_outcome_streaks.data
  end

  def nhl_team_outcome_streaks
    team_outcome_streaks = Stattleship::TeamOutcomeStreaks.new
    team_outcome_streaks.extend(Stattleship::TeamOutcomeStreaksRepresenter)

    json = File.read('spec/fixtures/nhl/team_outcome_streaks.json')

    team_outcome_streaks.from_json(json)
    team_outcome_streaks.data
  end
end
