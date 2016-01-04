require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe StatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = StatsParams.new

          params.stat = 'points'
          params.type = 'sport_stat'
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'sport_stat'
          expect(query_parameters['player_id']).to eq 'nba-kobe-bryant'
          expect(query_parameters['since']).to eq '2 days ago'
        end
      end
    end
  end
end
