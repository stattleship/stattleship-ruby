require 'spec_helper'

module Stattleship
  RSpec.describe TotalPlayerStat do
    it 'knows about a player' do
      expect(total_player_stat.player).to be_a Stattleship::Models::Player
      expect(total_player_stat.player.name).to eq('Tom Brady')
      expect(total_player_stat.player.first_name).to eq('Tom')
      expect(total_player_stat.player.last_name).to eq('Brady')
    end

    it 'knows about the stat and total' do
      expect(total_player_stat.stat).to eq('passes_touchdowns')
      expect(total_player_stat.total).to eq(36)
    end

    it 'knows about a player position' do
      player = total_player_stat.player

      expect(player.position_abbreviation).to eq('QB')
      expect(player.position_name).to eq('Quarterback')
    end

    it 'knows about the player team' do
      team = total_player_stat.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('New England Patriots')
      expect(team.name).to eq('New England')
      expect(team.nickname).to eq('Patriots')
      expect(team.location).to eq('New England')
    end

    it 'can format a readable sentence' do
      expect(
        total_player_stat.to_sentence
      ).to eq 'Tom Brady has 36 passes_touchdowns'
    end
  end
end
