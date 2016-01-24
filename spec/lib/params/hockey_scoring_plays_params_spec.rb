require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyScoringPlaysParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = HockeyScoringPlaysParams.new

          params.player_id = 'nhl-patrice-bergeron'
          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'constructs only the given player parameter' do
          params = HockeyScoringPlaysParams.new

          params.player_id = 'nhl-patrice-bergeron'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nhl-patrice-bergeron'
        end

        it 'constructs only the given team parameter' do
          params = HockeyScoringPlaysParams.new

          params.team_id = 'nhl-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nhl-bos'
        end

        it 'constructs only the given game parameter' do
          params = HockeyScoringPlaysParams.new

          params.game_id = 'nhl-2015-2016-bos-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'nhl-2015-2016-bos-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = HockeyScoringPlaysParams.new

          params.player_id = 'nhl-patrick-kane'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nhl-patrick-kane'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
