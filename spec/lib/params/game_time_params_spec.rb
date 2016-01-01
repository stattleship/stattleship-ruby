require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe GameTimeParams do
      describe '#query' do
        it 'defines a query hash of all parameters' do
          params = GameTimeParams.new

          params.since = '5 days ago'

          query_parameters = params.query['query']

          expect(query_parameters.size).to eq 1
          expect(query_parameters['since']).to eq '5 days ago'
        end
      end
    end
  end
end
