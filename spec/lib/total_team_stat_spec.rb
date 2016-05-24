require 'spec_helper'

module Stattleship
  RSpec.describe TotalTeamStat do
    it 'knows about a team' do
      team = total_team_stat.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('New York Giants')
      expect(team.name).to eq('N.Y. Giants')
      expect(team.nickname).to eq('Giants')
      expect(team.location).to eq('New York')
    end

    it 'knows about the stat and total' do
      expect(total_team_stat.stat).to eq('passing_gross_yards')
      expect(total_team_stat.humanized_stat).to eq('Passing Gross Yards')
      expect(total_team_stat.total).to eq(4503)
    end

    it 'knows about a seasonality' do
      expect(total_team_stat.season_name).to eq('2015-2016')
      expect(total_team_stat.interval_type).to eq('week')
      expect(total_team_stat.since).to be_nil
      expect(total_team_stat.week).to be_nil
    end

    it 'knows about a season' do
      expect(total_team_stat.season).to be_a Stattleship::Models::Season
      expect(total_team_stat.season.name).to eq('2015-2016')
    end

    it 'can format a readable sentence' do
      expect(
        total_team_stat.to_sentence
      ).to eq 'The New York Giants had 4503 passing gross yards in the 2015-2016 season'
    end
  end
end
