require 'addressable/uri'
require 'addressable/template'
require 'bigdecimal'
require 'bigdecimal/util'
require 'date'
require 'dotenv'
require 'link_header'
require 'net/https'
require 'ordinalize'
require 'ostruct'
require 'roar/coercion'
require 'roar/json'

require 'stattleship/version'

require 'stattleship/client/configuration'
require 'stattleship/client/client'

require 'stattleship/endpoint'
require 'stattleship/formatters/stat_formatter'
require 'stattleship/models'
require 'stattleship/params'
require 'stattleship/validators'

require 'stattleship/feats'
require 'stattleship/football_feats'
require 'stattleship/basketball_feats'
require 'stattleship/hockey_feats'

require 'stattleship/games'
require 'stattleship/basketball_games'
require 'stattleship/football_games'
require 'stattleship/hockey_games'

require 'stattleship/game_logs'
require 'stattleship/basketball_game_logs'
require 'stattleship/football_game_logs'
require 'stattleship/hockey_game_logs'

require 'stattleship/injuries'
require 'stattleship/basketball_injuries'
require 'stattleship/football_injuries'
require 'stattleship/hockey_injuries'

require 'stattleship/penalties'
require 'stattleship/basketball_penalties'
require 'stattleship/football_penalties'
require 'stattleship/hockey_penalties'

require 'stattleship/players'
require 'stattleship/basketball_players'
require 'stattleship/football_players'
require 'stattleship/hockey_players'

require 'stattleship/scoring_plays'
require 'stattleship/basketball_scoring_plays'
require 'stattleship/football_scoring_plays'
require 'stattleship/hockey_scoring_plays'

require 'stattleship/stat_leaders'
require 'stattleship/basketball_stat_leaders'
require 'stattleship/football_stat_leaders'
require 'stattleship/hockey_stat_leaders'

require 'stattleship/stats'
require 'stattleship/basketball_stats'
require 'stattleship/football_stats'
require 'stattleship/hockey_stats'

require 'stattleship/teams'
require 'stattleship/basketball_teams'
require 'stattleship/football_teams'
require 'stattleship/hockey_teams'

require 'stattleship/team_game_logs'
require 'stattleship/basketball_team_game_logs'
require 'stattleship/football_team_game_logs'
require 'stattleship/hockey_team_game_logs'

require 'stattleship/team_outcome_streaks'
require 'stattleship/basketball_team_outcome_streaks'
require 'stattleship/football_team_outcome_streaks'
require 'stattleship/hockey_team_outcome_streaks'

require 'stattleship/total_player_stat'
require 'stattleship/basketball_total_player_stat'
require 'stattleship/football_total_player_stat'
require 'stattleship/hockey_total_player_stat'

require 'stattleship/total_team_stat'
require 'stattleship/basketball_total_team_stat'
require 'stattleship/football_total_team_stat'
require 'stattleship/hockey_total_team_stat'

require 'stattleship/top_stats'
require 'stattleship/basketball_top_stats'
require 'stattleship/football_top_stats'
require 'stattleship/hockey_top_stats'

Dotenv.load
