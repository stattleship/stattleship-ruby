require 'spec_helper'

module Stattleship
  RSpec.describe BasketballPlayers do
    describe '#players' do
      it 'returns all the nba_players' do
        expect(nba_players.count).to eq 6
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch basketball players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/players.json'))

        BasketballPlayers.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/basketball/nba/players?team_id=nba-sa")
        ).to have_been_made.once
      end

      it 'parses and builds the basketball players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nba/players.json'))

        players = BasketballPlayers.fetch(params: params)

        expect(players.count).to eq 6

        players.each do |player|
          expect(player).to be_a Models::Player
        end
      end

      def params
        Stattleship::Params::BasketballPlayersParams.new.tap do |params|
          params.team_id = 'nba-sa'
        end
      end
    end
  end
end
