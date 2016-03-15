require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTeamOutcomeStreaks do
    describe '#team_outcome_streaks' do
      it 'returns all the nhl_team_outcome_streaks' do
        expect(nhl_team_outcome_streaks.count).to eq 20
      end

      it 'populates the team_outcome_streak' do
        nhl_team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak.rank).to be_a Integer
          expect(team_outcome_streak.game_number).to be_a Integer
          expect(team_outcome_streak.streak_length).to be_a Integer
          expect(team_outcome_streak.league_id).to be
          expect(team_outcome_streak.season_id).to be
          expect(team_outcome_streak.team_id).to be
        end
      end

      it 'populates the team_outcome_streak leagues' do
        nhl_team_outcome_streak = nhl_team_outcome_streaks.first

        expect(nhl_team_outcome_streak.league).to be_a Stattleship::Models::League
        expect(nhl_team_outcome_streak.league.abbreviation).to eq('NHL')
        expect(nhl_team_outcome_streak.league_abbreviation).to eq('NHL')
      end

      it 'populates the team_outcome_streak team' do
        nhl_team_outcome_streak = nhl_team_outcome_streaks.first

        expect(nhl_team_outcome_streak.team).to be_a Stattleship::Models::Team
        expect(nhl_team_outcome_streak.team.nickname).to eq('Blues')
        expect(nhl_team_outcome_streak.team.name).to eq('St. Louis')
        expect(nhl_team_outcome_streak.team_nickname).to eq('Blues')
        expect(nhl_team_outcome_streak.team_name).to eq('St. Louis')
      end

      it 'makes a sentence' do
        nhl_team_outcome_streak = nhl_team_outcome_streaks.first

        expect(nhl_team_outcome_streak.to_sentence).to eq('St. Louis Blues had a 1 game winning streak between Oct 08 and Oct 10')
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/team_outcome_streaks.json'))

        HockeyTeamOutcomeStreaks.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/team_outcome_streaks?team_id=nhl-stl")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey team_outcome_streaks' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/team_outcome_streaks.json'))

        team_outcome_streaks = HockeyTeamOutcomeStreaks.fetch(params: params)

        expect(team_outcome_streaks.count).to eq 20

        team_outcome_streaks.each do |team_outcome_streak|
          expect(team_outcome_streak).to be_a Models::TeamOutcomeStreak
        end
      end

      def params
        Stattleship::Params::HockeyTeamOutcomeStreaksParams.new.tap do |params|
          params.team_id = 'nhl-stl'
        end
      end
    end
  end
end
