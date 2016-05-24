# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballScoringPlaysParams.new

# may need to adjust this depending on time of year
query_params.season_id = 'nfl-2015-2016'
query_params.game_id = 'nfl-2015-2016-nyj-dal-2015-12-19-1925'

# fetch will automatically traverse the paginated response links
scoring_plays = Stattleship::FootballScoringPlays.fetch(params: query_params)

# or, individual attributes
scoring_plays.each do |scoring_play|
  # puts scoring_play.scoring_players.map(&:player).map(&:name)
  # pp scoring_play.to_sentence if scoring_play.scoring_players.map(&:player).map(&:team_slug).include?('nfl-nyj')
  puts scoring_play.to_sentence
end

