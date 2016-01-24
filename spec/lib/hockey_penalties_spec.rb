require 'spec_helper'

module Stattleship
  RSpec.describe HockeyPenalties do
    describe '#penalties' do
      it 'returns all the nhl_penalties' do
        expect(nhl_penalties.count).to eq 3
      end

      it 'populates the penalty' do
        nhl_penalties.each do |penalty|
          expect(penalty).to be_a Models::Penalty
          expect(penalty.game).to be_a Models::Game
          expect(penalty.league).to be_a Models::League
          expect(penalty.team).to be_a Models::Team


          expect(penalty.away_team).to be_a Models::Team
          expect(penalty.home_team).to be_a Models::Team
          expect(penalty.winning_team).to be_a Models::Team
          expect(penalty.league_abbreviation).to eq 'NHL'
        end

        expect(nhl_penalties.first.away_team_name).to eq 'Columbus'
        expect(nhl_penalties.first.home_team_name).to eq 'Boston'
        expect(nhl_penalties.first.winning_team_name).to eq 'Boston'
        expect(nhl_penalties.first.opponent_name).to eq 'Columbus'
        expect(nhl_penalties.first.opponent_full_name).to eq 'Columbus Blue Jackets'
        expect(nhl_penalties.first.team_name).to eq 'Boston'
        expect(nhl_penalties.first.team_full_name).to eq 'Boston Bruins'
        expect(nhl_penalties.first.city).to eq 'Boston'
        expect(nhl_penalties.first.venue_name).to eq 'TD Garden'
        expect(nhl_penalties.first.player_name).to eq 'David Pastrnak'
        expect(nhl_penalties.first.label).to eq 'Hooking'
        expect(nhl_penalties.first.name).to eq 'hooking'
        expect(nhl_penalties.first.minutes).to eq 2
        expect(nhl_penalties.first.period_number).to eq 2
        expect(nhl_penalties.first.period_seconds).to eq 49
        expect(nhl_penalties.first.seconds).to eq 120
        expect(nhl_penalties.first.team_penalty).to eq false
        expect(nhl_penalties.first.time_code).to eq 'PT0M49S'
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey penalties' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/penalties.json'))

        HockeyPenalties.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/penalties?team_id=nhl-bos")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey penalties' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/penalties.json'))

        penalties = HockeyPenalties.fetch(params: params)

        expect(penalties.count).to eq 3

        penalties.each do |penalty|
          expect(penalty).to be_a Models::Penalty
        end
      end

      def params
        Stattleship::Params::HockeyPenaltiesParams.new.tap do |params|
          params.team_id = 'nhl-bos'
        end
      end
    end
  end
end
