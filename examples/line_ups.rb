# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::LineUpsParams.new

query_params.season_id = 'mlb-2017'
query_params.interval_type = 'preseason'
query_params.since = '1 week ago'
query_params.team_id = 'mlb-bos'

# fetch will automatically traverse the paginated response links
line_ups = Stattleship::LineUps.fetch(params: query_params)

pp line_ups.map(&:to_sentence)
