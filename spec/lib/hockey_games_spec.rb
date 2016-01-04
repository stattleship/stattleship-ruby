require 'spec_helper'

module Stattleship
  RSpec.describe HockeyGames do
    describe '#games' do
      it 'returns all the nhl_games' do
        expect(nhl_games.count).to eq 3
      end

      it 'populates the game' do
        nhl_games.each do |game|
          expect(game).to be_a Models::Game
          expect(game.league).to be_a Models::League
          expect(game.league_abbreviation).to eq 'NHL'
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/games.json'))

        HockeyGames.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/games?status=ended")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/games.json'))

        games = HockeyGames.fetch(params: params)

        expect(games.count).to eq 3

        games.each do |game|
          expect(game).to be_a Models::Game
        end
      end

      def params
        Stattleship::Params::HockeyGamesParams.new.tap do |params|
          params.status = 'ended'
        end
      end
    end
  end
end
