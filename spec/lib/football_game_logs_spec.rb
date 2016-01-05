require 'spec_helper'

module Stattleship
  RSpec.describe FootballGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nfl_game_logs.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/game_log.json'))

        FootballGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/game_logs?team_id=nfl-ne")
        ).to have_been_made.once
      end

      it 'parses and builds the football game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/game_log.json'))

        game_logs = FootballGameLogs.fetch(params: params)

        expect(game_logs.count).to eq 5

        game_logs.each do |game_log|
          expect(game_log).to be_a FootballGameLog
        end
      end

      def params
        Stattleship::Params::FootballGameLogsParams.new.tap do |params|
          params.team_id = 'nfl-ne'
        end
      end
    end
  end

  module Models
    RSpec.describe FootballGameLog do
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
          expect(game.score).to eq '40-32'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Orchard Park'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NFL'
        end

        it 'returns the league_name' do
          expect(game.league_name).to eq 'National Football League'
        end

        def game
          nfl_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(nfl_game_logs.first.city).to eq 'Orchard Park'
        end

        it 'returns the player_name' do
          expect(nfl_game_logs.first.player_name).to eq 'Tom Brady'
        end

        it 'returns the league_abbreviation' do
          expect(nfl_game_logs.first.league_abbreviation).to eq 'NFL'
        end

        it 'returns the league_name' do
          expect(
            nfl_game_logs.first.league_name
          ).to eq 'National Football League'
        end
      end
    end
  end
end
