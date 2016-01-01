require 'spec_helper'

module Stattleship
  RSpec.describe HockeyGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nhl_game_logs.count).to eq 7
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/game_log.json'))

        HockeyGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/game_logs?team_id=nhl-bos")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/game_log.json'))

        game_logs = HockeyGameLogs.fetch(params: params)

        expect(game_logs.count).to eq 7

        game_logs.each do |game_log|
          expect(game_log).to be_a HockeyGameLog
        end
      end

      def params
        Stattleship::Params::HockeyGameLogsParams.new.tap do |params|
          params.team_id = 'nhl-bos'
        end
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
