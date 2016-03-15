# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyTeamOutcomeStreaksParams.new
query_params.team_id = 'nhl-was'
query_params.ranked = 3

# fetch will automatically traverse the paginated response links
streaks = Stattleship::HockeyTeamOutcomeStreaks.fetch(params: query_params).sort_by(&:rank)

# The Capitals first longest streak of the 2015-2016 NHL season is 9 games (win from Dec 12-Dec 31)
# The Capitals second longest streak of the 2015-2016 NHL season is 6 games (win from Nov 21-Dec 05)
# The Capitals third longest streak of the 2015-2016 NHL season is 5 games (win from Oct 15-Oct 28)
# The Capitals third longest streak of the 2015-2016 NHL season is 5 games (win from Jan 05-Jan 16)
# The Capitals third longest streak of the 2015-2016 NHL season is 5 games (win from Feb 04-Feb 13)

# or, individual attributes
streaks.each do |streak|
  puts "The #{streak.team.nickname} #{streak.rank.ordinalize} longest streak of the #{streak.season.name} #{streak.league.abbreviation} season is #{streak.streak_length} games (#{streak.outcome} from #{streak.started_on_short_date}-#{streak.ended_on_short_date})"
end
