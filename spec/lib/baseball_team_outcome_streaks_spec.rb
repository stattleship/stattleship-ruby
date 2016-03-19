require 'spec_helper'

module Stattleship
  RSpec.describe BaseballTeamOutcomeStreaks do
    describe '#team_outcome_streaks' do
      xit 'returns all the mlb_team_outcome_streaks' do
        expect(mlb_team_outcome_streaks.count).to eq 13
      end

      xit 'populates the team_outcome_streak' do
        mlb_team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak.rank).to be_a Integer
          expect(team_outcome_streak.game_number).to be_a Integer
          expect(team_outcome_streak.streak_length).to be_a Integer
          expect(team_outcome_streak.league_id).to be
          expect(team_outcome_streak.season_id).to be
          expect(team_outcome_streak.team_id).to be
        end
      end

      xit 'populates the team_outcome_streak leagues' do
        mlb_team_outcome_streak = mlb_team_outcome_streaks.first

        expect(mlb_team_outcome_streak.league).to be_a Stattleship::Models::League
        expect(mlb_team_outcome_streak.league.abbreviation).to eq('MLB')
        expect(mlb_team_outcome_streak.league_abbreviation).to eq('MLB')
      end

      xit 'populates the team_outcome_streak team' do
        mlb_team_outcome_streak = mlb_team_outcome_streaks.first

        expect(mlb_team_outcome_streak.team).to be_a Stattleship::Models::Team
        expect(mlb_team_outcome_streak.team.nickname).to eq('Red Sox')
        expect(mlb_team_outcome_streak.team.name).to eq('Boston')
        expect(mlb_team_outcome_streak.team_nickname).to eq('Red Sox')
        expect(mlb_team_outcome_streak.team_name).to eq('Boston')
      end

      xit 'makes a sentence' do
        mlb_team_outcome_streak = mlb_team_outcome_streaks.first

        expect(mlb_team_outcome_streak.to_sentence).to eq('Boston Red Sox had a 24 game winning streak between Oct 27 and Dec 12')
      end
    end

    describe '.fetch' do
      xit 'makes a request to fetch Baseball team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/team_outcome_streaks.json'))

        BaseballTeamOutcomeStreaks.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/team_outcome_streaks?team_id=mlb-bos")
        ).to have_been_made.once
      end

      xit 'parses and builds the Baseball team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/team_outcome_streaks.json'))

        team_outcome_streaks = BaseballTeamOutcomeStreaks.fetch(params: params)

        expect(team_outcome_streaks.count).to eq 13

        team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak).to be_a Models::TeamOutcomeStreak
        end
      end

      def params
        Stattleship::Params::BaseballTeamOutcomeStreaksParams.new.tap do |params|
          params.team_id = 'mlb-bos'
        end
      end
    end
  end
end
