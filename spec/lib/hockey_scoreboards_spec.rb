require 'spec_helper'

module Stattleship
  RSpec.describe HockeyScoreboards do
    describe '#scoreboards' do
      it 'returns all the scoreboards' do
        expect(nhl_scoreboards.count).to eq 64
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/scoreboards.json'))

        HockeyScoreboards.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/scoreboards?game_id=nhl-2016-2017-ott-bos-2017-04-19-1930")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/scoreboards.json'))

        scoreboards = HockeyScoreboards.fetch(params: params)

        expect(scoreboards.count).to eq 64

        scoreboards.each do |scoreboard|
          expect(scoreboard).to be_a Stattleship::Models::Scoreboard
        end
      end

      def params
        Stattleship::Params::HockeyScoreboardsParams.new.tap do |params|
          params.game_id = 'nhl-2016-2017-ott-bos-2017-04-19-1930'
        end
      end
    end
  end

  module Models
    RSpec.describe Scoreboard do
      it 'returns ' do

      end

      describe Game do
        it 'returns a Game' do
          expect(game).to be_a Game
        end

        it 'returns a League' do
          expect(game.league).to be_a League
        end

        it 'returns a Season' do
          expect(game.season).to be_a Season
        end

        it 'returns a Venue' do
          expect(game.venue).to be_a Venue
        end

        it 'returns a home team' do
          expect(game.home_team).to be_a Team
        end

        it 'returns a away team' do
          expect(game.away_team).to be_a Team
        end

        it 'returns a winning team' do
          expect(game.winning_team).to be_a Team
        end

        it 'returns the score' do
          expect(game.score).to eq '1-0'
        end

        it 'returns the city' do
          expect(game.city).to eq 'Boston'
        end

        it 'returns the league_abbreviation' do
          expect(game.league_abbreviation).to eq 'NHL'
        end

        it 'returns the league_name' do
          expect(
            game.league_name
          ).to eq 'National Hockey League'
        end

        def game
          nhl_scoreboards.first.game
        end
      end

      describe 'attributes' do
        it 'returns the city' do
        end

        it 'returns the player_name' do
        end

        it 'returns the league_abbreviation' do
        end

        it 'returns the league_name' do
        end
      end
    end
  end
end
