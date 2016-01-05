require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTeamGameLogs do
    describe '#team_game_logs' do
      it 'returns all the team_game_logs' do
        expect(nhl_team_game_logs.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/team_game_logs.json'))

        HockeyTeamGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/team_game_logs?team_id=nhl-buf")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/team_game_logs.json'))

        team_game_logs = HockeyTeamGameLogs.fetch(params: params)

        team_game_logs.each do |team_game_log|
          expect(team_game_log).to be_a HockeyTeamGameLog
        end
      end

      def params
        Stattleship::Params::HockeyTeamGameLogsParams.new.tap do |params|
          params.team_id = 'nhl-buf'
        end
      end
    end
  end

  module Models
    RSpec.describe HockeyTeamGameLog do
      it 'parses all the logs' do
        expect(nhl_team_game_logs.count).to eq 5
      end

      describe Team do
        it 'returns the team_name' do
          expect(team.name).to eq 'Buffalo'
        end

        it 'returns the team_full_name' do
          expect(team.full_name).to eq 'Buffalo Sabres'
        end

        def team
          nhl_team_game_logs.first.team
        end
      end

      it 'returns goals_empty_net' do
        expect(nhl_team_game_log.goals_empty_net).to eq 2
      end

      it 'returns faceoff_total_losses' do
        expect(nhl_team_game_log.faceoff_total_losses).to eq 33
      end

      it 'returns goalie_goals_against_average' do
        expect(nhl_team_game_log.goalie_goals_against_average).to eq '3.0'
      end

      def nhl_team_game_log
        nhl_team_game_logs.first
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
          expect(game.score).to eq '6-3'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Boston'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NHL'
        end

        it 'returns the league_name' do
          expect(
            game.league_name
          ).to eq 'National Hockey League'
        end

        def game
          nhl_team_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(nhl_team_game_logs.first.city).to eq 'Boston'
        end

        it 'returns the league_abbreviation' do
          expect(nhl_team_game_logs.first.league_abbreviation).to eq 'NHL'
        end

        it 'returns the team_name' do
          expect(nhl_team_game_logs.first.team_name).to eq 'Buffalo'
        end

        it 'returns the team_full_name' do
          expect(nhl_team_game_logs.first.team_full_name).to eq 'Buffalo Sabres'
        end

        it 'returns the opponent_name' do
          expect(nhl_team_game_log.opponent_name).to eq 'Boston'
        end

        it 'returns the opponent_full_name' do
          expect(nhl_team_game_log.opponent_full_name).to eq 'Boston Bruins'
        end

        it 'returns the league_name' do
          expect(
            nhl_team_game_logs.first.league_name
          ).to eq 'National Hockey League'
        end

        it 'returns a sentence' do
          expect(
            nhl_team_game_logs.first.to_sentence
          ).to eq 'Buffalo 6 G, 6 PIM, 15 P, 29 S (Sabres vs Bruins December 26, 2015 at  7:00pm)'
        end
      end
    end
  end
end
