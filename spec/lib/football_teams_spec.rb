require 'spec_helper'

module Stattleship
  RSpec.describe FootballTeams do
    describe '#teams' do
      it 'returns all the nfl_teams' do
        expect(nfl_teams.count).to eq 32
      end

      it 'returns sets the league' do
        nfl_teams.each do |team|
          expect(team.league).to be_a Models::League
          expect(team.league_abbreviation).to eq('NFL')
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/teams.json'))

        FootballTeams.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/teams")
        ).to have_been_made.once
      end

      it 'parses and builds the football teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/teams.json'))

        teams = FootballTeams.fetch(params: params)

        expect(teams.count).to eq 32

        teams.each do |team|
          expect(team).to be_a Models::Team
        end
      end

      def params
        Stattleship::Params::FootballTeamsParams.new
      end
    end
  end
end
