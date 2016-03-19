require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballTotalPlayerStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballTotalPlayerStatParams.new

          params.player_id = 'mlb-david-ortiz'
          params.stat = 'hits'
          params.type = 'baseball_hitter_stat'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'hits'
          expect(query_parameters['type']).to eq 'baseball_hitter_stat'
          expect(query_parameters['player_id']).to eq 'mlb-david-ortiz'
        end

        it 'validates the player belongs to the sport' do
          params = BaseballTotalPlayerStatParams.new

          params.player_id = 'nhl-brad-marchand'
          params.stat = 'hits'
          params.type = 'baseball_hitter_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end

        it 'validates the type belongs to the sport' do
          params = BaseballTotalPlayerStatParams.new

          params.player_id = 'mlb-david-ortiz'
          params.stat = 'hits'
          params.type = 'hockey_defensive_stat'

          expect { params.query['query'] }.to raise_error ArgumentError
        end
      end
    end
  end
end
