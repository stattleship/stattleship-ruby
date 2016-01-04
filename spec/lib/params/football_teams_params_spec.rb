require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe FootballTeamsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = FootballTeamsParams.new

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 0
        end
      end
    end
  end
end
