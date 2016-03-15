require 'spec_helper'

module Stattleship
  RSpec.describe FootballTeamOutcomeStreaks do
    describe '#team_outcome_streaks' do
      it 'returns all the nfl_team_outcome_streaks' do
        expect(nfl_team_outcome_streaks.count).to eq 4
      end

      it 'populates the team_outcome_streak' do
        nfl_team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak.rank).to be_a Integer
          expect(team_outcome_streak.game_number).to be_a Integer
          expect(team_outcome_streak.streak_length).to be_a Integer
          expect(team_outcome_streak.league_id).to be
          expect(team_outcome_streak.season_id).to be
          expect(team_outcome_streak.team_id).to be
        end
      end

      it 'populates the team_outcome_streak leagues' do
        nfl_team_outcome_streak = nfl_team_outcome_streaks.first

        expect(nfl_team_outcome_streak.league).to be_a Stattleship::Models::League
        expect(nfl_team_outcome_streak.league.abbreviation).to eq('NFL')
        expect(nfl_team_outcome_streak.league_abbreviation).to eq('NFL')
      end

      it 'populates the team_outcome_streak team' do
        nfl_team_outcome_streak = nfl_team_outcome_streaks.first

        expect(nfl_team_outcome_streak.team).to be_a Stattleship::Models::Team
        expect(nfl_team_outcome_streak.team.nickname).to eq('Patriots')
        expect(nfl_team_outcome_streak.team.name).to eq('New England')
        expect(nfl_team_outcome_streak.team_nickname).to eq('Patriots')
        expect(nfl_team_outcome_streak.team_name).to eq('New England')
      end

      it 'makes a sentence' do
        nfl_team_outcome_streak = nfl_team_outcome_streaks.first

        expect(nfl_team_outcome_streak.to_sentence).to eq('New England Patriots had a 10 game win streak between 2015-09-10 and 2015-11-29')
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/team_outcome_streaks.json'))

        FootballTeamOutcomeStreaks.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/team_outcome_streaks?team_id=nfl-ne")
        ).to have_been_made.once
      end

      it 'parses and builds the football team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/team_outcome_streaks.json'))

        team_outcome_streaks = FootballTeamOutcomeStreaks.fetch(params: params)

        expect(team_outcome_streaks.count).to eq 4

        team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak).to be_a Models::TeamOutcomeStreak
        end
      end

      def params
        Stattleship::Params::FootballTeamOutcomeStreaksParams.new.tap do |params|
          params.team_id = 'nfl-ne'
        end
      end
    end
  end
end
