require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballGameLogsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballGameLogsParams.new

          params.player_id = 'nfl-tom-brady'
          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'constructs only the given player parameter' do
          params = FootballGameLogsParams.new

          params.player_id = 'nfl-tom-brady'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
        end

        it 'constructs only the given team parameter' do
          params = FootballGameLogsParams.new

          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'constructs for a team and week' do
          params = FootballGameLogsParams.new

          params.team_id = 'nfl-ne'
          params.week = 7

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['team_id']).to eq 'nfl-ne'
          expect(query_parameters['week']).to eq 7
        end
      end
    end
  end
end
