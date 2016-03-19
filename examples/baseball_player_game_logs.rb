# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BaseballGameLogsParams.new

# use a slug

query_params.player_id = 'mlb-pablo-sandoval'
query_params.season_id = 'mlb-2015'
query_params.interval_type = 'regularseason'
query_params.since = '1 year ago'

# fetch will automatically traverse the paginated response links
game_logs = Stattleship::BaseballGameLogs.fetch(params: query_params)

# the populated object
pp game_logs.first

# can access friendly helpers
pp game_logs.first.to_sentence

# or, individual attributes
game_logs.each do |game_log|
  pp game_log.to_sentence
end

