# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BaseballStatLeadersParams.new

query_params.type = 'baseball_hitter_stat'
query_params.stat = 'home_runs'
query_params.place = 3

# fetch will automatically traverse the paginated response links
stat_leaders = Stattleship::BaseballStatLeaders.fetch(params: query_params)

# the populated object
pp stat_leaders.first

# can access friendly helpers
pp stat_leaders.first.to_sentence


# or, individual attributes
stat_leaders.each do |stat_leader|
  pp "#{stat_leader.place} - #{stat_leader.player_name} with #{stat_leader.stat.to_i} HR"
end
