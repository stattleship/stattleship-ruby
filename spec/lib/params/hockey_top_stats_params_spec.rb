require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTopStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyTopStatsParams.new

          params.stat = 'hits'
          params.type = 'hockey_defensive_stat'
          params.place = 6

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['stat']).to eq 'hits'
          expect(query_parameters['type']).to eq 'hockey_defensive_stat'
          expect(query_parameters['place']).to eq 6
        end

        it 'fails validation if not hockey' do
          params = HockeyTopStatsParams.new

          params.stat = 'hits'
          params.type = 'basketball_offensive_stat'
          params.place = 5

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
