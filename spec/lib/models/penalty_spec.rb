require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Penalty do
      it 'constructs a penalty from json' do
        expect(penalty).to be_a Penalty
      end

      it 'sets the penalty identifiers' do
        expect(penalty.id).to eq('77e67d8e-3530-451d-8886-06996a75d5e8')
        expect(penalty.game_id).to eq('23593fd4-ad4e-4fb0-9e80-7881046da3ca')
        expect(penalty.opponent_id).to eq('54276c06-42a0-4649-838c-a462451d54c8')
        expect(penalty.player_id).to eq('009f0aa3-f769-4dd6-bea9-de56ba63b0b6')
        expect(penalty.team_id).to eq('d32b9696-2d78-40a0-bf6d-3cd16dc48c96')
      end

      it 'sets the penalty properties' do
        expect(penalty.label).to eq('Hooking')
        expect(penalty.minutes).to eq(2)
        expect(penalty.name).to eq('hooking')
        expect(penalty.period_number).to eq(2)
        expect(penalty.period_seconds).to eq(885)
        expect(penalty.seconds).to eq(120)
        expect(penalty.team_penalty).to be false
        expect(penalty.time_code).to eq('PT14M45S')
      end

      def penalty
        json = File.read('spec/fixtures/nhl/penalty.json')
        penalty = Penalty.new
        penalty.extend(PenaltyRepresenter)
        penalty.from_json(json)
      end
    end
  end
end
