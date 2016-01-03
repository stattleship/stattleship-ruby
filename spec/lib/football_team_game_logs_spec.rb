require 'spec_helper'

module Stattleship
  RSpec.describe FootballTeamGameLogs do
    describe '#team_game_logs' do
      it 'returns all the team_game_logs' do
        expect(nfl_team_game_logs.count).to eq 4
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/team_game_logs.json'))

        FootballTeamGameLogs.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/team_game_logs?team_id=nfl-gb")
        ).to have_been_made.once
      end

      it 'parses and builds the football game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/team_game_logs.json'))

        team_game_logs = FootballTeamGameLogs.fetch(params: params)

        team_game_logs.each do |team_game_log|
          expect(team_game_log).to be_a FootballTeamGameLog
        end
      end

      def params
        Stattleship::Params::FootballTeamGameLogsParams.new.tap do |params|
          params.team_id = 'nfl-gb'
        end
      end
    end
  end

  module Models
    RSpec.describe FootballTeamGameLog do
      it 'parses all the logs' do
        expect(nfl_team_game_logs.count).to eq 4
      end

      describe Team do
        it 'returns the team_name' do
          expect(team.name).to eq 'Green Bay'
        end

        it 'returns the team_full_name' do
          expect(team.full_name).to eq 'Green Bay Packers'
        end

        def team
          nfl_team_game_logs.first.team
        end
      end

      it 'returns kickoff_return_yards' do
        expect(nfl_team_game_log.kickoff_return_yards).to eq 61
      end

      it 'returns passing_plays_attempted' do
        expect(nfl_team_game_log.passing_plays_attempted).to eq 36
      end

      it 'returns passer_rating' do
        expect(nfl_team_game_log.passer_rating).to eq '96.18056'
      end

      def nfl_team_game_log
        nfl_team_game_logs.first
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

        it 'returns the score' do
          expect(game.score).to eq '27-23'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Canton'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NFL'
        end

        it 'returns the league_name' do
          expect(
            game.league_name
          ).to eq 'National Football League'
        end

        def game
          nfl_team_game_logs.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
          expect(nfl_team_game_logs.first.city).to eq 'Canton'
        end

        it 'returns the league_abbreviation' do
          expect(nfl_team_game_logs.first.league_abbreviation).to eq 'NFL'
        end

        it 'returns the team_name' do
          expect(nfl_team_game_logs.first.team_name).to eq 'Green Bay'
        end

        it 'returns the team_full_name' do
          expect(nfl_team_game_logs.first.team_full_name).to eq 'Green Bay Packers'
        end

        it 'returns the opponent_name' do
          expect(nfl_team_game_log.opponent_name).to eq 'Detroit'
        end

        it 'returns the opponent_full_name' do
          expect(nfl_team_game_log.opponent_full_name).to eq 'Detroit Lions'
        end

        it 'returns the league_name' do
          expect(
            nfl_team_game_logs.first.league_name
          ).to eq 'National Football League'
        end

        it 'returns a sentence' do
          expect(
            nfl_team_game_logs.first.to_sentence
          ).to eq 'Green Bay 27 score, 2 Pass TD, 1 Rush TD, 96.18056 rating (Packers vs Lions December  3, 2015 at  8:25pm)'
        end
      end
    end
  end
end
