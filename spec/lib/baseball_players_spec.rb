require 'spec_helper'

module Stattleship
  RSpec.describe BaseballPlayers do
    describe '#players' do
      it 'returns all the mlb_players' do
        expect(mlb_players.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch Baseball players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/players.json'))

        BaseballPlayers.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/baseball/mlb/players?team_id=mlb-kc")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/mlb/players.json'))

        players = BaseballPlayers.fetch(params: params)

        expect(players.count).to eq 5

        players.each do |player|
          expect(player).to be_a Models::Player
        end
      end

      def params
        Stattleship::Params::BaseballPlayersParams.new.tap do |params|
          params.team_id = 'mlb-kc'
        end
      end
    end
  end
end
