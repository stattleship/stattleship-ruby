require 'spec_helper'

module Stattleship
  RSpec.describe HockeyStatLeaders do
    describe '#leaders' do
      it 'returns all the nhl_leaders' do
        expect(nhl_leaders.count).to eq 6
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey stat leaders' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/stat_leaders.json'))

        HockeyStatLeaders.fetch(stat: 'goals',
                                type: 'hockey_offensive_stat',
                                place: 3)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/stat_leaders?place=3&stat=goals&type=hockey_offensive_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/stat_leaders.json'))

        stat_leaders = HockeyStatLeaders.fetch

        expect(stat_leaders.count).to eq 6

        stat_leaders.each do |stat_leader|
          expect(stat_leader).to be_a Leader
        end
      end
    end
  end

  RSpec.describe Leader do
    it 'knows its place' do
      expect(nhl_leaders.first.place).to eq 1
      expect(nhl_leaders.last.place).to eq 3
    end

    it 'knows about a player in first place' do
      leader = nhl_leaders.first

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Vladimir Tarasenko')
      expect(leader.player.first_name).to eq('Vladimir')
      expect(leader.player.last_name).to eq('Tarasenko')
    end

    it 'knows about a player in second player in list' do
      leader = nhl_leaders[1]

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Patrick Kane')
      expect(leader.player.first_name).to eq('Patrick')
      expect(leader.player.last_name).to eq('Kane')
    end

    it 'knows about a player position' do
      leader = nhl_leaders.first
      player = leader.player

      expect(player.position_abbreviation).to eq('RW')
      expect(player.position_name).to eq('Right Wing')
    end

    it 'knows about the player team' do
      leader = nhl_leaders[1]
      team = leader.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('Chicago Blackhawks')
      expect(team.name).to eq('Chicago')
      expect(team.nickname).to eq('Blackhawks')
      expect(team.location).to eq('Chicago')
    end

    it 'can format a readable sentence' do
      leader = nhl_leaders.first

      expect(
        leader.to_sentence
      ).to eq 'Vladimir Tarasenko is in first place with 26 goals'
    end
  end
end
