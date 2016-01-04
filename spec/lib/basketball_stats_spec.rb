require 'spec_helper'

module Stattleship
  RSpec.describe BasketballStats do
    describe '#stats' do
      it 'returns all the nba_player_stats' do
        expect(nba_player_stats.count).to eq 20
      end
    end

    describe '.fetch' do
      context 'for player stats' do
        it 'makes a request to fetch basketball player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/player_stats.json'))

          BasketballStats.fetch(params: player_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/basketball/nba/stats?player_id=nba-stephen-curry&since=1%20month%20ago&stat=three_pointers_made&type=basketball_offensive_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the basketball player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/player_stats.json'))

          stats = BasketballStats.fetch(params: player_stats_params)

          expect(stats.count).to eq 20

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.player).to be_a Stattleship::Models::Player
            expect(stat.subject).to be_a Stattleship::Models::Player
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.player.name).to eq 'Stephen Curry'
            expect(stat.subject.name).to eq 'Stephen Curry'
            expect(stat.stat_name).to eq 'three_pointers_made'
          end
        end
      end

      context 'for team stats' do
        it 'makes a request to fetch basketball team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/team_stats.json'))

          BasketballStats.fetch(params: team_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/basketball/nba/stats?team_id=nba-atl&since=1%20month%20ago&stat=points_quarter_1&type=basketball_team_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the basketball team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/team_stats.json'))

          stats = BasketballStats.fetch(params: team_stats_params)

          expect(stats.count).to eq 20

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.subject).to be_a Stattleship::Models::Team
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.team.name).to eq 'Atlanta'
            expect(stat.subject.name).to eq 'Atlanta'
            expect(stat.stat_name).to eq 'points_quarter_1'
          end
        end
      end

      def player_stats_params
        Stattleship::Params::BasketballStatsParams.new.tap do |params|
          params.stat = 'three_pointers_made'
          params.type = 'basketball_offensive_stat'
          params.player_id = 'nba-stephen-curry'
          params.since = '1 month ago'
        end
      end

      def team_stats_params
        Stattleship::Params::BasketballTeamStatsParams.new.tap do |params|
          params.stat = 'points_quarter_1'
          params.player_id = 'nba-stephen-curry'
          params.team_id = 'nba-atl'
          params.since = '1 month ago'
        end
      end
    end
  end
end
