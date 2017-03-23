# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::AtBatsParams.new

query_params.season_id = 'mlb-2016'
query_params.interval_type = 'regularseason'
query_params.hitter_id = 'mlb-bryce-harper'
query_params.hit_type = 'GB'

# fetch will automatically traverse the paginated response links
at_bats = Stattleship::AtBats.fetch(params: query_params)

pp at_bats.map(&:to_sentence)

at_bats.each do |at_bat|
  pp at_bat.pitches.map(&:to_sentence)
end
