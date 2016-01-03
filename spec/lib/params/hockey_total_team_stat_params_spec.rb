require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTotalTeamStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyTotalTeamStatParams.new

          params.team_id = 'nhl-bos'
          params.stat = 'goals'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'goals'
          expect(query_parameters['type']).to eq 'hockey_team_stat'
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'validates the team belongs to the sport' do
          params = HockeyTotalTeamStatParams.new

          params.team_id = 'nba-bos'
          params.stat = 'goals'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
