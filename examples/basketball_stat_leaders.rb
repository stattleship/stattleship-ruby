# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BasketballStatLeadersParams.new

# the stat must belong to the type, see: http://playbook.stattleship.com/#basketball-stats for a list
query_params.type = 'basketball_offensive_stat'
query_params.stat = 'three_pointers_made'
query_params.place = 5

# fetch will automatically traverse the paginated response links
stat_leaders = Stattleship::BasketballStatLeaders.fetch(params: query_params)

# the populated object
pp stat_leaders.first

# can access friendly helpers
pp stat_leaders.first.to_sentence

# "Stephen Curry is in first place with 210 three_pointers_made"

# or, individual attributes
stat_leaders.each do |stat_leader|
  pp "#{stat_leader.place} - #{stat_leader.player_name} with #{stat_leader.stat.to_i} threes"
end

# "1 - Stephen Curry with 210 threes"
# "2 - Klay Thompson with 133 threes"
# "3 - Paul George with 128 threes"
# "3 - James Harden with 128 threes"
# "4 - Kyle Lowry with 125 threes"
# "5 - Damian Lillard with 121 threes"
# ...
