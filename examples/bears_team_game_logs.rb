# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# params = Stattleship::Params::FootballTeamsParams.new

# team_slugs = Stattleship::FootballTeams.fetch(params: params).map(&:slug)

# team_slugs.each do |team_slug|
#   # Construct params for the fetch
#   query_params = Stattleship::Params::FootballTeamGameLogsParams.new

#   # use a slug, typically 'league-team_abbreviation'
#   query_params.team_id = team_slug
#   query_params.interval_type = 'week'
#   query_params.season_id = 'nfl-2015-2016'

#   # fetch will automatically traverse the paginated response links
#   game_logs = Stattleship::FootballTeamGameLogs.fetch(params: query_params)

#   game_logs.each do |game_log|
#     pp "#{game_log.team_name} #{game_log.game.interval}"
#   end
# end


# Construct params for the fetch
query_params = Stattleship::Params::FootballTeamGameLogsParams.new

# use a slug, typically 'league-team_abbreviation'
# query_params.team_id = team_slug
query_params.interval_type = 'week'
query_params.season_id = 'nfl-2015-2016'
# query_params.per_page = 51

# fetch will automatically traverse the paginated response links
game_logs = Stattleship::FootballTeamGameLogs.fetch(params: query_params)

game_logs.each do |game_log|
  pp "#{game_log.team_name} #{game_log.game.interval}"
end
