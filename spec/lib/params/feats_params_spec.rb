require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FeatsParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = FeatsParams.new

          params.level = 'rare'
          params.level_up = 2
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 4
          expect(query_parameters['level']).to eq 'rare'
          expect(query_parameters['level_up']).to eq 2
          expect(query_parameters['player_id']).to eq 'nba-kobe-bryant'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'defines a query hash of parameters' do
          params = FeatsParams.new

          params.feat = 'assists'
          params.player_id = 'nba-kobe-bryant'
          params.since = '2 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 3
          expect(query_parameters['feat']).to eq 'assists'
          expect(query_parameters['player_id']).to eq 'nba-kobe-bryant'
          expect(query_parameters['since']).to eq '2 days ago'
        end

        it 'fails validation for bad level' do
          params = FeatsParams.new

          params.level = 'super'

          expect { params.query }.to raise_error ArgumentError
        end

        it 'fails validation for bad level up' do
          params = FeatsParams.new

          params.level_up = -2

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
