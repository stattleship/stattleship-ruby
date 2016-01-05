require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe InjuriesParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = InjuriesParams.new

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 0
        end
      end
    end
  end
end
