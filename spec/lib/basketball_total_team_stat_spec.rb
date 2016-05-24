require 'spec_helper'

module Stattleship
  RSpec.describe BasketballTotalTeamStat do
    describe '#total_team_stat' do
      it 'knows about a team' do
        expect(nba_total_team_stat.team).to be_a Stattleship::Models::Team
        expect(nba_total_team_stat.team.name).to eq('Boston')
      end

      it 'knows about the stat and total' do
        expect(nba_total_team_stat.stat).to eq('three_pointers_made')
        expect(nba_total_team_stat.humanized_stat).to eq('Three Pointers Made')
        expect(nba_total_team_stat.total).to eq(717)
      end

      it 'knows about a seasonality' do
        expect(nba_total_team_stat.season_name).to eq('2015-2016')
        expect(nba_total_team_stat.interval_type).to eq('regularseason')
        expect(nba_total_team_stat.since).to be_nil
        expect(nba_total_team_stat.week).to be_nil
      end

      it 'knows about a season' do
        expect(nba_total_team_stat.season).to be_a Stattleship::Models::Season
        expect(nba_total_team_stat.season.name).to eq('2015-2016')
      end

      it 'can format a readable sentence' do
        expect(
          nba_total_team_stat.to_sentence
        ).to eq 'The Boston Celtics had 717 three pointers made in the 2015-2016 season'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/total_team_stat.json'))

        BasketballTotalTeamStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/total_stats?team_id=nba-bos&stat=three_pointers_made&type=basketball_team_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total team stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/total_team_stat.json'))

        total_stat = BasketballTotalTeamStat.fetch(params: params)

        expect(total_stat).to be_a TotalTeamStat
        expect(total_stat.team).to be_a Stattleship::Models::Team
        expect(total_stat.team.name).to eq('Boston')
        expect(total_stat.stat).to eq('three_pointers_made')
        expect(total_stat.total).to eq(717)
      end

      def params
        Stattleship::Params::BasketballTotalTeamStatParams.new.tap do |params|
          params.stat = 'three_pointers_made'
          params.team_id = 'nba-bos'
        end
      end
    end
  end
end
