require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballTeamGameLogsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballTeamGameLogsParams.new

          params.since = '1 month ago'
          params.team_id = 'nfl-min'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['since']).to eq '1 month ago'
          expect(query_parameters['team_id']).to eq 'nfl-min'
        end

        it 'constructs only the given team parameter' do
          params = FootballTeamGameLogsParams.new

          params.team_id = 'nfl-min'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nfl-min'
        end

        it 'fails validation if the team does not match sport' do
          params = FootballTeamGameLogsParams.new

          params.team_id = 'nba-cle'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
