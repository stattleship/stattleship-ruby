require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTopStats do
    describe '#nhl_top_stats' do
      it 'returns all the nhl_top_stats' do
        expect(nhl_top_stats.count).to eq 5
      end
    end
  end

  RSpec.describe TopStat do
    it 'knows its place' do
      expect(nhl_top_stats.first.place).to eq 1
      expect(nhl_top_stats.last.place).to eq 2
    end

    it 'knows about a player in first place' do
      player = nhl_top_stats.first.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Cody McLeod')
      expect(player.position_abbreviation).to eq('LW')
      expect(player.position_name).to eq('Left Wing')
      expect(player.team.nickname).to eq('Avalanche')
    end

    it 'knows about the stat performance in first place' do
      top_stat = nhl_top_stats.first

      expect(top_stat.stat_name).to eq('hits')
      expect(top_stat.stat).to eq(12)
      expect(top_stat.place).to eq(1)
    end

    it 'knows the game for the stat performance in first place' do
      top_stat = nhl_top_stats.first

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('Avalanche vs Maple Leafs November 17, 2015 at  6:30pm')
    end

    it 'knows about a player in last place' do
      player = nhl_top_stats.last.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Chris Neil')
      expect(player.position_abbreviation).to eq('RW')
      expect(player.position_name).to eq('Right Wing')
      expect(player.team.nickname).to eq('Senators')
    end

    it 'knows about the stat performance in last place' do
      top_stat = nhl_top_stats.last

      expect(top_stat.stat_name).to eq('hits')
      expect(top_stat.stat).to eq(11)
      expect(top_stat.place).to eq(2)
    end

    it 'knows the game for the stat performance in last place' do
      top_stat = nhl_top_stats.last

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('Sabres vs Senators September 26, 2015 at  6:00pm')
    end

    it 'can format a readable sentence' do
      top_stat = nhl_top_stats.last

      expect(
        top_stat.to_sentence
      ).to eq 'Chris Neil had 11 hits in Sabres vs Senators September 26, 2015 at  6:00pm for the second best performance'
    end
  end
end
