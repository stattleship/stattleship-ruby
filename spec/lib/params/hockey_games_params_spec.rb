require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyGamesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = HockeyGamesParams.new

          params.player_id = 'nhl-patrick-kane'
          params.team_id = 'nhl-chi'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nhl-patrick-kane'
          expect(query_parameters['team_id']).to eq 'nhl-chi'
        end

        it 'constructs only the given player parameter' do
          params = HockeyGamesParams.new

          params.player_id = 'nhl-patrick-kane'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nhl-patrick-kane'
        end

        it 'constructs only the given team parameter' do
          params = HockeyGamesParams.new

          params.team_id = 'nhl-chi'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nhl-chi'
        end

        it 'fails validation if the sport does not match' do
          params = HockeyGamesParams.new

          params.team_id = 'nba-dal'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
