# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

pp File.join(dir, 'stattleship')

# Construct params for the fetch
query_params = Stattleship::Params::PitchesParams.new

query_params.season_id = 'mlb-2017'
query_params.interval_type = 'preseason'
query_params.game_id = 'mlb-2017-cin-kc-2017-03-20-1605'


# query_params.pitch_outcome_type = 'aHR'
# query_params.inning = 9
# query_params.speed_and_over = 103
# query_params.pitcher_id = 'mlb-aroldis-chapman'

# fetch will automatically traverse the paginated response links
pitches = Stattleship::Pitches.fetch(params: query_params)

pp pitches.map(&:to_sentence)
