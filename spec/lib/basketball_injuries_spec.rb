require 'spec_helper'

module Stattleship
  RSpec.describe BasketballInjuries do
    describe '#injuries' do
      it 'returns all the nba_injuries' do
        expect(nba_injuries.count).to eq 3
      end
    end

    describe '.fetch' do
      context 'for injuries' do
        it 'makes a request to fetch basketball injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/injuries.json'))

          BasketballInjuries.fetch(params: injuries_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/basketball/nba/injuries")
          ).to have_been_made.once
        end

        it 'parses and builds the basketball injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/injuries.json'))

          injuries = BasketballInjuries.fetch(params: injuries_params)

          expect(injuries.count).to eq 3

          injuries.each do |injury|
            expect(injury).to be_a Stattleship::Models::Injury
            expect(injury.player).to be_a Stattleship::Models::Player
            expect(injury.team).to be_a Stattleship::Models::Team
            expect(injury.season).to be_a Stattleship::Models::Season
            expect(injury.league).to be_a Stattleship::Models::League
          end

          expect(injuries.first.status).to eq 'probable'
          expect(injuries.first.status_label).to eq 'Prob Mon'
          expect(injuries.first.location_name).to eq 'Undisclosed'
        end

        def injuries_params
          Stattleship::Params::BasketballInjuriesParams.new.tap do |params|
          end
        end
      end
    end
  end
end
