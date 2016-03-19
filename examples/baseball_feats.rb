# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::BaseballFeatsParams.new

# use a slug, typically 'league-firstname-lastname'
query_params.interval_type = 'preseason'
query_params.season_id = 'mlb-2016'
query_params.level_up = 3
query_params.since = '1 week ago'

# fetch will automatically traverse the paginated response links
feats = Stattleship::BaseballFeats.fetch(params: query_params)

# the populated object
pp feats.first

# can access friendly helpers
pp feats.first.to_sentence

# ""

# or, individual attributes
feats.each do |feat|
  pp "#{feat.actual.to_i} #{feat.name} #{feat.humanized_stat_type} #{feat.vs}"
end

# ...
