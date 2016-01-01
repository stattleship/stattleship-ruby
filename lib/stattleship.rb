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

require 'stattleship/models/game'
require 'stattleship/models/league'
require 'stattleship/models/player'
require 'stattleship/models/season'
require 'stattleship/models/team'
require 'stattleship/models/venue'

require 'stattleship/params/query_params'
require 'stattleship/params/stat_leaders_params'
require 'stattleship/params/basketball_stat_leaders_params'
require 'stattleship/params/football_stat_leaders_params'
require 'stattleship/params/hockey_stat_leaders_params'
require 'stattleship/params/game_time_params'
require 'stattleship/params/game_logs_params'
require 'stattleship/params/basketball_game_logs_params'
require 'stattleship/params/football_game_logs_params'
require 'stattleship/params/hockey_game_logs_params'

require 'stattleship/game_logs'
require 'stattleship/basketball_game_logs'
require 'stattleship/football_game_logs'
require 'stattleship/hockey_game_logs'

require 'stattleship/stat_leaders'
require 'stattleship/basketball_stat_leaders'
require 'stattleship/football_stat_leaders'
require 'stattleship/hockey_stat_leaders'

Dotenv.load
