require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballStatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballStatLeadersParams.new

          params.stat = 'runs_batted_in'
          params.type = 'baseball_hitter_stat'
          params.place = 4

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'runs_batted_in'
          expect(query_parameters['type']).to eq 'baseball_hitter_stat'
          expect(query_parameters['place']).to eq 4
        end
      end
    end
  end
end
