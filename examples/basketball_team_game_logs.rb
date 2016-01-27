# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballTeamGameLogsParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nba-cle'

# may need to adjust this depending on time of year/NBA season
query_params.since = '1 week ago'

# fetch will automatically traverse the paginated response links
game_logs = Stattleship::BasketballTeamGameLogs.fetch(params: query_params)

# the populated object
pp game_logs.first

# can access friendly helpers
pp game_logs.first.to_sentence

# "Cleveland 42 FGM, 50.6 FG%, 115 PTS, 33 DRB, 14 ORB, 47 REB (Clippers vs Cavaliers January 21, 2016 at  8:00pm)"

# or, individual attributes
game_logs.each do |game_log|
  pp game_log.three_pointers_made
end

# 13
# 11
# 4
# 5
