# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyScoringPlaysParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nhl-dal'

# may need to adjust this depending on time of year
query_params.since = 'last month'
query_params.status = 'ended'

# fetch will automatically traverse the paginated response links
scoring_plays = Stattleship::HockeyScoringPlays.fetch(params: query_params)

# the populated object
pp scoring_plays.first

# can access friendly helpers
pp scoring_plays.first.to_sentence

# "Jamie Benn (Valeri Nichushkin, Alex Goligoski) - 02:43 of 2P - vs Calgary 01/25/16"

# or, individual attributes
scoring_plays.each do |scoring_play|
  pp scoring_play.assists.map(&:player_name)
end

# ["Valeri Nichushkin", "Alex Goligoski"]
# ["John Klingberg", "Patrick Sharp"]
# ["Antoine Roussel", "Ales Hemsky"]
# ["Johnny Oduya"]
# ["Patrick Sharp", "John Klingberg"]
# ["Cody Eakin", "Jason Spezza"]
# ["Mattias Janmark", "Antoine Roussel"]
# ["Patrick Sharp", "Valeri Nichushkin"]
# ["Mattias Janmark", "Antoine Roussel"]
# ["Jamie Benn"]
# ["Jamie Benn", "Tyler Seguin"]
# ["Travis Moen"]
# ["Jason Spezza", "Jason Demers"]
# ["Patrick Sharp", "Jason Spezza"]
# ["Patrick Sharp", "Mattias Janmark"]
# ["Jason Spezza", "Alex Goligoski"]
# ["Patrick Sharp", "Jason Spezza"]
# ["Radek Faksa", "Travis Moen"]
# ["Alex Goligoski", "John Klingberg"]
# ...
