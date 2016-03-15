require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe TeamOutcomeStreak do
      it 'constructs a team_outcome_streak from json' do
        expect(team_outcome_streak).to be_a TeamOutcomeStreak
      end

      it 'sets the team_outcome_streak identifiers' do
        expect(team_outcome_streak.id).to be_nil
        expect(team_outcome_streak.league_id).to eq('3c805f57-ef31-407d-b633-54bac8745b9e')
        expect(team_outcome_streak.season_id).to eq('e56321f3-1c81-4f91-9bdf-8dac07129648')
        expect(team_outcome_streak.team_id).to eq('2a173568-fca6-4891-8c3b-3573547b0b6b')

      end

      it 'sets the team_outcome_streak dates' do
        expect(team_outcome_streak.started_on).to eq(Date.parse('2016-01-16'))
        expect(team_outcome_streak.ended_on).to eq(Date.parse('2016-01-18'))
      end

      it 'sets the team_outcome_streak info' do
        expect(team_outcome_streak.outcome).to eq('loss')
        expect(team_outcome_streak.game_number).to eq(41)
        expect(team_outcome_streak.streak).to eq(8)
        expect(team_outcome_streak.streak_length).to eq(1)
        expect(team_outcome_streak.streak_length_in_days).to eq(2)
        expect(team_outcome_streak).not_to be_current
        expect(team_outcome_streak.rank).to eq(7)
      end

      def team_outcome_streak
        json = File.read('spec/fixtures/nba/team_outcome_streak.json')
        team_outcome_streak = TeamOutcomeStreak.new
        team_outcome_streak.extend(TeamOutcomeStreakRepresenter)
        team_outcome_streak.from_json(json)
      end
    end
  end
end
