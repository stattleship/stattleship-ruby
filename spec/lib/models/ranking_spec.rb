require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Ranking do
      it 'constructs a ranking from json' do
        expect(ranking).to be_a Ranking
      end

      it 'constructs a sentence' do
        expect(ranking.to_sentence).to eq ' has the fifth best game in the  season on  with 56 P, 21 FG, 13 FT, 1 3PT, 12 RBD, 2 B, 1 S'
      end

      it 'constructs a statline' do
        expect(ranking.statline).to eq '56 P, 21 FG, 13 FT, 1 3PT, 12 RBD, 2 B, 1 S'
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
