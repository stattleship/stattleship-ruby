# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballTeamOutcomeStreaksParams.new
query_params.current = true
query_params.outcome = 'win'

# fetch will automatically traverse the paginated response links
streaks = Stattleship::BasketballTeamOutcomeStreaks.fetch(params: query_params)

# Atlanta Hawks are currently on a 2 game winning streak starting Mar 12
# Golden State Warriors are currently on a 5 game winning streak starting Mar 07
# Milwaukee Bucks are currently on a 3 game winning streak starting Mar 09
# San Antonio Spurs are currently on a 3 game winning streak starting Mar 08
# Utah Jazz are currently on a 3 game winning streak starting Mar 11

# or, individual attributes
streaks.each do |streak|
  puts streak.to_sentence if streak.streak_length > 1
end
