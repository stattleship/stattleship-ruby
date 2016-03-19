require 'spec_helper'

module Stattleship
  RSpec.describe BaseballStatLeaders do
    describe '#leaders' do
      it 'returns all the mlb_leaders' do
        expect(mlb_leaders.count).to eq 4
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball stat leaders' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/stat_leaders.json'))

        BaseballStatLeaders.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/stat_leaders?place=3&stat=home_runs&type=baseball_hitter_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/stat_leaders.json'))

        stat_leaders = BaseballStatLeaders.fetch(params: params)

        expect(stat_leaders.count).to eq 4

        stat_leaders.each do |stat_leader|
          expect(stat_leader).to be_a Leader
        end
      end

      def params
        Stattleship::Params::BaseballStatLeadersParams.new.tap do |params|
          params.stat = 'home_runs'
          params.type = 'baseball_hitter_stat'
          params.place = 3
        end
      end
    end
  end

  RSpec.describe Leader do
    it 'knows its place' do
      expect(mlb_leaders.first.place).to eq 1
      expect(mlb_leaders.last.place).to eq 3
    end

    it 'knows about a player in first place' do
      leader = mlb_leaders.first

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Bryce Harper')
      expect(leader.player.first_name).to eq('Bryce')
      expect(leader.player.last_name).to eq('Harper')
    end

    it 'knows about a player in second player in list' do
      leader = mlb_leaders[1]

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Nelson Cruz')
      expect(leader.player.first_name).to eq('Nelson')
      expect(leader.player.last_name).to eq('Cruz')
    end

    it 'knows about a player position' do
      leader = mlb_leaders.first
      player = leader.player

      expect(player.position_abbreviation).to eq('RF')
      expect(player.position_name).to eq('Right Outfield')
    end

    it 'knows about the player team' do
      leader = mlb_leaders[1]
      team = leader.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('Seattle Mariners')
      expect(team.name).to eq('Seattle')
      expect(team.nickname).to eq('Mariners')
      expect(team.location).to eq('Seattle')
    end

    it 'can format a readable sentence' do
      leader = mlb_leaders.first

      expect(
        leader.to_sentence
      ).to eq 'Bryce Harper is in first place with 19 home_runs'
    end
  end
end
