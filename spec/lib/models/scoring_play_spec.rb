require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe ScoringPlay do
      it 'constructs a scoring_play from json' do
        expect(scoring_play).to be_a ScoringPlay
      end

      it 'sets the scoring_play identifiers' do
        expect(scoring_play.id).to eq('d3809aba-4da3-4d8d-81a0-e98c4ffc1d97')
        expect(scoring_play.game_id).to eq('9f6108e5-41d1-4a37-a8a1-72e3c71b9387')
        expect(scoring_play.opponent_id).to eq('54410a6b-c9e0-443e-a4cf-b3e22f2cbb75')
        expect(scoring_play.team_id).to eq('e9d7bcb5-6723-4ca9-b1d9-1ccd026be1cb')

      end

      it 'sets the scoring_play properties' do
        expect(scoring_play.conversion).to be_nil
        expect(scoring_play.conversion_points).to eq(0)
        expect(scoring_play.empty_net).to eq(false)
        expect(scoring_play.name).to eq('EV Goal')
        expect(scoring_play.period_number).to eq(2)
        expect(scoring_play.period_seconds).to eq(32)
        expect(scoring_play.points).to eq(1)
        expect(scoring_play.scored_at).to be_a DateTime
        expect(scoring_play.scoring_conversion).to be_nil
        expect(scoring_play.scoring_conversion_points).to eq(0)
        expect(scoring_play.scoring_how).to be_nil
        expect(scoring_play.scoring_method).to eq('goal')
        expect(scoring_play.scoring_type).to eq('ev')
        expect(scoring_play.time_code).to eq('PT0M32S')
        expect(scoring_play.yards).to eq(0)
      end

      def scoring_play
        json = File.read('spec/fixtures/nhl/scoring_play.json')
        scoring_play = ScoringPlay.new
        scoring_play.extend(ScoringPlayRepresenter)
        scoring_play.from_json(json)
      end
    end
  end
end
