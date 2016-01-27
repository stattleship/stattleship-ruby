# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballInjuriesParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nba-sa'

# fetch will automatically traverse the paginated response links
injuries = Stattleship::BasketballInjuries.fetch(params: query_params)

# the populated object
pp injuries.first

# or, individual attributes
pp injuries.first.note

# "Duncan missed last game due to soreness in his right knee and will not suit up against the Rockets on Wednesday."

injuries.each do |injury|
  pp injury.location_name
end

# "Knee"
# "Back"
# "Hip"
# "Hip"
# "Rest"
# ...
