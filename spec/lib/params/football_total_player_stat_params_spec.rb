require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballTotalPlayerStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = FootballTotalPlayerStatParams.new

          params.player_id = 'nfl-tom-brady'
          params.stat = 'passes_touchdowns'
          params.type = 'football_passing_stat'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'passes_touchdowns'
          expect(query_parameters['type']).to eq 'football_passing_stat'
          expect(query_parameters['player_id']).to eq 'nfl-tom-brady'
        end

        it 'validates the player belongs to the sport' do
          params = FootballTotalPlayerStatParams.new

          params.player_id = 'nhl-tyler-seguin'
          params.stat = 'passes_touchdowns'
          params.type = 'football_passing_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end

        it 'validates the type belongs to the sport' do
          params = FootballTotalPlayerStatParams.new

          params.player_id = 'nfl-tom-brady'
          params.stat = 'passes_touchdowns'
          params.type = 'basketball_offensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
