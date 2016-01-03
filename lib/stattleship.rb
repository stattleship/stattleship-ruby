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

require 'stattleship/game_logs'
require 'stattleship/basketball_game_logs'
require 'stattleship/football_game_logs'
require 'stattleship/hockey_game_logs'

require 'stattleship/stat_leaders'
require 'stattleship/basketball_stat_leaders'
require 'stattleship/football_stat_leaders'
require 'stattleship/hockey_stat_leaders'

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
