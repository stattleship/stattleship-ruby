require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Ranking do
      it 'constructs a ranking from json' do
        expect(ranking).to be_a Ranking
      end

      it 'constructs a sentence' do
        expect(ranking.to_sentence).to eq 'Kevin Durant had the 3rd best single game performance of 03/24/2016 (20p 8r 9a 2s 1b)'
      end

      it 'constructs a statline' do
        expect(ranking.statline).to eq '20p 8r 9a 2s 1b'
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
