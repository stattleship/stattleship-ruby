# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballGameLogsParams.new

# use a slug, typically 'league-firstname-lastname'
query_params.player_id = 'nba-stephen-curry'

# may need to adjust this depending on time of year/NBA season
query_params.since = '1 week ago'

# fetch will automatically traverse the paginated response links
game_logs = Stattleship::BasketballGameLogs.fetch(params: query_params)

# the populated object
pp game_logs.first

# can access friendly helpers
pp game_logs.first.to_sentence

# or, individual attributes
game_logs.each do |game_log|
  pp game_log.three_pointers_made
end
