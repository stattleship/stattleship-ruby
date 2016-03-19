require 'spec_helper'

module Stattleship
  RSpec.describe BaseballGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(mlb_game_logs.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/game_log.json'))

        BaseballGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/game_logs?team_id=mlb-was")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/game_log.json'))

        game_logs = BaseballGameLogs.fetch(params: params)

        expect(game_logs.count).to eq 5

        game_logs.each do |game_log|
          expect(game_log).to be_a BaseballGameLog
        end
      end

      def params
        Stattleship::Params::BaseballGameLogsParams.new.tap do |params|
          params.team_id = 'mlb-was'
        end
      end
    end
  end

  module Models
    RSpec.describe BaseballGameLog do
      it 'returns batters_faced' do
        expect(mlb_game_logs.first.batters_faced).to eq 4
      end

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

        it 'returns a home team' do
          expect(game.home_team).to be_a Team
        end

        it 'returns a away team' do
          expect(game.away_team).to be_a Team
        end

        it 'returns a winning team' do
          expect(game.winning_team).to be_a Team
        end

        it 'returns the score' do
          expect(game.score).to eq '2-9'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Washington'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'MLB'
        end

        it 'returns the league_name' do
          expect(
            game.league_name
          ).to eq 'Major League Baseball'
        end

        def game
          mlb_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(mlb_game_logs.first.city).to eq 'Washington'
        end

        it 'returns the player_name' do
          expect(mlb_game_logs.first.player_name).to eq 'Matt Thornton'
        end

        it 'returns the league_abbreviation' do
          expect(mlb_game_logs.first.league_abbreviation).to eq 'MLB'
        end

        it 'returns the league_name' do
          expect(
            mlb_game_logs.first.league_name
          ).to eq 'Major League Baseball'
        end
      end
    end
  end
end
