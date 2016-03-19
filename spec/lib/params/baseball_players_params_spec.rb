require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballPlayersParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BaseballPlayersParams.new

          params.team_id = 'mlb-cle'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'mlb-cle'
        end

        it 'fails validation if the sport does not match' do
          params = BaseballPlayersParams.new

          params.team_id = 'nfl-ne'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
