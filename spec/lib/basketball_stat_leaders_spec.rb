require 'spec_helper'

module Stattleship
  RSpec.describe BasketballStatLeaders do
    describe '#leaders' do
      it 'returns all the nba_leaders' do
        expect(nba_leaders.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball stat leaders' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/stat_leaders.json'))

        BasketballStatLeaders.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/stat_leaders?place=5&stat=three_pointers_made&type=basketball_offensive_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/stat_leaders.json'))

        stat_leaders = BasketballStatLeaders.fetch(params: params)

        expect(stat_leaders.count).to eq 5

        stat_leaders.each do |stat_leader|
          expect(stat_leader).to be_a Leader
        end
      end

      def params
        Stattleship::Params::BasketballStatLeadersParams.new.tap do |params|
          params.stat = 'three_pointers_made'
          params.type = 'basketball_offensive_stat'
          params.place = 5
        end
      end
    end
  end

  RSpec.describe Leader do
    it 'knows its place' do
      expect(nba_leaders.first.place).to eq 1
      expect(nba_leaders.last.place).to eq 5
    end

    it 'knows about a player in first place' do
      leader = nba_leaders.first

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Stephen Curry')
      expect(leader.player.first_name).to eq('Stephen')
      expect(leader.player.last_name).to eq('Curry')
    end

    it 'knows about a player in second player in list' do
      leader = nba_leaders.last

      expect(leader.player).to be_a Stattleship::Models::Player
      expect(leader.player.name).to eq('Kyle Lowry')
      expect(leader.player.first_name).to eq('Kyle')
      expect(leader.player.last_name).to eq('Lowry')
    end

    it 'knows about a player position' do
      leader = nba_leaders.last
      player = leader.player

      expect(player.position_abbreviation).to eq('PG')
      expect(player.position_name).to eq('Point Guard')
    end

    it 'knows about the player team' do
      leader = nba_leaders.last
      team = leader.team

      expect(team).to be_a Stattleship::Models::Team
      expect(team.full_name).to eq('Toronto Raptors')
      expect(team.name).to eq('Toronto')
      expect(team.nickname).to eq('Raptors')
      expect(team.location).to eq('Toronto')
    end

    it 'knows about a stat' do
      leader = nba_leaders.first

      expect(leader.stat).to eq(402)
      expect(leader.stat_name).to eq('three_pointers_made')
      expect(leader.humanized_stat).to eq('Three Pointers Made')
    end

    it 'knows about a seasonality' do
      leader = nba_leaders.first

      expect(leader.season_slug).to eq('nba-2015-2016')
      expect(leader.season_name).to eq('2015-2016')
      expect(leader.since).to be_nil
      expect(leader.week).to be_nil
    end

    it 'can format a readable sentence' do
      leader = nba_leaders.first

      expect(
        leader.to_sentence
      ).to eq 'Stephen Curry is in first place with 402 three pointers made'
    end
  end
end
