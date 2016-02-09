require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe PlayersParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = PlayersParams.new

          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end

        it 'defines a query hash of parameters' do
          params = PlayersParams.new

          params.birth_date = '2016-01-14'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['birth_date']).to eq '2016-01-14'
        end

        it 'defines a query hash of parameters' do
          params = PlayersParams.new

          params.birth_date = '2016-01-14'
          params.team_id = 'nba-bos'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 2
          expect(query_parameters['birth_date']).to eq '2016-01-14'
          expect(query_parameters['team_id']).to eq 'nba-bos'
        end
      end
    end
  end
end
