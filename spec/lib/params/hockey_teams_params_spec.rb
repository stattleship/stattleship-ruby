require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe HockeyTeamsParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = HockeyTeamsParams.new

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 0
        end
      end
    end
  end
end
