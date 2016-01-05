require 'spec_helper'

module Stattleship
  RSpec.describe FootballGames do
    describe '#games' do
      it 'returns all the nfl_games' do
        expect(nfl_games.count).to eq 10
      end

      it 'populates the game' do
        nfl_games.each do |game|
          expect(game).to be_a Models::Game
          expect(game.away_team).to be_a Models::Team
          expect(game.home_team).to be_a Models::Team
          expect(game.league).to be_a Models::League
          expect(game.league_abbreviation).to eq 'NFL'
        end

        expect(nfl_games.first.away_team_name).to eq 'N.Y. Jets'
        expect(nfl_games.first.home_team_name).to eq 'Buffalo'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/games.json'))

        FootballGames.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/games?status=in_progress")
        ).to have_been_made.once
      end

      it 'parses and builds the football games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/games.json'))

        games = FootballGames.fetch(params: params)

        expect(games.count).to eq 10

        games.each do |game|
          expect(game).to be_a Models::Game
        end
      end

      def params
        Stattleship::Params::FootballGamesParams.new.tap do |params|
          params.status = 'in_progress'
        end
      end
    end
  end
end
