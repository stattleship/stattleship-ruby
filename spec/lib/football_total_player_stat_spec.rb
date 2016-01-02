require 'spec_helper'

module Stattleship
  RSpec.describe FootballTotalPlayerStat do
    describe '#total_player_stat' do
      it 'knows about a player' do
        expect(nfl_total_player_stat.player).to be_a Stattleship::Models::Player
        expect(nfl_total_player_stat.player.name).to eq('Tom Brady')
        expect(nfl_total_player_stat.player.first_name).to eq('Tom')
        expect(nfl_total_player_stat.player.last_name).to eq('Brady')
      end

      it 'knows about the stat and total' do
        expect(nfl_total_player_stat.stat).to eq('passes_touchdowns')
        expect(nfl_total_player_stat.total).to eq(36)
      end

      it 'knows about a player position' do
        player = nfl_total_player_stat.player

        expect(player.position_abbreviation).to eq('QB')
        expect(player.position_name).to eq('Quarterback')
      end

      it 'knows about the player team' do
        team = nfl_total_player_stat.team

        expect(team).to be_a Stattleship::Models::Team
        expect(team.full_name).to eq('New England Patriots')
        expect(team.name).to eq('New England')
        expect(team.nickname).to eq('Patriots')
        expect(team.location).to eq('New England')
      end

      it 'can format a readable sentence' do
        expect(
          nfl_total_player_stat.to_sentence
        ).to eq 'Tom Brady has 36 passes_touchdowns'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_player_stat.json'))

        FootballTotalPlayerStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/total_stats?player_id=nfl-tom-brady&stat=passes_touchdowns&type=football_passing_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total player stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_player_stat.json'))

        total_stat = FootballTotalPlayerStat.fetch(params: params)

        expect(total_stat).to be_a TotalPlayerStat
        expect(total_stat.player).to be_a Stattleship::Models::Player
        expect(total_stat.player.name).to eq('Tom Brady')
        expect(total_stat.player.first_name).to eq('Tom')
        expect(total_stat.player.last_name).to eq('Brady')
        expect(total_stat.stat).to eq('passes_touchdowns')
        expect(total_stat.total).to eq(36)
      end

      def params
        Stattleship::Params::FootballTotalPlayerStatParams.new.tap do |params|
          params.stat = 'passes_touchdowns'
          params.type = 'football_passing_stat'
          params.player_id = 'nfl-tom-brady'
        end
      end
    end
  end
end
