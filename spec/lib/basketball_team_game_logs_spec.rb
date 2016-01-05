require 'spec_helper'

module Stattleship
  RSpec.describe BasketballTeamGameLogs do
    describe '#team_game_logs' do
      it 'returns all the team_game_logs' do
        expect(nba_team_game_logs.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/team_game_logs.json'))

        BasketballTeamGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/team_game_logs?team_id=nba-chi")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/team_game_logs.json'))

        team_game_logs = BasketballTeamGameLogs.fetch(params: params)

        team_game_logs.each do |team_game_log|
          expect(team_game_log).to be_a BasketballTeamGameLog
        end
      end

      def params
        Stattleship::Params::BasketballTeamGameLogsParams.new.tap do |params|
          params.team_id = 'nba-chi'
        end
      end
    end
  end

  module Models
    RSpec.describe BasketballTeamGameLog do
      it 'parses all the logs' do
        expect(nba_team_game_logs.count).to eq 5
      end

      describe Team do
        it 'returns the team_name' do
          expect(team.name).to eq 'Chicago'
        end

        it 'returns the team_full_name' do
          expect(team.full_name).to eq 'Chicago Bulls'
        end

        def team
          nba_team_game_logs.first.team
        end
      end

      it 'returns assists_total' do
        expect(nba_team_game_log.assists_total).to eq 20
      end

      it 'returns three_pointers_attempted' do
        expect(nba_team_game_log.three_pointers_attempted).to eq 21
      end

      it 'returns three_pointers_percentage' do
        expect(nba_team_game_log.three_pointers_percentage).to eq '0.381'
      end

      def nba_team_game_log
        nba_team_game_logs.first
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
          expect(game.score).to eq '111-118'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Dallas'
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
          nba_team_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(nba_team_game_logs.first.city).to eq 'Dallas'
        end

        it 'returns the league_abbreviation' do
          expect(nba_team_game_logs.first.league_abbreviation).to eq 'NBA'
        end

        it 'returns the team_name' do
          expect(nba_team_game_logs.first.team_name).to eq 'Chicago'
        end

        it 'returns the team_full_name' do
          expect(nba_team_game_logs.first.team_full_name).to eq 'Chicago Bulls'
        end

        it 'returns the opponent_name' do
          expect(nba_team_game_log.opponent_name).to eq 'Dallas'
        end

        it 'returns the opponent_full_name' do
          expect(nba_team_game_log.opponent_full_name).to eq 'Dallas Mavericks'
        end

        it 'returns the league_name' do
          expect(
            nba_team_game_logs.first.league_name
          ).to eq 'National Basketball Association'
        end

        it 'returns a sentence' do
          expect(
            nba_team_game_logs.first.to_sentence
          ).to eq 'Chicago 42 FGM, 0.0 FG%, 0 PTS, 28 DRB, 13 ORB, 41 REB (Bulls vs Mavericks December 26, 2015 at  7:30pm)'
        end
      end
    end
  end
end
