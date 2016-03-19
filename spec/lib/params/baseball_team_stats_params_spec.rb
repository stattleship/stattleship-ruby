require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe BaseballTeamStatsParams do
      describe '#query' do
        it 'defines a query hash of team parameters' do
          params = BaseballTeamStatsParams.new

          params.stat = 'hits'
          params.type = 'baseball_hitter_stat'
          params.player_id = 'mlb-david-ortiz'
          params.team_id = 'mlb-laa'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['stat']).to eq 'hits'
          expect(query_parameters['type']).to eq 'baseball_team_stat'
          expect(query_parameters['player_id']).to be_nil
          expect(query_parameters['team_id']).to eq 'mlb-laa'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation with the wrong sport team' do
          params = BaseballTeamStatsParams.new

          params.stat = 'hits'
          params.team_id = 'nhl-bos'
          params.since = '2 days ago'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
