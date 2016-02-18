require 'spec_helper'

module Stattleship
  RSpec.describe BasketballGames do
    describe '#games' do
      it 'returns all the nba_games' do
        expect(nba_games.count).to eq 6
      end

      it 'populates the game' do
        nba_games.each do |game|
          expect(game).to be_a Models::Game
          expect(game.away_team).to be_a Models::Team
          expect(game.home_team).to be_a Models::Team
          expect(game.winning_team).to be_a Models::Team
          expect(game.league).to be_a Models::League
          expect(game.league_abbreviation).to eq 'NBA'
        end

        expect(nba_games.first.away_team_name).to eq 'Denver'
        expect(nba_games.first.home_team_name).to eq 'Golden State'
        expect(nba_games.first.winning_team_name).to eq 'Golden State'

        expect(nba_games.first.latitude).to eq(38.8980412)
        expect(nba_games.first.longitude).to eq(-77.0209114)
        expect(nba_games.first.coordinates).to eq([38.8980412, -77.0209114])
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/games.json'))

        BasketballGames.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/games?status=ended")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball games' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/games.json'))

        games = BasketballGames.fetch(params: params)

        expect(games.count).to eq 6

        games.each do |game|
          expect(game).to be_a Models::Game
        end
      end

      def params
        Stattleship::Params::BasketballGamesParams.new.tap do |params|
          params.status = 'ended'
        end
      end
    end
  end
end
