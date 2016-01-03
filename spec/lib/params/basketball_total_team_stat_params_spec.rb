require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballTotalTeamStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballTotalTeamStatParams.new

          params.team_id = 'nba-gs'
          params.stat = 'three_pointers_made'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'three_pointers_made'
          expect(query_parameters['type']).to eq 'basketball_team_stat'
          expect(query_parameters['team_id']).to eq 'nba-gs'
        end

        it 'validates the team belongs to the sport' do
          params = BasketballTotalTeamStatParams.new

          params.team_id = 'nfl-ne'
          params.stat = 'three_pointers_made'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
