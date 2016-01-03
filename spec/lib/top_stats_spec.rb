require 'spec_helper'

module Stattleship
  RSpec.describe TopStats do
    describe '#top_stats' do
      it 'returns all the top_stats' do
        expect(top_stats.count).to eq 6
      end
    end
  end

  RSpec.describe TopStat do
    it 'knows its place' do
      expect(top_stats.first.place).to eq 1
      expect(top_stats.last.place).to eq 2
    end

    it 'knows about a player in first place' do
      player = top_stats.first.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Robert Covington')
      expect(player.position_abbreviation).to eq('SF')
      expect(player.position_name).to eq('Small Forward')
      expect(player.team.nickname).to eq('76ers')
    end

    it 'knows about the stat performance in first place' do
      top_stat = top_stats.first

      expect(top_stat.stat_name).to eq('steals')
      expect(top_stat.stat).to eq(8)
      expect(top_stat.place).to eq(1)
    end

    it 'knows the game for the stat performance in first place' do
      top_stat = top_stats.first

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('76ers vs Rockets November 27, 2015 at  7:00pm')
    end

    it 'knows about a player in last place' do
      player = top_stats.last.player

      expect(player).to be_a Stattleship::Models::Player
      expect(player.name).to eq('Robert Covington')
      expect(player.position_abbreviation).to eq('SF')
      expect(player.position_name).to eq('Small Forward')
      expect(player.team.nickname).to eq('76ers')
    end

    it 'knows about the stat performance in last place' do
      top_stat = top_stats.last

      expect(top_stat.stat_name).to eq('steals')
      expect(top_stat.stat).to eq(7)
      expect(top_stat.place).to eq(2)
    end

    it 'knows the game for the stat performance in last place' do
      top_stat = top_stats.last

      expect(top_stat.game).to be_a Stattleship::Models::Game
      expect(top_stat.game.name).to eq('76ers vs Grizzlies November 29, 2015 at  5:00pm')
    end

    it 'can format a readable sentence' do
      top_stat = top_stats.last

      expect(
        top_stat.to_sentence
      ).to eq 'Robert Covington had 7 steals in 76ers vs Grizzlies November 29, 2015 at  5:00pm for the second best performance'
    end
  end
end
