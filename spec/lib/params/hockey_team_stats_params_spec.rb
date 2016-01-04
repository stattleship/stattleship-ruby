require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTeamStatsParams do
      describe '#query' do
        it 'defines a query hash of team parameters' do
          params = HockeyTeamStatsParams.new

          params.stat = 'goals'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'nhl-zdeno-chara'
          params.team_id = 'nhl-bos'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'goals'
          expect(query_parameters['type']).to eq 'hockey_team_stat'
          expect(query_parameters['player_id']).to be_nil
          expect(query_parameters['team_id']).to eq 'nhl-bos'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport team' do
          params = HockeyTeamStatsParams.new

          params.stat = 'goals'
          params.team_id = 'nba-bos'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
