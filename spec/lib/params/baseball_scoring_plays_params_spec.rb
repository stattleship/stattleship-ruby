require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballScoringPlaysParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BaseballScoringPlaysParams.new

          params.player_id = 'mlb-david-ortiz'
          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'mlb-david-ortiz'
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'constructs only the given player parameter' do
          params = BaseballScoringPlaysParams.new

          params.player_id = 'mlb-david-ortiz'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'mlb-david-ortiz'
        end

        it 'constructs only the given team parameter' do
          params = BaseballScoringPlaysParams.new

          params.team_id = 'mlb-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'mlb-bos'
        end

        it 'constructs only the given game parameter' do
          params = BaseballScoringPlaysParams.new

          params.game_id = 'mlb-2015-2016-cle-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'mlb-2015-2016-cle-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = BaseballScoringPlaysParams.new

          params.player_id = 'mlb-stephen-curry'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'mlb-stephen-curry'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
