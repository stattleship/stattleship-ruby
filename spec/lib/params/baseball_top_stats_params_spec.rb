require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballTopStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballTopStatsParams.new

          params.stat = 'runs_batted_in'
          params.type = 'baseball_hitter_stat'
          params.place = 5

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'runs_batted_in'
          expect(query_parameters['type']).to eq 'baseball_hitter_stat'
          expect(query_parameters['place']).to eq 5
        end

        it 'fails validation if not baseball' do
          params = BaseballTopStatsParams.new

          params.stat = 'runs_batted_in'
          params.type = 'hockey_offensive_stat'
          params.place = 5

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
