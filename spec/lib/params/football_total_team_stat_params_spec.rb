require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballTotalTeamStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = FootballTotalTeamStatParams.new

          params.team_id = 'nfl-ne'
          params.stat = 'passing_gross_yards'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'passing_gross_yards'
          expect(query_parameters['type']).to eq 'football_team_stat'
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'validates the team belongs to the sport' do
          params = FootballTotalTeamStatParams.new

          params.team_id = 'nhl-bos'
          params.stat = 'passing_gross_yards'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
