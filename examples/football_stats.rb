# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballStatsParams.new

# the stat must belong to the type, see: http://playbook.stattleship.com/#basketball-stats for a list
query_params.player_id = 'nfl-aaron-rodgers'
query_params.type = 'football_passing_stat'
query_params.stat = 'passes_touchdowns'

# fetch will automatically traverse the paginated response links
stats = Stattleship::FootballStats.fetch(params: query_params)

# the populated object
pp stats.first

# can access friendly helpers
pp stats.first.to_sentence

# "Aaron Rodgers had 1 passes_touchdowns on Vikings vs Packers January  3, 2016 at  7:30pm"

# or, individual attributes
stats.each do |stat|
  pp "#{stat.name} threw #{stat.stat.to_i} TD in a #{stat.game.weather_conditions} game"
end

# "Aaron Rodgers threw 1 TD in a cloudy game"
# "Aaron Rodgers threw 1 TD in a dome game"
# "Aaron Rodgers threw 1 TD in a cloudy game"
# "Aaron Rodgers threw 2 TD in a heavy-rain game"
# "Aaron Rodgers threw 2 TD in a dome game"
# "Aaron Rodgers threw 1 TD in a light-rain game"
# "Aaron Rodgers threw 2 TD in a cloudy game"
# "Aaron Rodgers threw 2 TD in a sunny game"
# "Aaron Rodgers threw 4 TD in a cloudy game"
# "Aaron Rodgers threw 0 TD in a partly-cloudy game"
# "Aaron Rodgers threw 2 TD in a sunny game"
# "Aaron Rodgers threw 2 TD in a sunny game"
# "Aaron Rodgers threw 1 TD in a sunny game"
# "Aaron Rodgers threw 5 TD in a light-rain game"
# "Aaron Rodgers threw 2 TD in a sunny game"
# "Aaron Rodgers threw 3 TD in a sunny game"
# ...
