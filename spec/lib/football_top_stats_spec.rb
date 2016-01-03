require 'spec_helper'

module Stattleship
  RSpec.describe FootballTopStats do
    describe '#nfl_top_stats' do
      it 'returns all the nfl_top_stats' do
        expect(nfl_top_stats.count).to eq 2
      end
    end
  end

  RSpec.describe TopStat do
    it 'knows its place' do
      expect(nfl_top_stats.first.place).to eq 1
      expect(nfl_top_stats.last.place).to eq 2
    end

    it 'knows about a player in first place' do
      player = nfl_top_stats.first.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Drew Brees')
      expect(player.position_abbreviation).to eq('QB')
      expect(player.position_name).to eq('Quarterback')
      expect(player.team.nickname).to eq('Saints')
    end

    it 'knows about the stat performance in first place' do
      top_stat = nfl_top_stats.first

      expect(top_stat.stat_name).to eq('passes_touchdowns')
      expect(top_stat.stat).to eq(7)
      expect(top_stat.place).to eq(1)
    end

    it 'knows the game for the stat performance in first place' do
      top_stat = nfl_top_stats.first

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('Giants vs Saints November  1, 2015 at  1:00pm')
    end

    it 'knows about a player in last place' do
      player = nfl_top_stats.last.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Eli Manning')
      expect(player.position_abbreviation).to eq('QB')
      expect(player.position_name).to eq('Quarterback')
      expect(player.team.nickname).to eq('Giants')
    end

    it 'knows about the stat performance in last place' do
      top_stat = nfl_top_stats.last

      expect(top_stat.stat_name).to eq('passes_touchdowns')
      expect(top_stat.stat).to eq(6)
      expect(top_stat.place).to eq(2)
    end

    it 'knows the game for the stat performance in last place' do
      top_stat = nfl_top_stats.last

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('Giants vs Saints November  1, 2015 at  1:00pm')
    end

    it 'can format a readable sentence' do
      top_stat = nfl_top_stats.first

      expect(
        top_stat.to_sentence
      ).to eq 'Drew Brees had 7 passes_touchdowns in Giants vs Saints November  1, 2015 at  1:00pm for the first best performance'
    end
  end
end
