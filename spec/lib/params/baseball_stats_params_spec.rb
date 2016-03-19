require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BaseballStatsParams.new

          params.stat = 'runs_batted_in'
          params.type = 'baseball_hitter_stat'
          params.player_id = 'mlb-david-ortiz'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'runs_batted_in'
          expect(query_parameters['type']).to eq 'baseball_hitter_stat'
          expect(query_parameters['player_id']).to eq 'mlb-david-ortiz'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport stat' do
          params = BaseballStatsParams.new

          params.stat = 'runs_batted_in'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'mlb-david-ortiz'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation with the wrong sport player' do
          params = BaseballStatsParams.new

          params.stat = 'runs_batted_in'
          params.type = 'baseball_hitter_stat'
          params.player_id = 'nfl-joe-montana'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
