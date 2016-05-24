require 'spec_helper'

module Stattleship
  RSpec.describe BasketballTotalPlayerStat do
    describe '#total_player_stat' do
      it 'knows about a player' do
        expect(nba_total_player_stat.player).to be_a Stattleship::Models::Player
        expect(nba_total_player_stat.player.name).to eq('Stephen Curry')
        expect(nba_total_player_stat.player.first_name).to eq('Stephen')
        expect(nba_total_player_stat.player.last_name).to eq('Curry')
      end

      it 'knows about the stat and total' do
        expect(nba_total_player_stat.stat).to eq('three_pointers_made')
        expect(nba_total_player_stat.total).to eq(402)
      end

      it 'knows about a player position' do
        player = nba_total_player_stat.player

        expect(player.position_abbreviation).to eq('PG')
        expect(player.position_name).to eq('Point Guard')
      end

      it 'knows about the player team' do
        team = nba_total_player_stat.team

        expect(team).to be_a Stattleship::Models::Team
        expect(team.full_name).to eq('Golden State Warriors')
        expect(team.name).to eq('Golden State')
        expect(team.nickname).to eq('Warriors')
        expect(team.location).to eq('Golden State')
      end

      it 'knows about a seasonality' do
        expect(nba_total_player_stat.season_name).to eq('2015-2016')
        expect(nba_total_player_stat.interval_type).to eq('regularseason')
        expect(nba_total_player_stat.since).to be_nil
        expect(nba_total_player_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(nba_total_player_stat.season).to be_a Stattleship::Models::Season
        expect(nba_total_player_stat.season.name).to eq('2015-2016')
      end

      it 'can format a readable sentence' do
        expect(
          nba_total_player_stat.to_sentence
        ).to eq 'Stephen Curry had 402 three pointers made in the 2015-2016 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/total_player_stat.json'))

        BasketballTotalPlayerStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/total_stats?player_id=nba-stephen-curry&stat=three_pointers_made&type=basketball_offensive_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total player stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/total_player_stat.json'))

        total_stat = BasketballTotalPlayerStat.fetch(params: params)

        expect(total_stat).to be_a TotalPlayerStat
        expect(total_stat.player).to be_a Stattleship::Models::Player
        expect(total_stat.player.name).to eq('Stephen Curry')
        expect(total_stat.player.first_name).to eq('Stephen')
        expect(total_stat.player.last_name).to eq('Curry')
        expect(total_stat.stat).to eq('three_pointers_made')
        expect(total_stat.total).to eq(402)
      end

      def params
        Stattleship::Params::BasketballTotalPlayerStatParams.new.tap do |params|
          params.stat = 'three_pointers_made'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nba-stephen-curry'
        end
      end
    end
  end
end
