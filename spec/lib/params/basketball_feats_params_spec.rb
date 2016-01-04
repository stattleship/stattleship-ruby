require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballFeatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballFeatsParams.new

          params.level = 'rare'
          params.player_id = 'nba-lebron-james'
          params.since = '1 month ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['level']).to eq 'rare'
          expect(query_parameters['player_id']).to eq 'nba-lebron-james'
          expect(query_parameters['since']).to eq '1 month ago'
        end

        it 'fails validation for a player that does not match sport' do
          params = BasketballFeatsParams.new

          params.player_id = 'nhl-bob-probert'

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation for a team that does not match sport' do
          params = BasketballFeatsParams.new

          params.team_id = 'nhl-was'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
