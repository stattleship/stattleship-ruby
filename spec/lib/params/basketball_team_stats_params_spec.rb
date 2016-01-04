require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BasketballTeamStatsParams do
      describe '#query' do
        it 'defines a query hash of team parameters' do
          params = BasketballTeamStatsParams.new

          params.stat = 'points'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nba-kobe-bryant'
          params.team_id = 'nba-la'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'points'
          expect(query_parameters['type']).to eq 'basketball_team_stat'
          expect(query_parameters['player_id']).to be_nil
          expect(query_parameters['team_id']).to eq 'nba-la'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport team' do
          params = BasketballTeamStatsParams.new

          params.stat = 'points'
          params.team_id = 'nhl-bos'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
