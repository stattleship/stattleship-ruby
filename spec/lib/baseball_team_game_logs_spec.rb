require 'spec_helper'

module Stattleship
  RSpec.describe BaseballTeamGameLogs do
    describe '#team_game_logs' do
      it 'returns all the team_game_logs' do
        expect(mlb_team_game_logs.count).to eq 3
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/team_game_logs.json'))

        BaseballTeamGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/team_game_logs?team_id=mlb-nyy")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/team_game_logs.json'))

        team_game_logs = BaseballTeamGameLogs.fetch(params: params)

        team_game_logs.each do |team_game_log|
          expect(team_game_log).to be_a BaseballTeamGameLog
        end
      end

      def params
        Stattleship::Params::BaseballTeamGameLogsParams.new.tap do |params|
          params.team_id = 'mlb-nyy'
        end
      end
    end
  end

  module Models
    RSpec.describe BaseballTeamGameLog do
      it 'parses all the logs' do
        expect(mlb_team_game_logs.count).to eq 3
      end

      describe Team do
        it 'returns the team_name' do
          expect(team.name).to eq 'NY Yankees'
        end

        it 'returns the team_full_name' do
          expect(team.full_name).to eq 'New York Yankees'
        end

        def team
          mlb_team_game_logs.first.team
        end
      end

      it 'returns left_on_base' do
        expect(mlb_team_game_log.left_on_base).to eq 27
      end

      it 'returns on_base_percentage' do
        expect(mlb_team_game_log.on_base_percentage).to eq 0.4047619
      end

      it 'returns runs_batted_in' do
        expect(mlb_team_game_log.runs_batted_in).to eq 7
      end

      def mlb_team_game_log
        mlb_team_game_logs.first
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
          expect(game.score).to eq '2-8'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Bronx'
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
          mlb_team_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(mlb_team_game_logs.first.city).to eq 'Bronx'
        end

        it 'returns the league_abbreviation' do
          expect(mlb_team_game_logs.first.league_abbreviation).to eq 'MLB'
        end

        it 'returns the team_name' do
          expect(mlb_team_game_logs.first.team_name).to eq 'NY Yankees'
        end

        it 'returns the team_full_name' do
          expect(mlb_team_game_logs.first.team_full_name).to eq 'New York Yankees'
        end

        it 'returns the opponent_name' do
          expect(mlb_team_game_log.opponent_name).to eq 'LA Angels'
        end

        it 'returns the opponent_full_name' do
          expect(mlb_team_game_log.opponent_full_name).to eq 'Los Angeles Angels'
        end

        it 'returns the league_name' do
          expect(
            mlb_team_game_logs.first.league_name
          ).to eq 'Major League Baseball'
        end

        it 'returns a sentence' do
          expect(
            mlb_team_game_logs.first.to_sentence
          ).to eq 'NY Yankees 11 H, 8 R, 7 RBI, 0 E (Angels vs Yankees June  6, 2015 at  7:15pm)'
        end
      end
    end
  end
end
