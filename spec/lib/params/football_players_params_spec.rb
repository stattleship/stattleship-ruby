require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballPlayersParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballPlayersParams.new

          params.team_id = 'nfl-ne'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['team_id']).to eq 'nfl-ne'
        end

        it 'fails validation if the sport does not match' do
          params = FootballPlayersParams.new

          params.team_id = 'nba-cle'

          expect { params.query }.to raise_error ArgumentError
        end
      end
    end
  end
end
