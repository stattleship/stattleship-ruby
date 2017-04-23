# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballScoreboardsParams.new

# may need to adjust this depending on time of year/NBA season
query_params.season_id = 'nba-2016-2017'
query_params.game_id = 'nba-2016-2017-sa-mem-2017-04-22-2000'

# fetch will automatically traverse the paginated response links
scoreboards = Stattleship::BasketballScoreboards.fetch(params: query_params)

# the populated object
pp scoreboards.first

# can access friendly helpers
pp scoreboards.first.to_sentence

# or, individual attributes
scoreboards.each do |game_log|
  pp game_log.score
end
