require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe GameLogsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = GameLogsParams.new

          params.player_id = 'nhl-patrice-bergeron'
          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'constructs only the given player parameter' do
          params = GameLogsParams.new

          params.player_id = 'nhl-patrice-bergeron'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
        end

        it 'constructs only the given team parameter' do
          params = GameLogsParams.new

          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end
      end
    end
  end
end
