# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyTotalTeamStatParams.new

# use a slug, typically 'league-team_abbreviation'
# we know that you'll want the `hockey_team_stat' type, so no need to specify that
query_params.team_id = 'nhl-mon'
query_params.stat = 'goals_period_3'

# fetch will automatically traverse the paginated response links
total_stat = Stattleship::HockeyTotalTeamStat.fetch(params: query_params)

# the populated object
pp total_stat

# can access friendly helpers
pp total_stat.to_sentence

# "The Montreal Canadiens have 46 goals_period_3"

# or, individual attributes
pp "#{total_stat.team.nickname} who play in #{total_stat.team.location} had #{total_stat.total.to_i} goals in the 3rd period"

# "Canadiens who play in Montreal had 46 goals in the 3rd period"
