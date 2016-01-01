require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyStatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyStatLeadersParams.new

          params.stat = 'shots'
          params.type = 'hockey_offensive_stat'
          params.place = 4

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'shots'
          expect(query_parameters['type']).to eq 'hockey_offensive_stat'
          expect(query_parameters['place']).to eq 4
        end
      end
    end
  end
end
