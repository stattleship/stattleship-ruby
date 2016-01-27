# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::FootballPlayersParams.new

# use a slug, typically 'league-team_abbreviation'
query_params.team_id = 'nfl-den'

# fetch will automatically traverse the paginated response links
players = Stattleship::FootballPlayers.fetch(params: query_params)

# the populated object
pp players.first

# can access friendly helpers
pp players.first.label

# "C.J. Anderson (OT) - Broncos"

# or, individual attributes
players.select { |p| p.salary.to_i > 5_000_000 }.
  sort { |a, b| a[:salary] <=> b[:salary] }.
  reverse.
  each do |player|
    pp "#{player.name} #{player.humanized_salary} #{player.salary_currency} #{player.school}"
end

# "Peyton Manning 17,500,000 USD Tennessee"
# "Demaryius Thomas 13,200,000 USD Georgia Tech "
# "Ryan Clady 10,600,000 USD Boise State"
# "Von Miller 9,754,000 USD Texas A&M"
# "Demarcus Ware 8,666,666 USD Troy"
# "T.J. Ward 7,514,705 USD Oregon"
# "Aqib Talib 6,968,750 USD Kansas"
# "Louis Vasquez 6,250,000 USD Texas Tech"
# "Emmanuel Sanders 5,850,000 USD Southern Methodist"
