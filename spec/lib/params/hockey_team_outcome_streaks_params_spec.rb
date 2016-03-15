require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTeamOutcomeStreaksParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyTeamOutcomeStreaksParams.new

          params.team_id = 'nhl-bos'
          params.outcome = 'win'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['outcome']).to eq 'win'
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'fails validation for a team that does not match sport' do
          params = HockeyTeamOutcomeStreaksParams.new

          params.team_id = 'nba-was'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
