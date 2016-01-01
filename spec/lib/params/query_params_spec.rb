require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe QueryParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          query = QueryParams.new.query

          expect(query).to have_key('query')
          expect(query).to have_value({})
          expect(query.size).to eq 1
        end
      end
    end
  end
end
