require 'spec_helper'

module Stattleship
  RSpec.describe BasketballGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nba_game_logs.count).to eq 3
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/game_log.json'))

        BasketballGameLogs.fetch(team_id: 'nba-cle')

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/game_logs?team_id=nba-cle")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/game_log.json'))

        game_logs = BasketballGameLogs.fetch(team_id: 'nba-cle')

        expect(game_logs.count).to eq 3

        game_logs.each do |game_log|
          expect(game_log).to be_a BasketballGameLog
        end
      end
    end
  end

  module Models
    RSpec.describe BasketballGameLog do
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
          expect(game.score).to eq '95-97'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Los Angeles'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NBA'
        end

        it 'returns the league_name' do
          expect(
            game.league_name
          ).to eq 'National Basketball Association'
        end

        def game
          nba_game_logs.first.game
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
          expect(
            nba_game_logs.first.league_name
          ).to eq 'National Basketball Association'
        end
      end
    end
  end
end
