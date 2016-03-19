require 'spec_helper'

module Stattleship
  RSpec.describe BaseballStats do
    describe '#stats' do
      it 'returns all the mlb_player_stats' do
        expect(mlb_player_stats.count).to eq 4
      end
    end

    describe '.fetch' do
      context 'for player stats' do
        it 'makes a request to fetch Baseball player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/player_stats.json'))

          BaseballStats.fetch(params: player_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/baseball/mlb/stats?player_id=mlb-mike-trout&since=1%20month%20ago&stat=home_runs&type=baseball_hitter_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the Baseball player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/player_stats.json'))

          stats = BaseballStats.fetch(params: player_stats_params)

          expect(stats.count).to eq 4

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.player).to be_a Stattleship::Models::Player
            expect(stat.subject).to be_a Stattleship::Models::Player
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.player.name).to eq 'Mike Trout'
            expect(stat.subject.name).to eq 'Mike Trout'
            expect(stat.stat_name).to eq 'home_runs'
          end
        end
      end

      context 'for team stats' do
        it 'makes a request to fetch Baseball team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/team_stats.json'))

          BaseballStats.fetch(params: team_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/baseball/mlb/stats?team_id=mlb-bos&since=1%20month%20ago&stat=runs_batted_in&type=baseball_team_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the Baseball team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/team_stats.json'))

          stats = BaseballStats.fetch(params: team_stats_params)

          expect(stats.count).to eq 3

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.subject).to be_a Stattleship::Models::Team
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.team.name).to eq 'Boston'
            expect(stat.subject.name).to eq 'Boston'
            expect(stat.stat_name).to eq 'runs_batted_in'
          end
        end
      end

      def player_stats_params
        Stattleship::Params::BaseballStatsParams.new.tap do |params|
          params.stat = 'home_runs'
          params.type = 'baseball_hitter_stat'
          params.player_id = 'mlb-mike-trout'
          params.since = '1 month ago'
        end
      end

      def team_stats_params
        Stattleship::Params::BaseballTeamStatsParams.new.tap do |params|
          params.stat = 'runs_batted_in'
          params.team_id = 'mlb-bos'
          params.since = '1 month ago'
        end
      end
    end
  end
end
