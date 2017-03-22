# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::PitchesParams.new

query_params.season_id = 'mlb-2016'
query_params.interval_type = 'regularseason'
query_params.pitch_outcome_type = 'aHR'
query_params.pitcher_id = 'mlb-aroldis-chapman'

# fetch will automatically traverse the paginated response links
pitches = Stattleship::Pitches.fetch(params: query_params)

pp pitches
