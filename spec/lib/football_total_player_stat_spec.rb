require 'spec_helper'

module Stattleship
  RSpec.describe FootballTotalPlayerStat do
    describe '#total_player_stat' do
      it 'knows about a player' do
        expect(nfl_total_player_stat.player).to be_a Stattleship::Models::Player
        expect(nfl_total_player_stat.player.name).to eq('Brandon Marshall')
        expect(nfl_total_player_stat.player.first_name).to eq('Brandon')
        expect(nfl_total_player_stat.player.last_name).to eq('Marshall')
      end

      it 'knows about the stat and total' do
        expect(nfl_total_player_stat.stat).to eq('receptions_total')
        expect(total_player_stat.humanized_stat).to eq('Receptions Total')
        expect(nfl_total_player_stat.total).to eq(109)
      end

      it 'knows about a player position' do
        player = nfl_total_player_stat.player

        expect(player.position_abbreviation).to eq('WR')
        expect(player.position_name).to eq('Wide Receiver')
      end

      it 'knows about the player team' do
        team = nfl_total_player_stat.team

        expect(team).to be_a Stattleship::Models::Team
        expect(team.full_name).to eq('New York Jets')
        expect(team.name).to eq('N.Y. Jets')
        expect(team.nickname).to eq('Jets')
        expect(team.location).to eq('New York')
      end

      it 'knows about a seasonality' do
        expect(total_player_stat.season_name).to eq('2015-2016')
        expect(total_player_stat.interval_type).to eq('week')
        expect(total_player_stat.since).to be_nil
        expect(total_player_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(total_player_stat.season).to be_a Stattleship::Models::Season
        expect(total_player_stat.season.name).to eq('2015-2016')
      end

      it 'can format a readable sentence' do
        expect(
          nfl_total_player_stat.to_sentence
        ).to eq 'Brandon Marshall had 109 receptions total in the 2015-2016 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_player_stat.json'))

        FootballTotalPlayerStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/total_stats?player_id=nfl-brandon-marshall&stat=receptions_total&type=football_passing_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total player stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_player_stat.json'))

        total_stat = FootballTotalPlayerStat.fetch(params: params)

        expect(total_stat).to be_a TotalPlayerStat
        expect(total_stat.player).to be_a Stattleship::Models::Player
        expect(total_stat.player.name).to eq('Brandon Marshall')
        expect(total_stat.player.first_name).to eq('Brandon')
        expect(total_stat.player.last_name).to eq('Marshall')
        expect(total_stat.stat).to eq('receptions_total')
        expect(total_stat.total).to eq(109)
      end

      def params
        Stattleship::Params::FootballTotalPlayerStatParams.new.tap do |params|
          params.stat = 'receptions_total'
          params.type = 'football_passing_stat'
          params.player_id = 'nfl-brandon-marshall'
        end
      end
    end
  end
end
