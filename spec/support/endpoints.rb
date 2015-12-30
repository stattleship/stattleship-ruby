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
end
