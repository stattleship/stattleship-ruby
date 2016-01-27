# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballFeatsParams.new

# use a slug, typically 'league-firstname-lastname'
query_params.player_id = 'nfl-cam-newton'
query_params.level_up = 2

# fetch will automatically traverse the paginated response links
feats = Stattleship::FootballFeats.fetch(params: query_params)

# the populated object
pp feats.first

# can access friendly helpers
pp feats.first.to_sentence

# "Cam Newton threw a 59 yard-long pass vs. the Packers on Sunday November  8, 2015 at  1:00pm"

# or, individual attributes
feats.each do |feat|
  pp "#{feat.actual.to_i} #{feat.name} #{feat.humanized_stat_type} #{feat.vs}"
end

# "59 Cam Newton yard-long pass vs. the Packers"
# "55 Cam Newton yard-long pass vs. the Saints"
# "74 Cam Newton yard-long pass vs. the Falcons"
# "3 Cam Newton touchdowns vs. the Packers"
# "3 Cam Newton touchdowns vs. the Falcons"
# "5 Cam Newton touchdowns vs. the Redskins"
# "5 Cam Newton touchdowns vs. the Saints"
# "5 Cam Newton touchdowns vs. the Giants"
# "269 Cam Newton passing yards vs. the Seahawks"
# "248 Cam Newton passing yards vs. the Colts"
# "297 Cam Newton passing yards vs. the Packers"
# "246 Cam Newton passing yards vs. the Redskins"
# "331 Cam Newton passing yards vs. the Saints"
# "265 Cam Newton passing yards vs. the Falcons"
# ...
