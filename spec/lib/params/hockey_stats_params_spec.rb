require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyStatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = HockeyStatsParams.new

          params.stat = 'goals'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'nhl-tyler-seguin'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'goals'
          expect(query_parameters['type']).to eq 'hockey_offensive_stat'
          expect(query_parameters['player_id']).to eq 'nhl-tyler-seguin'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport stat' do
          params = HockeyStatsParams.new

          params.stat = 'goals'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nhl-tyler-seguin'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation with the wrong sport player' do
          params = HockeyStatsParams.new

          params.stat = 'goals'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
