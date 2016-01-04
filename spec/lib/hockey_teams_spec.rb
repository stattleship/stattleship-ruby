require 'spec_helper'

module Stattleship
  RSpec.describe HockeyTeams do
    describe '#teams' do
      it 'returns all the nhl_teams' do
        expect(nhl_teams.count).to eq 30
      end

      it 'returns sets the league' do
        nhl_teams.each do |team|
          expect(team.league).to be_a Models::League
          expect(team.league_abbreviation).to eq('NHL')
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/teams.json'))

        HockeyTeams.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/teams")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/teams.json'))

        teams = HockeyTeams.fetch(params: params)

        expect(teams.count).to eq 30

        teams.each do |team|
          expect(team).to be_a Models::Team
        end
      end

      def params
        Stattleship::Params::HockeyTeamsParams.new
      end
    end
  end
end
