require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballTeamOutcomeStreaksParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = FootballTeamOutcomeStreaksParams.new

          params.team_id = 'nfl-ne'
          params.outcome = 'win'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['outcome']).to eq 'win'
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'fails validation for a team that does not match sport' do
          params = FootballTeamOutcomeStreaksParams.new

          params.team_id = 'nhl-was'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
