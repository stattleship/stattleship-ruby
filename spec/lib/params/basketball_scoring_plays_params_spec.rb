require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballScoringPlaysParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = BasketballScoringPlaysParams.new

          params.player_id = 'nba-lebron-james'
          params.team_id = 'nba-cle'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nba-lebron-james'
          expect(query_parameters['team_id']).to eq 'nba-cle'
        end

        it 'constructs only the given player parameter' do
          params = BasketballScoringPlaysParams.new

          params.player_id = 'nba-lebron-james'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nba-lebron-james'
        end

        it 'constructs only the given team parameter' do
          params = BasketballScoringPlaysParams.new

          params.team_id = 'nba-cle'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nba-cle'
        end

        it 'constructs only the given game parameter' do
          params = BasketballScoringPlaysParams.new

          params.game_id = 'nba-2015-2016-cle-chi-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'nba-2015-2016-cle-chi-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = BasketballScoringPlaysParams.new

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
