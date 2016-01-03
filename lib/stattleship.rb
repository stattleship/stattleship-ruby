require 'addressable/uri'
require 'addressable/template'
require 'dotenv'
require 'link_header'
require 'net/https'
require 'ordinalize'
require 'ostruct'
require 'roar/json'

require 'stattleship/version'

require 'stattleship/client/configuration'
require 'stattleship/client/client'

require 'stattleship/endpoint'
require 'stattleship/models'
require 'stattleship/params'
require 'stattleship/validators'

require 'stattleship/games'
require 'stattleship/basketball_games'
require 'stattleship/football_games'
require 'stattleship/hockey_games'

require 'stattleship/game_logs'
require 'stattleship/basketball_game_logs'
require 'stattleship/football_game_logs'
require 'stattleship/hockey_game_logs'

require 'stattleship/players'
require 'stattleship/basketball_players'
require 'stattleship/football_players'
require 'stattleship/hockey_players'

require 'stattleship/stat_leaders'
require 'stattleship/basketball_stat_leaders'
require 'stattleship/football_stat_leaders'
require 'stattleship/hockey_stat_leaders'

require 'stattleship/team_game_logs'
require 'stattleship/basketball_team_game_logs'
require 'stattleship/football_team_game_logs'
require 'stattleship/hockey_team_game_logs'

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
