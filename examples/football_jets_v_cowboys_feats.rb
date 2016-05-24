# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballFeatsParams.new

query_params.season_id = 'nfl-2015-2016'

query_params.game_id = 'nfl-2015-2016-nyj-dal-2015-12-19-1925'
query_params.level_up = 2

# fetch will automatically traverse the paginated response links
feats = Stattleship::FootballFeats.fetch(params: query_params)

# the populated object
# pp feats.first

# can access friendly helpers
# pp feats.first.to_sentence

# "Cam Newton threw a 59 yard-long pass vs. the Packers on Sunday November  8, 2015 at  1:00pm"

# or, individual attributes
feats.each do |feat|
  pp "#{feat.subject_name} (#{feat.team.name}) #{feat.actual.to_i} #{feat.humanized_stat_type} - Level #{feat.level}"
end
