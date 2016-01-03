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
        expect(nba_total_team_stat.total).to eq(291)
      end

      it 'can format a readable sentence' do
        expect(
          nba_total_team_stat.to_sentence
        ).to eq 'The Boston Celtics have 291 three_pointers_made'
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
        expect(total_stat.total).to eq(291)
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
