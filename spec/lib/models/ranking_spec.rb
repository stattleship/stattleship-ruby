require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Ranking do
      it 'constructs a ranking from json' do
        expect(ranking).to be_a Ranking
      end

      def ranking
        @ranking ||= begin
                    json = File.read('spec/fixtures/rankings/ranking.json')
                    ranking = Ranking.new
                    ranking.extend(RankingRepresenter)
                    ranking.from_json(json)
                  end
      end
    end
  end
end
