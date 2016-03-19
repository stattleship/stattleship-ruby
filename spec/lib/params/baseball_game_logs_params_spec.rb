require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballGameLogsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BaseballGameLogsParams.new

          params.player_id = 'mlb-wade-boggs'
          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'mlb-wade-boggs'
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'constructs only the given player parameter' do
          params = BaseballGameLogsParams.new

          params.player_id = 'mlb-wade-boggs'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'mlb-wade-boggs'
        end

        it 'constructs only the given team parameter' do
          params = BaseballGameLogsParams.new

          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end
      end
    end
  end
end
