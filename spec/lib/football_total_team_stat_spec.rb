require 'spec_helper'

module Stattleship
  RSpec.describe FootballTotalTeamStat do
    describe '#total_team_stat' do
      it 'knows about a team' do
        expect(nfl_total_team_stat.team).to be_a Stattleship::Models::Team
        expect(nfl_total_team_stat.team.name).to eq('N.Y. Giants')
      end

      it 'knows about the stat and total' do
        expect(nfl_total_team_stat.stat).to eq('passing_gross_yards')
        expect(nfl_total_team_stat.total).to eq(4202)
      end

      it 'can format a readable sentence' do
        expect(
          nfl_total_team_stat.to_sentence
        ).to eq 'The New York Giants have 4202 passing_gross_yards'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football stat totals' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_team_stat.json'))

        FootballTotalTeamStat.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/total_stats?team_id=nfl-nyg&stat=passing_gross_yards&type=football_team_stat")
        ).to have_been_made.once
      end

      it 'parses and builds the total team stat' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/total_team_stat.json'))

        total_stat = FootballTotalTeamStat.fetch(params: params)

        expect(total_stat).to be_a TotalTeamStat
        expect(total_stat.team).to be_a Stattleship::Models::Team
        expect(total_stat.team.name).to eq('N.Y. Giants')
        expect(total_stat.stat).to eq('passing_gross_yards')
        expect(total_stat.total).to eq(4202)
      end

      def params
        Stattleship::Params::FootballTotalTeamStatParams.new.tap do |params|
          params.stat = 'passing_gross_yards'
          params.team_id = 'nfl-nyg'
        end
      end
    end
  end
end
