require 'spec_helper'

module Stattleship
  RSpec.describe HockeyInjuries do
    describe '#injuries' do
      it 'returns all the nhl_injuries' do
        expect(nhl_injuries.count).to eq 3
      end
    end

    describe '.fetch' do
      context 'for injuries' do
        it 'makes a request to fetch hockey injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/injuries.json'))

          HockeyInjuries.fetch(params: injuries_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/hockey/nhl/injuries")
          ).to have_been_made.once
        end

        it 'parses and builds the hockey injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/injuries.json'))

          injuries = HockeyInjuries.fetch(params: injuries_params)

          expect(injuries.count).to eq 3

          injuries.each do |injury|
            expect(injury).to be_a Stattleship::Models::Injury
            expect(injury.player).to be_a Stattleship::Models::Player
            expect(injury.team).to be_a Stattleship::Models::Team
            expect(injury.season).to be_a Stattleship::Models::Season
            expect(injury.league).to be_a Stattleship::Models::League
          end

          expect(injuries.first.status).to eq 'I-R'
          expect(injuries.first.status_label).to eq 'Ques Thurs'
          expect(injuries.first.location_name).to eq 'Upper Body'
        end

        def injuries_params
          Stattleship::Params::HockeyInjuriesParams.new.tap do |params|
          end
        end
      end
    end
  end
end
