require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballTotalPlayerStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballTotalPlayerStatParams.new

          params.player_id = 'nba-kobe-bryant'
          params.stat = 'blocks'
          params.type = 'basketball_defensive_stat'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'blocks'
          expect(query_parameters['type']).to eq 'basketball_defensive_stat'
          expect(query_parameters['player_id']).to eq 'nba-kobe-bryant'
        end

        it 'validates the player belongs to the sport' do
          params = BasketballTotalPlayerStatParams.new

          params.player_id = 'nhl-brad-marchand'
          params.stat = 'blocks'
          params.type = 'basketball_defensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end

        it 'validates the type belongs to the sport' do
          params = BasketballTotalPlayerStatParams.new

          params.player_id = 'nba-kobe-bryant'
          params.stat = 'blocks'
          params.type = 'hockey_defensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
