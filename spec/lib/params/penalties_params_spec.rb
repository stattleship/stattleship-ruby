require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe PenaltiesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = PenaltiesParams.new

          params.player_id = 'nhl-patrice-bergeron'
          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'constructs only the given penalty parameter' do
          params = PenaltiesParams.new

          params.penalty = 'fighting'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['penalty']).to eq 'fighting'
        end

        it 'constructs only the given player parameter' do
          params = PenaltiesParams.new

          params.player_id = 'nhl-patrice-bergeron'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
        end

        it 'constructs only the given team parameter' do
          params = PenaltiesParams.new

          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'constructs only the given game parameter' do
          params = PenaltiesParams.new

          params.game_id = 'nba-2015-2016-cle-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'nba-2015-2016-cle-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = PenaltiesParams.new

          params.player_id = 'nba-stephen-curry'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nba-stephen-curry'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
