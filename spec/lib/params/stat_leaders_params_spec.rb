require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe StatLeadersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = StatLeadersParams.new

          params.stat = 'points'
          params.type = 'sport_stat'
          params.place = 3
          params.season_id = 'nfl-2015-2016'
          params.interval_type = 'week'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 5
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'sport_stat'
          expect(query_parameters['place']).to eq 3
          expect(query_parameters['interval_type']).to eq 'week'
          expect(query_parameters['season_id']).to eq 'nfl-2015-2016'
        end
      end
    end
  end
end
