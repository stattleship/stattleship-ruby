require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballTopStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballTopStatsParams.new

          params.stat = 'points'
          params.type = 'basketball_offensive_stat'
          params.place = 5

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'basketball_offensive_stat'
          expect(query_parameters['place']).to eq 5
        end

        it 'fails validation if not basketball' do
          params = BasketballTopStatsParams.new

          params.stat = 'points'
          params.type = 'hockey_offensive_stat'
          params.place = 5

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
