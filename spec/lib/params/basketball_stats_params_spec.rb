require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = BasketballStatsParams.new

          params.stat = 'points'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'basketball_offensive_stat'
          expect(query_parameters['player_id']).to eq 'nba-kobe-bryant'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport stat' do
          params = BasketballStatsParams.new

          params.stat = 'points'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation with the wrong sport player' do
          params = BasketballStatsParams.new

          params.stat = 'points'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nfl-joe-montana'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
