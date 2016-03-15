require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe TeamOutcomeStreaksParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = TeamOutcomeStreaksParams.new

          params.current = false
          params.interval_type = 'regularseason'
          params.outcome = 'win'
          params.rank = 1
          params.ranked = nil
          params.season_id = nil
          params.streak_length = 3
          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 6
          expect(query_parameters['current']).to eq false
          expect(query_parameters['interval_type']).to eq 'regularseason'
          expect(query_parameters['outcome']).to eq 'win'
          expect(query_parameters['rank']).to eq 1
          expect(query_parameters['streak_length']).to eq 3
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end

        it 'defines a query hash of parameters' do
          params = TeamOutcomeStreaksParams.new

          params.outcome = 'win'
          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['outcome']).to eq 'win'
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end

        it 'fails validation for bad streak_length' do
          params = TeamOutcomeStreaksParams.new

          params.streak_length = -3

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation for bad rank' do
          params = TeamOutcomeStreaksParams.new

          params.rank = -2

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
