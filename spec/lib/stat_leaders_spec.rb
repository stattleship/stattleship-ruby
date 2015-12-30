require 'spec_helper'

module Stattleship
  RSpec.describe StatLeaders do
    describe '#leaders' do
      it 'returns all the leaders' do
        expect(leaders.count).to eq 6
      end
    end
  end

  RSpec.describe Leader do
    it 'knows its place' do
      expect(leaders.first.place).to eq 1
      expect(leaders.last.place).to eq 3
    end

    it 'knows about a player in first place' do
      leader = leaders.first

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Vladimir Tarasenko')
      expect(leader.player.first_name).to eq('Vladimir')
      expect(leader.player.last_name).to eq('Tarasenko')
    end

    it 'knows about a player in second player in list' do
      leader = leaders[1]

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Patrick Kane')
      expect(leader.player.first_name).to eq('Patrick')
      expect(leader.player.last_name).to eq('Kane')
    end

    it 'knows about a player position' do
      leader = leaders.first
      player = leader.player

      expect(player.position_abbreviation).to eq('RW')
      expect(player.position_name).to eq('Right Wing')
    end

    it 'knows about the player team' do
      leader = leaders[1]
      team = leader.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('Chicago Blackhawks')
      expect(team.name).to eq('Chicago')
      expect(team.nickname).to eq('Blackhawks')
      expect(team.location).to eq('Chicago')
    end

    it 'can format a readable sentence' do
      leader = leaders.first

      expect(leader.to_sentence).to eq 'Vladimir Tarasenko is in first place with 26 goals'
    end
  end
end
