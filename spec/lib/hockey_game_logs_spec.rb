require 'spec_helper'

module Stattleship
  RSpec.describe HockeyGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nhl_game_logs.count).to eq 7
      end
    end
  end

  module Models
    RSpec.describe HockeyGameLog do
      describe Game do
        it 'returns a Game' do
          expect(game).to be_a Game
        end

        it 'returns a League' do
          expect(game.league).to be_a League
        end

        it 'returns a Season' do
          expect(game.season).to be_a Season
        end

        it 'returns a Venue' do
          expect(game.venue).to be_a Venue
        end

        it 'returns the score' do
          expect(game.score).to eq '6-3'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Nashville'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NHL'
        end

        it 'returns the league_name' do
          expect(game.league_name).to eq 'National Hockey League'
        end

        def game
          nhl_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(nhl_game_logs.first.city).to eq 'Nashville'
        end

        it 'returns the player_name' do
          expect(nhl_game_logs.first.player_name).to eq 'Matt Beleskey'
        end

        it 'returns the league_abbreviation' do
          expect(nhl_game_logs.first.league_abbreviation).to eq 'NHL'
        end

        it 'returns the league_name' do
          expect(nhl_game_logs.first.league_name).to eq 'National Hockey League'
        end
      end
    end
  end
end
