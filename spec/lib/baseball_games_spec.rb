require 'spec_helper'

module Stattleship
  RSpec.describe BaseballGames do
    describe '#games' do
      it 'returns all the mlb_games' do
        expect(mlb_games.count).to eq 6
      end

      it 'populates the game' do
        mlb_games.each do |game|
          expect(game).to be_a Models::Game
          expect(game.away_team).to be_a Models::Team
          expect(game.home_team).to be_a Models::Team
          # expect(game.winning_team).to be_a Models::Team
          expect(game.league).to be_a Models::League
          expect(game.league_abbreviation).to eq 'MLB'
        end

        expect(mlb_games.first.away_team_name).to eq 'Pittsburgh'
        expect(mlb_games.first.home_team_name).to eq 'St. Louis'
        # expect(mlb_games.first.winning_team_name).to eq 'Golden State'

        # expect(mlb_games.first.latitude).to eq(38.8980412)
        # expect(mlb_games.first.longitude).to eq(-77.0209114)
        # expect(mlb_games.first.coordinates).to eq([38.8980412, -77.0209114])
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/games.json'))

        BaseballGames.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/games?status=ended")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/games.json'))

        games = BaseballGames.fetch(params: params)

        expect(games.count).to eq 6

        games.each do |game|
          expect(game).to be_a Models::Game
        end
      end

      def params
        Stattleship::Params::BaseballGamesParams.new.tap do |params|
          params.status = 'ended'
        end
      end
    end
  end
end
