require 'spec_helper'

module Stattleship
  RSpec.describe BaseballTotalTeamStat do
    describe '#total_team_stat' do
      it 'knows about a team' do
        expect(mlb_total_team_stat.team).to be_a Stattleship::Models::Team
        expect(mlb_total_team_stat.team.name).to eq('Kansas City')
      end

      it 'knows about the stat and total' do
        expect(mlb_total_team_stat.stat).to eq('hits')
        expect(mlb_total_team_stat.humanized_stat).to eq('Hits')
        expect(mlb_total_team_stat.total).to eq(1484)
      end

      it 'knows about a seasonality' do
        expect(mlb_total_team_stat.season_name).to eq('2015')
        expect(mlb_total_team_stat.interval_type).to eq('regularseason')
        expect(mlb_total_team_stat.since).to be_nil
        expect(mlb_total_team_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(mlb_total_team_stat.season).to be_a Stattleship::Models::Season
        expect(mlb_total_team_stat.season.name).to eq('2015')
      end

      it 'can format a readable sentence' do
        expect(
          mlb_total_team_stat.to_sentence
        ).to eq 'The Kansas City Royals had 1484 hits in the 2015 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/total_team_stat.json'))

        BaseballTotalTeamStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/total_stats?team_id=mlb-kc&stat=hits&type=baseball_team_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total team stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/total_team_stat.json'))

        total_stat = BaseballTotalTeamStat.fetch(params: params)

        expect(total_stat).to be_a TotalTeamStat
        expect(total_stat.team).to be_a Stattleship::Models::Team
        expect(total_stat.team.name).to eq('Kansas City')
        expect(total_stat.stat).to eq('hits')
        expect(total_stat.total).to eq(1484)
      end

      def params
        Stattleship::Params::BaseballTotalTeamStatParams.new.tap do |params|
          params.stat = 'hits'
          params.team_id = 'mlb-kc'
        end
      end
    end
  end
end
