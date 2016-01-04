require 'spec_helper'

module Stattleship
  RSpec.describe Stats do
    describe '#populate' do
      context 'with player stats' do
        it 'returns all the stats' do
          expect(player_stats.count).to eq 20
        end

        it 'sets stat data' do
          player_stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.player).to be_a Stattleship::Models::Player
            expect(stat.subject).to be_a Stattleship::Models::Player
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.player.name).to eq 'Stephen Curry'
            expect(stat.subject.name).to eq 'Stephen Curry'
            expect(stat.stat_name).to eq 'three_pointers_made'
          end

          expect(player_stats.first.stat).to eq 1
        end
      end

      context 'with team stats' do
        it 'returns all the stats' do
          expect(team_stats.count).to eq 20
        end

        it 'sets stat data' do
          team_stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.subject).to be_a Stattleship::Models::Team
            expect(stat.team.name).to eq 'Atlanta'
            expect(stat.subject.name).to eq 'Atlanta'
            expect(stat.stat_name).to eq 'points_quarter_1'
          end

          expect(team_stats.first.stat).to eq 21
        end
      end
    end
  end

  describe '#to_sentence' do
    context 'with player stats' do
      it 'can make a sentence' do
        expect(
          player_stats.first.to_sentence
        ).to eq 'Stephen Curry had 1 three_pointers_made on Nuggets vs Warriors January  2, 2016 at  7:30pm'
      end
    end

    context 'with team stats' do
      it 'can make a sentence' do
        expect(
          team_stats.first.to_sentence
        ).to eq 'Atlanta had 21 points_quarter_1 on Hawks vs Knicks January  3, 2016 at  3:30pm'
      end
    end
  end
end
