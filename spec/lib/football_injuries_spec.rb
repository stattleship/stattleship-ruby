require 'spec_helper'

module Stattleship
  RSpec.describe FootballInjuries do
    describe '#injuries' do
      it 'returns all the nfl_injuries' do
        expect(nfl_injuries.count).to eq 3
      end
    end

    describe '.fetch' do
      context 'for injuries' do
        it 'makes a request to fetch football injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/injuries.json'))

          FootballInjuries.fetch(params: injuries_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/football/nfl/injuries")
          ).to have_been_made.once
        end

        it 'parses and builds the football injuries' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/injuries.json'))

          injuries = FootballInjuries.fetch(params: injuries_params)

          expect(injuries.count).to eq 3

          injuries.each do |injury|
            expect(injury).to be_a Stattleship::Models::Injury
            expect(injury.player).to be_a Stattleship::Models::Player
            expect(injury.team).to be_a Stattleship::Models::Team
            expect(injury.season).to be_a Stattleship::Models::Season
            expect(injury.league).to be_a Stattleship::Models::League
          end

          expect(injuries.first.status).to eq 'probable'
          expect(injuries.first.status_label).to eq 'Prob Sun'
          expect(injuries.first.location_name).to eq 'Hernia'
        end

        def injuries_params
          Stattleship::Params::FootballInjuriesParams.new.tap do |params|
          end
        end
      end
    end
  end
end
