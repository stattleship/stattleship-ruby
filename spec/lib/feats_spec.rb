require 'spec_helper'

module Stattleship
  RSpec.describe Feats do
    describe '#populate' do
      context 'with player feats' do
        it 'returns all the feats' do
          expect(player_feats.count).to eq 5
        end

        it 'sets feat data' do
          player_feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.player).to be_a Stattleship::Models::Player
            expect(feat.subject).to be_a Stattleship::Models::Player
            expect(feat.player.team).to be_a Stattleship::Models::Team
            expect(feat.level).to eq 'rare'
            expect(feat.level_numeric).to eq 3
            expect(feat.game.away_team).to be_a Stattleship::Models::Team
            expect(feat.game.home_team).to be_a Stattleship::Models::Team
            expect(feat.game.winning_team).to be_a Stattleship::Models::Team
          end

          expect(player_feats.first.actual).to eq 9
          expect(player_feats.first.player.name).to eq 'Emmanuel Sanders'
          expect(player_feats.first.subject.name).to eq 'Emmanuel Sanders'
          expect(player_feats.first.subject_name).to eq 'Emmanuel Sanders'
          expect(player_feats.first.title).to eq 'Emmanuel Sanders was thrown to 9 times'
          expect(player_feats.first.description).to eq 'Emmanuel Sanders was thrown to 9 times vs. the Lions on Sunday September 27, 2015 at  8:30pm'
        end
      end

      context 'with team feats' do
        it 'returns all the feats' do
          expect(team_feats.count).to eq 20
        end

        it 'sets feat data' do
          team_feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.team).to be_a Stattleship::Models::Team
            expect(feat.subject).to be_a Stattleship::Models::Team
            expect(feat.team.name).to eq 'Denver'
            expect(feat.subject.name).to eq 'Denver'
            expect(feat.level).to eq 'typical'
            expect(feat.level_numeric).to eq 1
            expect(feat.game.away_team).to be_a Stattleship::Models::Team
            expect(feat.game.home_team).to be_a Stattleship::Models::Team
            expect(feat.game.winning_team).to be_a Stattleship::Models::Team
          end

          expect(team_feats.first.actual).to eq 3
          expect(team_feats.first.team.name).to eq 'Denver'
        end
      end
    end
  end

  describe '#to_sentence' do
    it 'dumps all info to a hash' do
      expect(player_feats.first.dump).to have_key(:subject_name)
      expect(player_feats.first.dump).to have_key(:sentence)
    end
  end

  describe '#to_sentence' do
    context 'with player feats' do
      it 'can make a sentence' do
        expect(
          player_feats.first.to_sentence
        ).to eq 'Emmanuel Sanders was thrown to 9 times vs. the Lions on Sunday September 27, 2015 at  8:30pm'
      end
    end

    context 'with team feats' do
      it 'can make a sentence' do
        expect(
          team_feats.first.to_sentence
        ).to eq 'Denver had 3 extra point kicks attempted vs. the Lions on Sunday September 27, 2015 at  8:30pm'
      end
    end
  end
end
