# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballGameLogsParams.new

# use a slug, typically 'league-firstname-lastname'
query_params.player_id = 'nfl-cam-newton'

# may need to adjust this depending on time of year/NFL season
query_params.since = '1 month ago'
# query_params.interval_type = 'conferencechampionships'
# query_params.interval_type = 'divisionalplayoffs'
# query_params.interval_type = 'wildcard'
# query_params.interval_type = 'week'
# query_params.interval_type = 'preseason'

# fetch will automatically traverse the paginated response links
game_logs = Stattleship::FootballGameLogs.fetch(params: query_params)

# the populated object
pp game_logs.first

# can access friendly helpers
pp game_logs.first.to_sentence

# "Cam Newton 139 RTG, 21 CMP, 293 YDS, 2 TD, 6 R, 10 RYDS, 2 RTD, 12 PTS (Buccaneers vs Panthers January  3, 2016 at  4:25pm)"

# or, individual attributes
game_logs.each do |game_log|
  pp game_log.passes_touchdowns
end

# 2
