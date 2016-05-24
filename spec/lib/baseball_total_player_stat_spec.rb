require 'spec_helper'

module Stattleship
  RSpec.describe BaseballTotalPlayerStat do
    describe '#total_player_stat' do
      it 'knows about a player' do
        expect(mlb_total_player_stat.player).to be_a Stattleship::Models::Player
        expect(mlb_total_player_stat.player.name).to eq('David Price')
        expect(mlb_total_player_stat.player.first_name).to eq('David')
        expect(mlb_total_player_stat.player.last_name).to eq('Price')
      end

      it 'knows about the stat and total' do
        expect(mlb_total_player_stat.stat).to eq('pitches_thrown')
        expect(mlb_total_player_stat.total).to eq(3388)
      end

      it 'knows about a player position' do
        player = mlb_total_player_stat.player

        expect(player.position_abbreviation).to eq('SP')
        expect(player.position_name).to eq('Starter')
      end

      it 'knows about the player team' do
        team = mlb_total_player_stat.team

        expect(team).to be_a Stattleship::Models::Team
        expect(team.full_name).to eq('Detroit Tigers')
        expect(team.name).to eq('Detroit')
        expect(team.nickname).to eq('Tigers')
        expect(team.location).to eq('Detroit')
      end

      it 'knows about a seasonality' do
        expect(mlb_total_player_stat.season_name).to eq('2015')
        expect(mlb_total_player_stat.interval_type).to eq('regularseason')
        expect(mlb_total_player_stat.since).to be_nil
        expect(mlb_total_player_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(mlb_total_player_stat.season).to be_a Stattleship::Models::Season
        expect(mlb_total_player_stat.season.name).to eq('2015')
      end

      it 'can format a readable sentence' do
        expect(
          mlb_total_player_stat.to_sentence
        ).to eq 'David Price had 3388 pitches thrown in the 2015 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/total_player_stat.json'))

        BaseballTotalPlayerStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/total_stats?player_id=mlb-david-price&stat=pitches_thrown&type=baseball_pitcher_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total player stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/total_player_stat.json'))

        total_stat = BaseballTotalPlayerStat.fetch(params: params)

        expect(total_stat).to be_a TotalPlayerStat
        expect(total_stat.player).to be_a Stattleship::Models::Player
        expect(total_stat.player.name).to eq('David Price')
        expect(total_stat.player.first_name).to eq('David')
        expect(total_stat.player.last_name).to eq('Price')
        expect(total_stat.stat).to eq('pitches_thrown')
        expect(total_stat.total).to eq(3388)
      end

      def params
        Stattleship::Params::BaseballTotalPlayerStatParams.new.tap do |params|
          params.stat = 'pitches_thrown'
          params.type = 'baseball_pitcher_stat'
          params.player_id = 'mlb-david-price'
        end
      end
    end
  end
end
