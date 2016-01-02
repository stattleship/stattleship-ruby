require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTotalPlayerStat do
    describe '#total_player_stat' do
      it 'knows about a player' do
        expect(nhl_total_player_stat.player).to be_a Stattleship::Models::Player
        expect(nhl_total_player_stat.player.name).to eq('Patrick Kane')
        expect(nhl_total_player_stat.player.first_name).to eq('Patrick')
        expect(nhl_total_player_stat.player.last_name).to eq('Kane')
      end

      it 'knows about the stat and total' do
        expect(nhl_total_player_stat.stat).to eq('points')
        expect(nhl_total_player_stat.total).to eq(50)
      end

      it 'knows about a player position' do
        player = nhl_total_player_stat.player

        expect(player.position_abbreviation).to eq('RW')
        expect(player.position_name).to eq('Right Wing')
      end

      it 'knows about the player team' do
        team = nhl_total_player_stat.team

        expect(team).to be_a Stattleship::Models::Team
        expect(team.full_name).to eq('Chicago Blackhawks')
        expect(team.name).to eq('Chicago')
        expect(team.nickname).to eq('Blackhawks')
        expect(team.location).to eq('Chicago')
      end

      it 'can format a readable sentence' do
        expect(
          nhl_total_player_stat.to_sentence
        ).to eq 'Patrick Kane has 50 points'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/total_player_stat.json'))

        HockeyTotalPlayerStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/total_stats?player_id=nhl-patrick-kane&stat=points&type=hockey_offensive_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total player stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/total_player_stat.json'))

        total_stat = HockeyTotalPlayerStat.fetch(params: params)

        expect(total_stat).to be_a TotalPlayerStat
        expect(total_stat.player).to be_a Stattleship::Models::Player
        expect(total_stat.player.name).to eq('Patrick Kane')
        expect(total_stat.player.first_name).to eq('Patrick')
        expect(total_stat.player.last_name).to eq('Kane')
        expect(total_stat.stat).to eq('points')
        expect(total_stat.total).to eq(50)
      end

      def params
        Stattleship::Params::HockeyTotalPlayerStatParams.new.tap do |params|
          params.stat = 'points'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'nhl-patrick-kane'
        end
      end
    end
  end
end
