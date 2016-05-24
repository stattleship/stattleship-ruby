require 'spec_helper'

module Stattleship
  RSpec.describe TotalPlayerStat do
    it 'knows about a player' do
      expect(total_player_stat.player).to be_a Stattleship::Models::Player
      expect(total_player_stat.player.name).to eq('Brandon Marshall')
      expect(total_player_stat.player.first_name).to eq('Brandon')
      expect(total_player_stat.player.last_name).to eq('Marshall')
    end

    it 'knows about the stat and total' do
      expect(total_player_stat.stat).to eq('receptions_total')
      expect(total_player_stat.humanized_stat).to eq('Receptions Total')
      expect(total_player_stat.total).to eq(109)
    end

    it 'knows about a player position' do
      player = total_player_stat.player

      expect(player.position_abbreviation).to eq('WR')
      expect(player.position_name).to eq('Wide Receiver')
    end

    it 'knows about the player team' do
      team = total_player_stat.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('New York Jets')
      expect(team.name).to eq('N.Y. Jets')
      expect(team.nickname).to eq('Jets')
      expect(team.location).to eq('New York')
    end

    it 'knows about a seasonality' do
      expect(total_player_stat.season_name).to eq('2015-2016')
      expect(total_player_stat.interval_type).to eq('week')
      expect(total_player_stat.since).to be_nil
      expect(total_player_stat.week).to be_nil
    end

    it 'can format a readable sentence' do
      expect(
        total_player_stat.to_sentence
      ).to eq 'Brandon Marshall had 109 receptions total in the 2015-2016 season'
    end
  end
end
