require 'spec_helper'

module Stattleship
  RSpec.describe FootballStats do
    describe '#stats' do
      it 'returns all the nfl_player_stats' do
        expect(nfl_player_stats.count).to eq 16
      end
    end

    describe '.fetch' do
      context 'for player stats' do
        it 'makes a request to fetch football player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/player_stats.json'))

          FootballStats.fetch(params: player_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/football/nfl/stats?player_id=nfl-eli-manning&since=1%20month%20ago&stat=passes_touchdowns&type=football_offensive_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the football player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/player_stats.json'))

          stats = FootballStats.fetch(params: player_stats_params)

          expect(stats.count).to eq 16

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.player).to be_a Stattleship::Models::Player
            expect(stat.subject).to be_a Stattleship::Models::Player
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.player.name).to eq 'Eli Manning'
            expect(stat.subject.name).to eq 'Eli Manning'
            expect(stat.stat_name).to eq 'passes_touchdowns'
          end
        end
      end

      context 'for team stats' do
        it 'makes a request to fetch football team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/team_stats.json'))

          FootballStats.fetch(params: team_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/football/nfl/stats?team_id=nfl-nyg&since=1%20month%20ago&stat=points_quarter_1&type=football_team_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the football team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/team_stats.json'))

          stats = FootballStats.fetch(params: team_stats_params)

          expect(stats.count).to eq 16

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.subject).to be_a Stattleship::Models::Team
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.team.name).to eq 'N.Y. Giants'
            expect(stat.subject.name).to eq 'N.Y. Giants'
            expect(stat.stat_name).to eq 'points_quarter_2'
          end
        end
      end

      def player_stats_params
        Stattleship::Params::FootballStatsParams.new.tap do |params|
          params.stat = 'passes_touchdowns'
          params.type = 'football_offensive_stat'
          params.player_id = 'nfl-eli-manning'
          params.since = '1 month ago'
        end
      end

      def team_stats_params
        Stattleship::Params::FootballTeamStatsParams.new.tap do |params|
          params.stat = 'points_quarter_1'
          params.player_id = 'nfl-eli-manning'
          params.team_id = 'nfl-nyg'
          params.since = '1 month ago'
        end
      end
    end
  end
end
