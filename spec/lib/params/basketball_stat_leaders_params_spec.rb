require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballStatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballStatLeadersParams.new

          params.stat = 'free_throws_attempted'
          params.type = 'basketball_offensive_stat'
          params.place = 4

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'free_throws_attempted'
          expect(query_parameters['type']).to eq 'basketball_offensive_stat'
          expect(query_parameters['place']).to eq 4
        end
      end
    end
  end
end
