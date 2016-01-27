# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyPenaltiesParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nhl-buf'

# may need to adjust this depending on time of year
query_params.status = 'ended'
query_params.since = '2 weeks ago'

# fetch will automatically traverse the paginated response links
penalties = Stattleship::HockeyPenalties.fetch(params: query_params)

# the populated object
pp penalties.first

# can access friendly helpers
pp penalties.first.to_sentence

# "Zach Bogosian (Buffalo) - Slashing - 2 minutes - 11:39 of 1P - vs Ottawa 01/26/16"

# or, individual attributes
penalties.each do |penalty|
  pp penalty.minutes
end

# 2
# 5
# 2
# 2
# 2
# 2
# 2
# 2
# 2
# 2
# 4
# ...
