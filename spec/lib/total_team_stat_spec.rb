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
      expect(total_team_stat.total).to eq(4202)
    end

    it 'can format a readable sentence' do
      expect(
        total_team_stat.to_sentence
      ).to eq 'The New York Giants have 4202 passing_gross_yards'
    end
  end
end
