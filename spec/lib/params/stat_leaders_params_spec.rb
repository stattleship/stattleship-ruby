require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe StatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = StatLeadersParams.new

          params.stat = 'points'
          params.type = 'sport_stat'
          params.place = 5

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'sport_stat'
          expect(query_parameters['place']).to eq 5
        end
      end
    end
  end
end
