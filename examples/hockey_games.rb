# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyGamesParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nhl-chi'

# may need to adjust this depending on time of year
query_params.status = 'ended'
query_params.since = '2 weeks ago'

# fetch will automatically traverse the paginated response links
games = Stattleship::HockeyGames.fetch(params: query_params)

# the populated object
pp games.first

# can access friendly helpers
pp games.first.started_at.strftime('%b %e, %l:%M %p')

# "Jan 26,  7:30 PM"

# or, individual attributes
games.each do |game|
  pp game.scoreline
end

# "Blackhawks 0 - Hurricanes 5"
# "Blues 0 - Blackhawks 2"
# "Blackhawks 0 - Panthers 4"
# "Blackhawks 1 - Lightning 2"
# "Blackhawks 4 - Predators 1"
# "Canadiens 2 - Blackhawks 5"
# "Blackhawks 4 - Maple Leafs 1"
# "Blackhawks 2 - Canadiens 1"
# "Predators 2 - Blackhawks 3"
# ...
