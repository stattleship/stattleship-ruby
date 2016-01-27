# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballTotalPlayerStatParams.new

# use a slug, typically 'league-firstname-lastname'
query_params.player_id = 'nfl-adrian-peterson'
query_params.type = 'football_rushing_stat'
query_params.stat = 'rushes_attempts'

# fetch will automatically traverse the paginated response links
total_stat = Stattleship::FootballTotalPlayerStat.fetch(params: query_params)

# the populated object
pp total_stat

# can access friendly helpers
pp total_stat.to_sentence

# "Adrian Peterson has 327 rushes_attempts"

# or, individual attributes
pp "#{total_stat.player.last_name} weighs #{total_stat.player.weight} #{total_stat.player.unit_of_weight} and had #{total_stat.total.to_i} rushes"

# "Peterson weighs 220 pounds and had 327 rushes"
