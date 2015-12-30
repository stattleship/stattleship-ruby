require 'addressable/uri'
require 'addressable/template'
require 'dotenv'
require 'net/https'
require 'ordinalize'
require 'ostruct'
require 'roar/json'

require 'stattleship/version'
require 'stattleship/configuration'
require 'stattleship/client'

require 'stattleship/game'
require 'stattleship/league'
require 'stattleship/player'
require 'stattleship/season'
require 'stattleship/team'
require 'stattleship/venue'

require 'stattleship/game_logs'

require 'stattleship/basketball_game_logs'
require 'stattleship/stat_leaders'
require 'stattleship/basketball_stat_leaders'
require 'stattleship/football_stat_leaders'
require 'stattleship/hockey_stat_leaders'
Dotenv.load
