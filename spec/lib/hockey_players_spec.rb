require 'spec_helper'

module Stattleship
  RSpec.describe HockeyPlayers do
    describe '#players' do
      it 'returns all the nhl_players' do
        expect(nhl_players.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/players.json'))

        HockeyPlayers.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/players?team_id=nhl-col")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/players.json'))

        players = HockeyPlayers.fetch(params: params)

        expect(players.count).to eq 5

        players.each do |player|
          expect(player).to be_a Models::Player
        end
      end

      def params
        Stattleship::Params::HockeyPlayersParams.new.tap do |params|
          params.team_id = 'nhl-col'
        end
      end
    end
  end
end
