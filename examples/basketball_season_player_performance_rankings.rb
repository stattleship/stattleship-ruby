# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::RankingsParams.new

# use a slug

query_params.ranking = 'basketball_season_player_performance_ranking'
query_params.place = 10

# fetch will automatically traverse the paginated response links
rankings = Stattleship::Rankings.fetch(params: query_params)

# the populated object
pp rankings.first

# can access friendly helpers
pp rankings.first.player_name

# or, individual attributes
rankings.each do |ranking|
  pp ranking.to_sentence
end

