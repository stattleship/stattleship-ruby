require 'spec_helper'

module Stattleship
  RSpec.describe FootballPlayers do
    describe '#players' do
      it 'returns all the nfl_players' do
        expect(nfl_players.count).to eq 5
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/players.json'))

        FootballPlayers.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/players?team_id=nfl-ne")
        ).to have_been_made.once
      end

      it 'parses and builds the football players' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/players.json'))

        players = FootballPlayers.fetch(params: params)

        expect(players.count).to eq 5

        players.each do |player|
          expect(player).to be_a Models::Player
        end
      end

      def params
        Stattleship::Params::FootballPlayersParams.new.tap do |params|
          params.team_id = 'nfl-ne'
        end
      end
    end
  end
end
