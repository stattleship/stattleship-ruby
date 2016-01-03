require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballGamesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballGamesParams.new

          params.player_id = 'nfl-tom-brady'
          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'constructs only the given player parameter' do
          params = FootballGamesParams.new

          params.player_id = 'nfl-tom-brady'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
        end

        it 'constructs only the given team parameter' do
          params = FootballGamesParams.new

          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'fails validation if the sport does not match' do
          params = FootballGamesParams.new

          params.team_id = 'nba-dal'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
