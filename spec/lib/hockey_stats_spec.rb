require 'spec_helper'

module Stattleship
  RSpec.describe HockeyStats do
    describe '#stats' do
      it 'returns all the nhl_player_stats' do
        expect(nhl_player_stats.count).to eq 20
      end
    end

    describe '.fetch' do
      context 'for player stats' do
        it 'makes a request to fetch hockey player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/player_stats.json'))

          HockeyStats.fetch(params: player_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/hockey/nhl/stats?player_id=nhl-tyler-seguin&since=1%20month%20ago&stat=passes_touchdowns&type=hockey_offensive_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the hockey player stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/player_stats.json'))

          stats = HockeyStats.fetch(params: player_stats_params)

          expect(stats.count).to eq 20

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.player).to be_a Stattleship::Models::Player
            expect(stat.subject).to be_a Stattleship::Models::Player
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.player.name).to eq 'Tyler Seguin'
            expect(stat.subject.name).to eq 'Tyler Seguin'
            expect(stat.stat_name).to eq 'goals'
          end
        end
      end

      context 'for team stats' do
        it 'makes a request to fetch hockey team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/team_stats.json'))

          HockeyStats.fetch(params: team_stats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/hockey/nhl/stats?team_id=nhl-bos&since=1%20month%20ago&stat=goals_period_1&type=hockey_team_stat")
          ).to have_been_made.once
        end

        it 'parses and builds the hockey team stats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/team_stats.json'))

          stats = HockeyStats.fetch(params: team_stats_params)

          expect(stats.count).to eq 20

          stats.each do |stat|
            expect(stat).to be_a Stattleship::Stat
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.subject).to be_a Stattleship::Models::Team
            expect(stat.team).to be_a Stattleship::Models::Team
            expect(stat.team.name).to eq 'Boston'
            expect(stat.subject.name).to eq 'Boston'
            expect(stat.stat_name).to eq 'goals_period_1'
          end
        end
      end

      def player_stats_params
        Stattleship::Params::HockeyStatsParams.new.tap do |params|
          params.stat = 'passes_touchdowns'
          params.type = 'hockey_offensive_stat'
          params.player_id = 'nhl-tyler-seguin'
          params.since = '1 month ago'
        end
      end

      def team_stats_params
        Stattleship::Params::HockeyTeamStatsParams.new.tap do |params|
          params.stat = 'goals_period_1'
          params.player_id = 'nhl-tyler-seguin'
          params.team_id = 'nhl-bos'
          params.since = '1 month ago'
        end
      end
    end
  end
end
