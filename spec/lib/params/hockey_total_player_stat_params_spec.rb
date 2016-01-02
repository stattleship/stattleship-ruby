require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTotalPlayerStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyTotalPlayerStatParams.new

          params.player_id = 'nhl-tyler-seguin'
          params.stat = 'shots'
          params.type = 'hockey_offensive_stat'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'shots'
          expect(query_parameters['type']).to eq 'hockey_offensive_stat'
          expect(query_parameters['player_id']).to eq 'nhl-tyler-seguin'
        end

        it 'validates the player belongs to the sport' do
          params = HockeyTotalPlayerStatParams.new

          params.player_id = 'nfl-tom-brady'
          params.stat = 'shots'
          params.type = 'hockey_offensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end

        it 'validates the type belongs to the sport' do
          params = HockeyTotalPlayerStatParams.new

          params.player_id = 'nhl-tyler-seguin'
          params.stat = 'shots'
          params.type = 'basketball_offensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
