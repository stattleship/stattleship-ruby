# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballTopStatsParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.stat = 'rebounds_offensive'
query_params.type = 'basketball_rebounding_stat'
query_params.place = 3

# fetch will automatically traverse the paginated response links
top_stats = Stattleship::BasketballTopStats.fetch(params: query_params)

# the populated object
pp top_stats

# can access friendly helpers
pp top_stats.first.to_sentence

# "Tyson Chandler had 13 rebounds_offensive in Hawks vs Suns January 23, 2016 at  7:00pm for the first best performance"

# or, individual attributes
top_stats.each do |top_stat|
pp "#{top_stat.player.name} - #{top_stat.format_stat(top_stat.stat)} ORB - #{top_stat.place} best performance on #{top_stat.game.short_date}"
end

# "Tyson Chandler - 13 ORB - 1 best performance on 01/23/16"
# "Tristan Thompson - 11 ORB - 2 best performance on 12/17/15"
# "Andre Drummond - 11 ORB - 2 best performance on 12/11/15"
# "Andre Drummond - 11 ORB - 2 best performance on 11/ 3/15"
# "Dwight Howard - 10 ORB - 3 best performance on 01/18/16"
# "Trevor Booker - 10 ORB - 3 best performance on 12/30/15"
# "Ed Davis - 10 ORB - 3 best performance on 11/20/15"
# "Greg Monroe - 10 ORB - 3 best performance on 01/15/16"
# "Andre Drummond - 10 ORB - 3 best performance on 12/18/15"
# "Andre Drummond - 10 ORB - 3 best performance on 11/29/15"
