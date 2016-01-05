require 'spec_helper'

module Stattleship
  RSpec.describe Injuries do
    describe '#populate' do
      context 'with player injuries' do
        it 'returns all the injuries' do
          expect(injuries.count).to eq 3
        end

        it 'sets injury data' do
          injuries.each do |injury|
            expect(injury).to be_a Stattleship::Models::Injury

            expect(injury.player).to be_a Stattleship::Models::Player
            expect(injury.season).to be_a Stattleship::Models::Season
            expect(injury.season.league).to be_a Stattleship::Models::League
            expect(injury.league).to be_a Stattleship::Models::League
            expect(injury.team).to be_a Stattleship::Models::Team
          end
        end
      end
    end
  end
end
