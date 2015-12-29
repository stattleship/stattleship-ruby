require 'spec_helper'

module Stattleship
  RSpec.describe BasketballGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nba_game_logs.count).to eq 3
      end
    end
  end

  RSpec.describe BasketballGameLog do
    describe Game do
      it 'returns a Game' do
        game = nba_game_logs.first.game
        expect(game).to be_a Game
      end

      it 'returns a League' do
        game = nba_game_logs.first.game
        expect(game.league).to be_a League
      end

      it 'returns a Season' do
        game = nba_game_logs.first.game
        expect(game.season).to be_a Season
      end

      it 'returns a Venue' do
        game = nba_game_logs.first.game
        expect(game.venue).to be_a Venue
      end

      it 'returns the score' do
        game = nba_game_logs.first.game
        expect(game.score).to eq '95-97'
      end

      it 'returns the city' do
        game = nba_game_logs.first.game
        expect(game.city).to eq 'Los Angeles'
      end

      it 'returns the league_abbreviation' do
        game = nba_game_logs.first.game
        expect(game.league_abbreviation).to eq 'NBA'
      end

      it 'returns the league_name' do
        game = nba_game_logs.first.game
        expect(game.league_name).to eq 'National Basketball Association'
      end
    end

    describe 'attributes' do
      it 'returns the city' do
        expect(nba_game_logs.first.city).to eq 'Los Angeles'
      end

      it 'returns the player_name' do
        expect(nba_game_logs.first.player_name).to eq 'LeBron James'
      end

      it 'returns the league_abbreviation' do
        expect(nba_game_logs.first.league_abbreviation).to eq 'NBA'
      end

      it 'returns the league_name' do
        expect(nba_game_logs.first.league_name).to eq 'National Basketball Association'
      end
    end
  end
end
