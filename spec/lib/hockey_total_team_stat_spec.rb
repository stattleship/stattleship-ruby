require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTotalTeamStat do
    describe '#total_team_stat' do
      it 'knows about a team' do
        expect(nhl_total_team_stat.team).to be_a Stattleship::Models::Team
        expect(nhl_total_team_stat.team.name).to eq('Montreal')
      end

      it 'knows about the stat and total' do
        expect(nhl_total_team_stat.stat).to eq('goals_period_3')
        expect(nhl_total_team_stat.humanized_stat).to eq('Goals Period 3')
        expect(nhl_total_team_stat.total).to eq(65)
      end

      it 'knows about a seasonality' do
        expect(nhl_total_team_stat.season_name).to eq('2015-2016')
        expect(nhl_total_team_stat.interval_type).to eq('regularseason')
        expect(nhl_total_team_stat.since).to be_nil
        expect(nhl_total_team_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(nhl_total_team_stat.season).to be_a Stattleship::Models::Season
        expect(nhl_total_team_stat.season.name).to eq('2015-2016')
      end

      it 'can format a readable sentence' do
        expect(
          nhl_total_team_stat.to_sentence
        ).to eq 'The Montreal Canadiens had 65 goals period 3 in the 2015-2016 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/total_team_stat.json'))

        HockeyTotalTeamStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/total_stats?team_id=nhl-bos&stat=goals_period_3&type=hockey_team_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total team stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/total_team_stat.json'))

        total_stat = HockeyTotalTeamStat.fetch(params: params)

        expect(total_stat).to be_a TotalTeamStat
        expect(total_stat.team).to be_a Stattleship::Models::Team
        expect(total_stat.team.name).to eq('Montreal')
        expect(total_stat.stat).to eq('goals_period_3')
        expect(total_stat.total).to eq(65)
      end

      def params
        Stattleship::Params::HockeyTotalTeamStatParams.new.tap do |params|
          params.stat = 'goals_period_3'
          params.team_id = 'nhl-bos'
        end
      end
    end
  end
end
