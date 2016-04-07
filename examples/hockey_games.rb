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
  pp game.winning_scoreline
  pp game.losing_scoreline
end

# "Coyotes 2 - Blackhawks 6"
# "Blackhawks 6 - Coyotes 2"
# "Coyotes 2 - Blackhawks 6"
# "Bruins 4 - Blackhawks 6"
# "Blackhawks 6 - Bruins 4"
# "Bruins 4 - Blackhawks 6"
# "Blackhawks 5 - Jets 4"
# "Blackhawks 5 - Jets 4"
# "Jets 4 - Blackhawks 5"
# "Blackhawks 1 - Wild 4"
# "Wild 4 - Blackhawks 1"
# "Blackhawks 1 - Wild 4"
# "Blackhawks 3 - Canucks 2"
# "Blackhawks 3 - Canucks 2"
# "Canucks 2 - Blackhawks 3"
# "Blackhawks 4 - Flames 1"
# "Blackhawks 4 - Flames 1"
# "Flames 1 - Blackhawks 4"
# ...
