require 'spec_helper'

module Stattleship
  RSpec.describe BaseballInjuries do
    describe '#injuries' do
      xit 'returns all the mlb_injuries' do
        expect(mlb_injuries.count).to eq 3
      end
    end

    describe '.fetch' do
      context 'for injuries' do
        xit 'makes a request to fetch Baseball injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/injuries.json'))

          BaseballInjuries.fetch(params: injuries_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/baseball/mlb/injuries")
          ).to have_been_made.once
        end

        xit 'parses and builds the Baseball injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/injuries.json'))

          injuries = BaseballInjuries.fetch(params: injuries_params)

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
          Stattleship::Params::BaseballInjuriesParams.new.tap do |params|
          end
        end
      end
    end
  end
end
