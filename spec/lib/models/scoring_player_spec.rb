require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe ScoringPlayer do
      it 'constructs a scoring_player from json' do
        expect(scoring_player).to be_a ScoringPlayer
      end

      it 'sets the scoring_player identifiers' do
        expect(scoring_player.id).to eq('f904196f-3973-4c77-a3e7-ce1450db6298')
        expect(scoring_player.player_id).to eq('0302dc73-b606-448b-8b73-42f45adb44b6')
      end

      it 'sets the scoring_player properties' do
        expect(scoring_player.name).to eq('Scorer')
        expect(scoring_player.role).to eq('scorer')
      end

      def scoring_player
        json = File.read('spec/fixtures/nhl/scoring_player.json')
        scoring_player = ScoringPlayer.new
        scoring_player.extend(ScoringPlayerRepresenter)
        scoring_player.from_json(json)
      end
    end
  end
end
