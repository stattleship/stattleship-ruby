require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballStatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = FootballStatLeadersParams.new

          params.stat = 'passes_touchdowns'
          params.type = 'football_passing_stat'
          params.place = 5

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'passes_touchdowns'
          expect(query_parameters['type']).to eq 'football_passing_stat'
          expect(query_parameters['place']).to eq 5
        end
      end
    end
  end
end
