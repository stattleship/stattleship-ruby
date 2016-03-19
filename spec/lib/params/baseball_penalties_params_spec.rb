require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballPenaltiesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BaseballPenaltiesParams.new

          params.player_id = 'mlb-prince-fielder'
          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'mlb-prince-fielder'
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'constructs only the given player parameter' do
          params = BaseballPenaltiesParams.new

          params.player_id = 'mlb-prince-fielder'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'mlb-prince-fielder'
        end

        it 'constructs only the given team parameter' do
          params = BaseballPenaltiesParams.new

          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'constructs only the given game parameter' do
          params = BaseballPenaltiesParams.new

          params.game_id = 'mlb-2015-2016-bos-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'mlb-2015-2016-bos-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = BaseballPenaltiesParams.new

          params.player_id = 'mlb-wade-boggs'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'mlb-wade-boggs'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
