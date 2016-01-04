require 'spec_helper'

module Stattleship
  RSpec.describe BasketballTeams do
    describe '#teams' do
      it 'returns all the nba_teams' do
        expect(nba_teams.count).to eq 30
      end

      it 'returns sets the league' do
        nba_teams.each do |team|
          expect(team.league).to be_a Models::League
          expect(team.league_abbreviation).to eq('NBA')
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/teams.json'))

        BasketballTeams.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/teams")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/teams.json'))

        teams = BasketballTeams.fetch(params: params)

        expect(teams.count).to eq 30

        teams.each do |team|
          expect(team).to be_a Models::Team
        end
      end

      def params
        Stattleship::Params::BasketballTeamsParams.new
      end
    end
  end
end
