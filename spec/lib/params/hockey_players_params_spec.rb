require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyPlayersParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = HockeyPlayersParams.new

          params.team_id = 'nhl-pit'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nhl-pit'
        end

        it 'fails validation if the sport does not match' do
          params = HockeyPlayersParams.new

          params.team_id = 'nba-cle'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
