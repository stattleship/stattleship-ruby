require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballPenaltiesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BasketballPenaltiesParams.new

          params.player_id = 'nba-jae-crowder'
          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nba-jae-crowder'
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end

        it 'constructs only the given player parameter' do
          params = BasketballPenaltiesParams.new

          params.player_id = 'nba-jae-crowder'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nba-jae-crowder'
        end

        it 'constructs only the given team parameter' do
          params = BasketballPenaltiesParams.new

          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end

        it 'constructs only the given game parameter' do
          params = BasketballPenaltiesParams.new

          params.game_id = 'nba-2015-2016-bos-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'nba-2015-2016-bos-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = BasketballPenaltiesParams.new

          params.player_id = 'nba-derrick-rose'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nba-derrick-rose'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
