require 'spec_helper'

module Stattleship
  RSpec.describe BaseballTeams do
    describe '#teams' do
      it 'returns all the mlb_teams' do
        expect(mlb_teams.count).to eq 30
      end

      it 'returns sets the league' do
        mlb_teams.each do |team|
          expect(team.league).to be_a Models::League
          expect(team.league_abbreviation).to eq('MLB')
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/teams.json'))

        BaseballTeams.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/teams")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball teams' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/teams.json'))

        teams = BaseballTeams.fetch(params: params)

        expect(teams.count).to eq 30

        teams.each do |team|
          expect(team).to be_a Models::Team
        end
      end

      def params
        Stattleship::Params::BaseballTeamsParams.new
      end
    end
  end
end
