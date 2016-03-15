require 'spec_helper'

module Stattleship
  RSpec.describe BasketballTeamOutcomeStreaks do
    describe '#team_outcome_streaks' do
      it 'returns all the nba_team_outcome_streaks' do
        expect(nba_team_outcome_streaks.count).to eq 13
      end

      it 'populates the team_outcome_streak' do
        nba_team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak.rank).to be_a Integer
          expect(team_outcome_streak.game_number).to be_a Integer
          expect(team_outcome_streak.streak_length).to be_a Integer
          expect(team_outcome_streak.league_id).to be
          expect(team_outcome_streak.season_id).to be
          expect(team_outcome_streak.team_id).to be
        end
      end

      it 'populates the team_outcome_streak leagues' do
        nba_team_outcome_streak = nba_team_outcome_streaks.first

        expect(nba_team_outcome_streak.league).to be_a Stattleship::Models::League
        expect(nba_team_outcome_streak.league.abbreviation).to eq('NBA')
        expect(nba_team_outcome_streak.league_abbreviation).to eq('NBA')
      end

      it 'populates the team_outcome_streak team' do
        nba_team_outcome_streak = nba_team_outcome_streaks.first

        expect(nba_team_outcome_streak.team).to be_a Stattleship::Models::Team
        expect(nba_team_outcome_streak.team.nickname).to eq('Warriors')
        expect(nba_team_outcome_streak.team.name).to eq('Golden State')
        expect(nba_team_outcome_streak.team_nickname).to eq('Warriors')
        expect(nba_team_outcome_streak.team_name).to eq('Golden State')
      end

      it 'makes a sentence' do
        nba_team_outcome_streak = nba_team_outcome_streaks.first

        expect(nba_team_outcome_streak.to_sentence).to eq('Golden State Warriors had a 24 game winning streak between Oct 27 and Dec 12')
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/team_outcome_streaks.json'))

        BasketballTeamOutcomeStreaks.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/team_outcome_streaks?team_id=nba-gs")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/team_outcome_streaks.json'))

        team_outcome_streaks = BasketballTeamOutcomeStreaks.fetch(params: params)

        expect(team_outcome_streaks.count).to eq 13

        team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak).to be_a Models::TeamOutcomeStreak
        end
      end

      def params
        Stattleship::Params::BasketballTeamOutcomeStreaksParams.new.tap do |params|
          params.team_id = 'nba-gs'
        end
      end
    end
  end
end
