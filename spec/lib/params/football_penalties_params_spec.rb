require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballPenaltiesParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballPenaltiesParams.new

          params.player_id = 'nfl-tom-brady'
          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'constructs only the given player parameter' do
          params = FootballPenaltiesParams.new

          params.player_id = 'nfl-tom-brady'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
        end

        it 'constructs only the given team parameter' do
          params = FootballPenaltiesParams.new

          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'constructs only the given game parameter' do
          params = FootballPenaltiesParams.new

          params.game_id = 'nfl-2015-2016-bos-den-2015-10-27-1900'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['game_id']).to eq 'nfl-2015-2016-bos-den-2015-10-27-1900'
        end

        it 'constructs for a player since a time' do
          params = FootballPenaltiesParams.new

          params.player_id = 'nfl-peyton-manning'
          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nfl-peyton-manning'
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
