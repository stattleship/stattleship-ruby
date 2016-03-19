require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballTeamOutcomeStreaksParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballTeamOutcomeStreaksParams.new

          params.team_id = 'mlb-bos'
          params.outcome = 'win'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['outcome']).to eq 'win'
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'fails validation for a team that does not match sport' do
          params = BaseballTeamOutcomeStreaksParams.new

          params.team_id = 'nhl-was'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
