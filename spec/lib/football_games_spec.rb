require 'spec_helper'

module Stattleship
  RSpec.describe FootballGames do
    describe '#games' do
      it 'returns all the nfl_games' do
        expect(nfl_games.count).to eq 10
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
