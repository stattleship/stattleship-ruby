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
      end

      it 'sets penalty properties' do
        penalty = nhl_penalties.first

        expect(penalty.away_team_name).to eq 'Columbus'
        expect(penalty.home_team_name).to eq 'Boston'
        expect(penalty.winning_team_name).to eq 'Boston'
        expect(penalty.opponent_name).to eq 'Columbus'
        expect(penalty.opponent_full_name).to eq 'Columbus Blue Jackets'
        expect(penalty.team_name).to eq 'Boston'
        expect(penalty.team_full_name).to eq 'Boston Bruins'
        expect(penalty.city).to eq 'Boston'
        expect(penalty.venue_name).to eq 'TD Garden'
        expect(penalty.player_name).to eq 'David Pastrnak'
        expect(penalty.label).to eq 'Hooking'
        expect(penalty.name).to eq 'hooking'
        expect(penalty.minutes).to eq 2
        expect(penalty.period_number).to eq 2
        expect(penalty.period_seconds).to eq 49
        expect(penalty.seconds).to eq 120
        expect(penalty.team_penalty).to eq false
        expect(penalty.time_code).to eq 'PT0M49S'
      end

      it 'makes a sentence' do
        penalty = nhl_penalties.first

        expect(penalty.subject_name).to eq('David Pastrnak (Boston)')
        expect(penalty.period_time).to eq('00:49')
        expect(penalty.period_abbreviation).to eq('P')
        expect(penalty.period).to eq('2P')
        expect(penalty.at).to eq('00:49 of 2P')
        expect(penalty.to_sentence).to eq('David Pastrnak (Boston) - Hooking - 2 minutes - 00:49 of 2P - vs Columbus 01/23/16')
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
