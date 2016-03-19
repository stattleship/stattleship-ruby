require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballTotalTeamStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballTotalTeamStatParams.new

          params.team_id = 'mlb-bos'
          params.stat = 'home_runs'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'home_runs'
          expect(query_parameters['type']).to eq 'baseball_team_stat'
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'validates the team belongs to the sport' do
          params = BaseballTotalTeamStatParams.new

          params.team_id = 'nfl-ne'
          params.stat = 'home_runs'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
