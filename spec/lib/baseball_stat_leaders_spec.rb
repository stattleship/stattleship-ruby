require 'spec_helper'

module Stattleship
  RSpec.describe BaseballStatLeaders do
    describe '#leaders' do
      it 'returns all the mlb_leaders' do
        expect(mlb_leaders.count).to eq 6
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

        expect(stat_leaders.count).to eq 6

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
      expect(leader.player.name).to eq('Chris Davis')
      expect(leader.player.first_name).to eq('Chris')
      expect(leader.player.last_name).to eq('Davis')
    end

    it 'knows about a player in second player in list' do
      leader = mlb_leaders[1]

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Bryce Harper')
      expect(leader.player.first_name).to eq('Bryce')
      expect(leader.player.last_name).to eq('Harper')
    end

    it 'knows about a player position' do
      leader = mlb_leaders.first
      player = leader.player

      expect(player.position_abbreviation).to eq('1B')
      expect(player.position_name).to eq('First Base')
    end

    it 'knows about the player team' do
      leader = mlb_leaders[1]
      team = leader.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('Washington Nationals')
      expect(team.name).to eq('Washington')
      expect(team.nickname).to eq('Nationals')
      expect(team.location).to eq('Washington')
    end

    it 'knows about a stat' do
      leader = mlb_leaders.first

      expect(leader.stat).to eq(47)
      expect(leader.stat_name).to eq('home_runs')
      expect(leader.humanized_stat).to eq('Home Runs')
    end

    it 'knows about a seasonality' do
      leader = mlb_leaders.first

      expect(leader.season_slug).to eq('mlb-2015')
      expect(leader.season_name).to eq('2015')
      expect(leader.since).to be_nil
      expect(leader.week).to be_nil
    end

    it 'can format a readable sentence' do
      leader = mlb_leaders.first

      expect(
        leader.to_sentence
      ).to eq 'Chris Davis is in first place with 47 home runs'
    end
  end
end
