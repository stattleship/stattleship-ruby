require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe TotalPlayerStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = TotalPlayerStatParams.new

          params.player_id = 'nhl-tyler-seguin'
          params.stat = 'shots'
          params.type = 'hockey_offensive_stat'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'shots'
          expect(query_parameters['type']).to eq 'hockey_offensive_stat'
          expect(query_parameters['player_id']).to eq 'nhl-tyler-seguin'
        end
      end
    end
  end
end
